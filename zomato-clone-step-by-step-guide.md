# Zomato Clone — Step-by-Step Build Guide

A practical, in-order path from empty folder to working portfolio project. Each phase ends with something you can actually run and demo — don't skip ahead until that's true.

---

## Phase 0 — Environment Setup

1. Install **Java 17+**, **Maven** (or Gradle), **Docker Desktop**, **Postman** (or Insomnia).
2. Spin up your infra with Docker Compose so you're not installing Postgres/Redis/Elasticsearch natively:

```yaml
# docker-compose.yml
version: "3.8"
services:
  postgres:
    image: postgres:16
    environment:
      POSTGRES_DB: zomato
      POSTGRES_USER: zomato_user
      POSTGRES_PASSWORD: zomato_pass
    ports: ["5432:5432"]
    volumes: ["pgdata:/var/lib/postgresql/data"]

  redis:
    image: redis:7
    ports: ["6379:6379"]

  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.13.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
    ports: ["9200:9200"]

volumes:
  pgdata:
```

Run `docker compose up -d` and confirm all three containers are healthy (`docker ps`) before moving on.

3. Generate the project skeleton at [start.spring.io](https://start.spring.io) with: Web, Spring Data JPA, PostgreSQL Driver, Spring Data Redis, Spring Data Elasticsearch, Spring Security, Validation, Lombok. Add `redisson`, `bucket4j-redis`, and `stripe-java` manually to `pom.xml` afterward — they're not on start.spring.io.

**Checkpoint:** `mvn spring-boot:run` starts cleanly and connects to Postgres (check the startup logs for connection errors).

---

## Phase 1 — Core Domain: Entities, Repositories, Basic CRUD

Build bottom-up: entities → repositories → services → controllers. Don't write a controller before its service exists.

1. Create JPA entities matching the DDL from the blueprint doc: `User`, `Restaurant`, `MenuItem`, `Order`, `OrderItem`, `Payment`. Use `@Entity`, `@Table`, `@Id @GeneratedValue`, and map relationships (`@ManyToOne`, `@OneToMany`) carefully — get the foreign keys right here, it's painful to fix later.
2. Let Hibernate generate the schema first (`spring.jpa.hibernate.ddl-auto=update`) to sanity-check your entity mappings, **then** switch to running the real DDL by hand once mappings are stable (`ddl-auto=validate`) — this is the standard "prototype then lock down" workflow.
3. Write `JpaRepository` interfaces for each entity.
4. Build plain CRUD services + REST controllers for `Restaurant` and `MenuItem` (create/read/update/delete). No security, no caching yet — just get data in and out.

**Checkpoint:** Via Postman, you can create a restaurant, add menu items to it, and fetch them back. This is your foundation — everything else layers on top.

---

## Phase 2 — Authentication & RBAC

1. Add `User` registration (`/api/auth/register`) and login (`/api/auth/login`) endpoints. Hash passwords with `BCryptPasswordEncoder`.
2. Implement JWT issuing on login (a filter that generates a signed token containing `userId` and `role`).
3. Add a `JwtAuthenticationFilter` that reads the token from the `Authorization` header on every request and populates the `SecurityContext`.
4. Configure `SecurityFilterChain` with role-based rules, e.g.:
   - `POST /api/restaurants/**` → `ROLE_RESTAURANT_OWNER` or `ROLE_ADMIN`
   - `GET /api/restaurants/**` → public
   - `POST /api/orders/**` → `ROLE_CUSTOMER`

**Checkpoint:** A logged-in customer token can't hit restaurant-owner-only endpoints (expect a 403), and an unauthenticated request to a protected endpoint gets a 401.

---

## Phase 3 — Order Placement (No Concurrency Yet)

1. Build the cart → checkout → order flow as plain, single-transaction service methods first. Ignore Redis locking for now — get the happy path (correct totals, order + order_items rows created) working and tested.
2. Wire `@Transactional` boundaries so a failure partway through rolls back cleanly (e.g., invalid menu item ID shouldn't leave a half-created order).

**Checkpoint:** A customer can place an order with multiple items and see it land correctly in `orders` + `order_items`, with the right `total_amount`.

---

## Phase 4 — Redis Caching

1. Add the `RedisCacheConfig` from the blueprint doc.
2. Apply `@Cacheable` to `GET` restaurant listing and menu endpoints.
3. Apply `@CacheEvict` on the corresponding update endpoints.
4. Verify with `redis-cli MONITOR` running in a terminal — watch cache keys get set on first read and evicted on update.

**Checkpoint:** Second call to a menu endpoint is visibly faster (log Postgres query counts or just watch `MONITOR` — you should see zero DB hits on the cached path until eviction).

---

## Phase 5 — Distributed Locking for Inventory

1. Add Redisson (`RedissonClient` bean pointing at your Redis container).
2. Mark a couple of menu items `is_promotional = true` with a `stock_quantity`.
3. Implement `OrderPlacementService.placeOrder` from the blueprint — lock per menu item, re-check stock inside the lock, decrement, release.
4. **Stress-test it deliberately:** write a small script (or use `hey`/`ab`/a JMeter plan) that fires 50 concurrent order requests for the same promotional item with only 10 in stock. Confirm exactly 10 succeed and 40 get a clean "out of stock" or "retry" response — not overselling, not deadlocking.

**Checkpoint:** This concurrency test passing reliably is the single most impressive thing you can show in an interview about this project — it's proof, not just a claim.

---

## Phase 6 — Stripe Integration

1. Create a free Stripe account, grab test-mode API keys.
2. Implement checkout: your order-confirm endpoint creates a Stripe `PaymentIntent` and returns the `client_secret` to the frontend/Postman for confirmation.
3. Install the [Stripe CLI](https://stripe.com/docs/stripe-cli) and run `stripe listen --forward-to localhost:8080/api/webhooks/stripe` to forward test webhook events to your local server.
4. Implement the webhook controller + `PaymentService` from the blueprint.
5. Trigger `stripe trigger payment_intent.succeeded` from the CLI and confirm your order flips to `CONFIRMED` in the database.
6. **Test idempotency directly:** fire the same webhook event twice (Stripe CLI lets you resend) and confirm the second one is a no-op, not a duplicate confirmation or an exception.

**Checkpoint:** End-to-end — place order, pay via Stripe test card, webhook fires, order status updates automatically.

---

## Phase 7 — Elasticsearch Search

1. Add the `RestaurantDocument` entity and `RestaurantSearchRepository`.
2. Write a sync step: whenever a restaurant or menu item is created/updated, push the denormalized document to Elasticsearch (start simple — do it synchronously in the same service call; optimize to async/event-driven later if you want to talk about that tradeoff in an interview).
3. Implement `fuzzySearch` from the blueprint and expose it via a `GET /api/search?q=...` endpoint.
4. Test fuzzy matching deliberately: search "pzza" and confirm restaurants with "pizza" in the name or menu still show up.

**Checkpoint:** Typo-tolerant search working end-to-end against real indexed data.

---

## Phase 8 — Rate Limiting

1. Add the Bucket4j + Redis filter from the blueprint.
2. Hit any endpoint 101+ times in a minute from a script and confirm the 101st request gets a 429.

**Checkpoint:** Rate limiting demonstrably kicks in and is Redis-backed (check `redis-cli KEYS "*bucket*"`).

---

## Phase 9 — Scheduled Jobs

1. Add `@EnableScheduling` and a couple of `@Scheduled` methods:
   - Nightly: expire promotions past their end date.
   - Daily: generate a basic report (orders count, revenue) written to a `reports` table or logged.
2. Test by temporarily setting the cron expression to run every 10 seconds, confirm it fires, then set it back to the real schedule.

**Checkpoint:** Logs show the job firing on schedule without manual triggering.

---

## Phase 10 — Structured Logging & Observability

1. Add `logback-spring.xml` with the JSON encoder from the blueprint.
2. Wrap order status transitions with MDC as shown.
3. Pull up the logs and confirm you can `grep` a single `orderId` and see its entire lifecycle (created → payment confirmed → preparing → delivered) as a clean trail.

**Checkpoint:** You can explain, log line by log line, exactly what happened to a specific order — this is what "observability" means in practice, and it's a strong thing to walk an interviewer through.

---

## Phase 11 — Load Testing & Polish

1. Use JMeter, k6, or `hey` to simulate the "5,000 orders/hour" target (~1.4 requests/sec sustained — very achievable, the point is showing you *measured* it, not just claimed it).
2. Record before/after cache-hit metrics, lock contention behavior, and rate-limit behavior under load.
3. Write a `README.md` documenting architecture, setup steps, and these test results — this is what turns "I built a CRUD app" into "I built and validated a system," which is the actual portfolio differentiator.

---

## How to Pace This

Don't try to build all 11 phases before testing anything — each phase's checkpoint is a hard gate. If Phase 5's concurrency test isn't passing reliably, fix that before touching Stripe. A working Phase 4 you understand deeply beats a "complete" project with parts you can't explain.

Want to start with Phase 0/1 in detail — actual `pom.xml` dependencies and entity code — or do you already have the skeleton running and want to jump into Phase 2 (auth)?
