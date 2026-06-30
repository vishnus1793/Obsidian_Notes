# 📋 Comprehensive Interview Syllabus: Vishnu Sakthi

## 1. Core Technical Skills & Computer Science Fundamentals

### ☕ Java & 🐍 Python Core
* **Java Memory & Execution:** Compilation vs. interpretation (JIT compiler, JVM architecture). Garbage collection mechanisms and memory leaks in Java[cite: 1].
* **Java Collection Framework:** Internal workings of `HashMap` (hashing, collisions, treeifying), `ArrayList` vs. `LinkedList`, and thread-safe collections (e.g., `ConcurrentHashMap`)[cite: 1].
* **Python Concurrency:** The Global Interpreter Lock (GIL) and its impact on multi-threading. Asynchronous programming using `asyncio`, event loops, and `async/await` syntax[cite: 1].
* **Python Memory Management:** Reference counting, cyclic garbage collection, and the difference between shallow copy and deep copy[cite: 1].

### 🧩 Object-Oriented Programming (OOP)
* **Four Pillars:** Real-world implementation examples of Encapsulation, Abstraction, Inheritance, and Polymorphism in your projects[cite: 1].
* **Design Patterns:** Singleton, Factory, and Observer patterns—where and how they apply to backend system development[cite: 1].
* **Interfaces vs. Abstract Classes:** Differences in Java and Python, and when to choose one over the other[cite: 1].

### 📊 Data Structures & Algorithms (DSA)
* **Time & Space Complexity:** Big O analysis of everyday data operations and recursive algorithms[cite: 1].
* **Core Data Structures:** String manipulation, array rotations, sliding window techniques, two-pointer approaches, and linked list traversals[cite: 1].
* **Trees & Graphs:** Binary Search Trees (BST), Breadth-First Search (BFS), and Depth-First Search (DFS) applications in network-based structures like your mind map generator[cite: 1].

### 🗄️ Database Management Systems (DBMS) & REST APIs
* **SQL vs. NoSQL Architecture:** Relational ACID properties (Atomicity, Consistency, Isolation, Durability) vs. NoSQL BASE properties (Basically Available, Soft state, Eventual consistency)[cite: 1].
* **MongoDB Performance:** Indexing strategies (Single field, Compound, Text indexes), write concerns, and maximizing the Aggregation Pipeline efficiency[cite: 1].
* **RESTful API Design:** HTTP methods (GET, POST, PUT, DELETE, PATCH), idempotency, standard status codes (2xx, 3xx, 4xx, 5xx), and designing versioned endpoints (e.g., `/api/v1/`)[cite: 1].

---

## 2. In-Depth Project Breakdowns & System Architecture

### 🏨 Project 1: Room Booking System
> **Stack:** Flask, MongoDB, JWT, Bcrypt[cite: 1]

* **Authentication & State:** 
  * How JSON Web Tokens (JWT) work end-to-end (Header, Payload, Signature)[cite: 1].
  * How to securely handle token expiration, revocation, and where to store tokens on the frontend (Local storage vs. HttpOnly cookies)[cite: 1].
* **Security & Hashing:**
  * Why `bcrypt` is computationally slow by design (work factor/salting) and how it thwarts brute-force and rainbow table attacks compared to MD5 or SHA-256[cite: 1].
* **Concurrency & Validation:**
  * How to implement conflict-free date validation logic in MongoDB to block double-bookings under race conditions (e.g., using atomic operators like `$setOnInsert` or unique compound indexes)[cite: 1].
* **Role-Based Access Control (RBAC):**
  * Designing middleware/decorators in Flask to safeguard admin routes from unauthorized user tampering[cite: 1].

### 🕸️ Project 2: Web Scraper & Mind Map Generator
> **Stack:** FastAPI, BeautifulSoup, Sumy[cite: 1]

* **Framework Architecture:**
  * Why FastAPI outperforms Flask for I/O-bound tasks (Asynchronous Server Gateway Interface / ASGI vs. Web Server Gateway Interface / WSGI)[cite: 1].
  * Data validation using Pydantic models[cite: 1].
* **Data Scraping & Extraction:**
  * Handling edge cases in `BeautifulSoup`: Dealing with dynamic JavaScript-rendered content, anti-scraping firewalls, User-Agent rotation, and rate-limiting[cite: 1].
* **Natural Language Processing (NLP) Summarization:**
  * **LSA (Latent Semantic Analysis):** Mathematical concept (Singular Value Decomposition) used to extract latent topics[cite: 1].
  * **TextRank:** Graph-based extractive summarization algorithm (similar to PageRank) identifying central sentences[cite: 1].
  * **AI Fallback Mechanism:** How the system detects poor extractive summaries and routes requests to generative AI backups[cite: 1].
