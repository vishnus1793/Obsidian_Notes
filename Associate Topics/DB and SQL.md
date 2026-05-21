# 💾 Ultimate Guide: Database & SQL - Pure Wisdom

## 🔧 DATABASE FUNDAMENTALS

### 1. What is a Database?
- A **structured collection** of data stored electronically.
- Managed by a **Database Management System (DBMS)**.

---

### 2. Types of Databases
- **Relational (RDBMS)** – SQL-based (MySQL, PostgreSQL, Oracle, SQL Server)
- **NoSQL** – Non-tabular (MongoDB, Redis, Cassandra)

---

### 3. Database Terminology
- **Table**: Collection of rows (records) and columns (fields)
- **Row / Record**: A single data entry
- **Column / Field**: An attribute of data
- **Schema**: Structure of the database
- **Primary Key**: Uniquely identifies each row
- **Foreign Key**: Refers to a primary key in another table
- **Index**: Speeds up search queries
- **Normalization**: Eliminate data redundancy

---

### 4. Normalization Forms
- **1NF**: Atomic values (no repeating groups)
- **2NF**: 1NF + no partial dependencies
- **3NF**: 2NF + no transitive dependencies

---

## ⚔️ SQL (Structured Query Language)

### 5. Core SQL Commands

#### 🟩 DDL (Data Definition Language)
- `CREATE TABLE` – Make a table  
- `ALTER TABLE` – Modify table  
- `DROP TABLE` – Delete table  
- `TRUNCATE TABLE` – Delete all rows (no rollback)

#### 🟦 DML (Data Manipulation Language)
- `SELECT` – Read data  
- `INSERT INTO` – Add data  
- `UPDATE` – Modify data  
- `DELETE` – Remove data

#### 🟧 DCL (Data Control Language)
- `GRANT` – Give privileges  
- `REVOKE` – Remove privileges

#### 🟥 TCL (Transaction Control Language)
- `BEGIN` – Start a transaction  
- `COMMIT` – Save changes  
- `ROLLBACK` – Undo changes

---

### 6. SELECT Statement Syntax
```sql
SELECT column1, column2
FROM table
WHERE condition
GROUP BY column
HAVING aggregate_condition
ORDER BY column ASC|DESC
LIMIT n;
```

---

### 7. Operators
- **Arithmetic**: `+ - * / %`
- **Comparison**: `= != < > <= >=`
- **Logical**: `AND`, `OR`, `NOT`
- **Special**: `BETWEEN`, `IN`, `LIKE`, `IS NULL`

---

### 8. Joins
```sql
SELECT ...
FROM A
JOIN B ON A.id = B.a_id;
```
- **INNER JOIN**: Matching rows only  
- **LEFT JOIN**: All from A + matching from B  
- **RIGHT JOIN**: All from B + matching from A  
- **FULL OUTER JOIN**: All from both, null where no match  
- **SELF JOIN**: Table joined with itself

---

### 9. Subqueries
- Nested `SELECT` inside `WHERE`, `FROM`, or `SELECT`
```sql
SELECT * FROM users
WHERE id IN (SELECT user_id FROM orders);
```

---

### 10. Aggregate Functions
- `COUNT()` – Number of rows  
- `SUM()` – Total of values  
- `AVG()` – Mean value  
- `MIN()` / `MAX()` – Min/Max values  
- Used with `GROUP BY`

---

### 11. Constraints
- `PRIMARY KEY` – Unique + not null  
- `FOREIGN KEY` – Enforces referential integrity  
- `UNIQUE` – Ensures all values are different  
- `NOT NULL` – Column must have a value  
- `CHECK` – Validates data on insert/update  
- `DEFAULT` – Sets default value

---

### 12. Indexes
- Improve `SELECT` speed
```sql
CREATE INDEX idx_name ON table (column);
```
- Avoid indexing frequently updated columns

---

### 13. Views
- Virtual table based on a query
```sql
CREATE VIEW my_view AS
SELECT name, salary FROM employees
WHERE salary > 50000;
```

---

### 14. Stored Procedures
- Saved SQL logic you can execute
```sql
CREATE PROCEDURE GetUsers()
BEGIN
  SELECT * FROM users;
END;
```

---

### 15. Transactions
Ensure **ACID** properties (Atomicity, Consistency, Isolation, Durability)
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

---

## 🚀 OPTIMIZATION & TIPS

- Use `EXPLAIN` to analyze query performance.
- Use indexes wisely.
- Avoid `SELECT *` in production queries.
- Normalize, then denormalize if needed for performance.
- Keep transactions short.
- Use parameterized queries to prevent SQL Injection.

---

## 🧠 Real-world Tips

- Know how to backup and restore databases.
- Understand isolation levels (`READ COMMITTED`, `REPEATABLE READ`, etc.).
- Learn how deadlocks happen and how to avoid them.
- Use ORM (like Sequelize, Hibernate) but **know raw SQL**.
- Practice with SQL engines like SQLite, MySQL, PostgreSQL.

---


