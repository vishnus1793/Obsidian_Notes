# Spring Boot Knowledge Dump

## 1. Core Concepts
- **Spring Boot**: Opinionated framework for rapid Spring-based application development.  
- **Spring Framework**: Provides dependency injection (DI), aspect-oriented programming (AOP), and transaction management.  
- **Spring Boot Starters**: Pre-configured dependency bundles (`spring-boot-starter-web`, `spring-boot-starter-data-jpa`).  
- **Spring Boot Auto-Configuration**: Scans the classpath and configures beans automatically (`@EnableAutoConfiguration`).  
- **Spring Boot CLI**: Runs Groovy scripts without needing a full application setup.  

## 2. Annotations

### Core Spring Boot
- `@SpringBootApplication`: Combines `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.
- `@ComponentScan`: Scans for `@Component`, `@Service`, `@Repository`, and `@Controller` beans.
- `@Configuration`: Defines a class as a source of Spring bean definitions.
- `@Bean`: Declares a bean manually inside a `@Configuration` class.

### Web Layer
- `@RestController`: Combination of `@Controller` + `@ResponseBody`.
- `@RequestMapping("/path")`: Maps HTTP requests to methods.
  - Variants: `@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`.
- `@PathVariable`: Extracts values from URI (`/user/{id}`).
- `@RequestParam`: Extracts query parameters (`?name=John`).
- `@RequestBody`: Maps request body to an object (`POST` requests).
- `@ResponseStatus`: Defines HTTP response status.

### Service Layer
- `@Service`: Declares a service class.
- `@Transactional`: Manages database transactions.

### Persistence Layer
- `@Repository`: Marks a class as a DAO (Data Access Object).
- `@Entity`: Declares a JPA entity (used with Hibernate).
- `@Id`: Marks a field as a primary key.
- `@GeneratedValue(strategy = GenerationType.IDENTITY)`: Auto-increments ID.
- `@Column(name="column_name")`: Maps entity field to a database column.
- `@ManyToOne`, `@OneToMany`, `@OneToOne`, `@ManyToMany`: Define relationships.

## 3. Dependency Injection (DI)

### Field Injection (Avoid):
```java
@Autowired
private MyService myService;
```

### Constructor Injection (Recommended):
```java
@Service
public class MyService {
    private final Repository repo;
    public MyService(Repository repo) { this.repo = repo; }
}
```

### Setter Injection (Less preferred):
```java
@Autowired
public void setService(MyService service) { this.service = service; }
```

## 4. Spring Boot Data Access

### JPA with Spring Data
```java
public interface UserRepository extends JpaRepository<User, Long> { }
```

### Custom Query Methods
```java
List<User> findByName(String name);
List<User> findByAgeGreaterThan(int age);
```

### Native SQL Queries
```java
@Query("SELECT * FROM users WHERE email = ?1", nativeQuery = true)
```

## 5. Spring Boot Security

### JWT Authentication Flow
1. Generate JWT on login.
2. Validate JWT in request headers.
3. Use `OncePerRequestFilter` to intercept requests and verify tokens.

### Security Configuration
```java
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/public/**").permitAll()
                .anyRequest().authenticated())
            .sessionManagement(sess -> sess.sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        return http.build();
    }
}
```

## 6. Caching

### Enable Caching
```java
@EnableCaching
@SpringBootApplication
public class MyApp { }
```

### Use Cache in Methods
```java
@Cacheable("users")
public User getUser(Long id) { return userRepository.findById(id).orElse(null); }
```

## 7. Spring Boot Messaging (RabbitMQ)

### Producer
```java
@Autowired private AmqpTemplate template;
public void send(String message) { template.convertAndSend("exchange", "routingKey", message); }
```

### Consumer
```java
@RabbitListener(queues = "myQueue")
public void consume(String message) { System.out.println("Received: " + message); }
```

## 8. Spring Boot Microservices

### Eureka Server (Service Discovery)
```java
@EnableEurekaServer
@SpringBootApplication
public class EurekaServer { }
```

### Eureka Client
```java
@EnableEurekaClient
@SpringBootApplication
public class MyService { }
```

### Feign Client (Inter-Service Communication)
```java
@FeignClient(name = "user-service")
public interface UserClient {
    @GetMapping("/users/{id}")
    User getUser(@PathVariable Long id);
}
```

## 9. Spring Boot Actuator
- Exposes production-ready endpoints (`/actuator/health`, `/actuator/metrics`).  
- Enable specific endpoints in `application.properties`:  
  ```properties
  management.endpoints.web.exposure.include=health,info
  ```

## 10. Spring Boot Testing

### Unit Testing with JUnit & Mockito
```java
@ExtendWith(MockitoExtension.class)
public class UserServiceTest {
    @Mock private UserRepository userRepository;
    @InjectMocks private UserService userService;
}
```

### Integration Testing
```java
@SpringBootTest
@RunWith(SpringRunner.class)
public class MyIntegrationTest { }
```

## 11. Spring Boot Configuration

### application.properties vs. YAML
#### `application.properties`
```properties
server.port=8081
spring.datasource.url=jdbc:mysql://localhost:3306/db
```
#### `application.yml`
```yaml
server:
  port: 8081
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/db
```

## 12. Spring Boot Dockerization

### Dockerfile
```dockerfile
FROM openjdk:17
COPY target/app.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
```

### Run the Container
```sh
docker build -t myapp .
docker run -p 8080:8080 myapp
```

## Final Thoughts
- Use `spring-boot-devtools` for auto-reload during development.
- Prefer **constructor injection** over field injection.
- Optimize queries using `@Query` and indexing.
- Use **Spring Cloud** for microservice resilience (`Hystrix`, `Ribbon`).
- Profile-based configurations: `@Profile("dev")`, `@Profile("prod")`.
- Spring Boot 3+ uses Jakarta EE instead of Java EE.