* **Graph Data Structures:**
  * Structuring hierarchical and network-based mind maps into optimized JSON schemas for rendering on the frontend[cite: 1].

### 🔍 Project 3: Multi-Search Engine Summarizer
> **Stack:** Python, LLaMA3, Ollama, LLaMAIndex, Asyncio[cite: 1]

* **Asynchronous Processing:**
  * Orchestrating concurrent HTTP requests to Google and DuckDuckGo using `aiohttp` or `httpx` to minimize response times[cite: 1].
* **Caching Strategy:**
  * Designing a 24-hour time-to-live (TTL) caching layer to prevent redundant downstream API calls and cut operational latency[cite: 1].
* **Local LLM Deployment:**
  * Running heavy open-source models like **LLaMA3** locally using **Ollama**'s execution environment[cite: 1].
  * **LLaMAIndex Integration:** Data ingestion, indexing strategies, chunk sizing, overlap configurations, and orchestrating Retrieval-Augmented Generation (RAG)[cite: 1].

### 📈 Project 4: Stock Price Prediction Using Machine Learning
> **Stack:** Python, Scikit-learn, Time-Series Forecasting[cite: 1]

* **Time-Series Feature Engineering:**
  * Creating lag features (e.g., $t-1$, $t-2$ close prices) and why they are vital to capture sequential trends[cite: 1].
  * Deriving calendar-based features (day of the week, month, seasonality impacts) to isolate cyclical trading behaviors[cite: 1].
* **Modeling & Limitations:**
  * Applying Linear Regression to financial data: Assumptions of linear regression (linearity, homoscedasticity, independence, normality)[cite: 1].
  * Why traditional linear models struggle with highly volatile, non-linear stock market trends, and how advanced approaches (ARIMA, Prophet, or LSTMs) address this[cite: 1].
* **Validation & Evaluation Metrics:**
  * Why standard random cross-validation fails on time-series data (data leakage from the future) and how to execute a proper TimeSeriesSplit[cite: 1].
  * Mathematical understanding and practical interpretation of Root Mean Squared Error ($RMSE$)[cite: 1].

---

## 3. DevOps, Cloud, & Infrastructure Automation

### 🐳 Docker & Containerization
* **Core Concepts:** Image layers, container isolation, namespaces, control groups (cgroups), and the differences between containers and Virtual Machines (VMs)[cite: 1].
* **Optimization:** Writing efficient multi-stage `Dockerfiles` to minimize image sizes, and using `.dockerignore`[cite: 1].
* **Orchestration:** Container scheduling, services, scaling, and network clustering using Docker Swarm and Kubernetes architecture (Pods, Deployments, Services)[cite: 1].

### 🏗️ Terraform (Infrastructure as Code)
* **State Management:** The purpose of the `terraform.tfstate` file, state locking, and secure remote state storage (e.g., AWS S3 with DynamoDB)[cite: 1].
* **Lifecycle & Declarative Workflow:** Explaining `terraform plan`, `apply`, and `destroy`, and how declarative configuration differs from imperative scripting[cite: 1].

### ☁️ Cloud (AWS) & Deployment
* **Compute & Storage:** Setting up, securing, and scaling **EC2** instances (Security Groups, IAM roles) and managing object storage via **S3** buckets[cite: 1].
* **CI/CD Pipelines:** Setting up automated pipelines (GitHub Actions, GitLab CI, or Jenkins) to lint, test, build Docker images, and deploy applications automatically[cite: 1].

---

## 4. Behavioral, Agile, & Hackathon Scenario Questions

### ⏱️ Hackathon Dynamics (24-Hour & 30-Hour Sprints)
* **Trade-offs under Pressure:** "During your KEC hackathons, how did you balance building a functional prototype with clean, scalable code architecture[cite: 1]?"
* **Scope Management:** "How did you identify the Minimum Viable Product (MVP) features versus nice-to-have features under strict 24/30-hour deadlines[cite: 1]?"
* **Conflict Resolution:** "Describe a situation where your 3-member team disagreed on a technical choice or feature execution during the sprint. How did you resolve it[cite: 1]?"

### 🏃 Agile Methodologies
* **Workflows:** Standard Agile practices including Sprint Planning, Daily Stand-ups, Sprint Reviews, and Retrospectives[cite: 1].
* **Task Delegation:** How you breakdown massive project requirements into small, manageable issues or user stories[cite: 1].