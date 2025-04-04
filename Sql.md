# SQL CRUD Operations Cheat Sheet

## 📝 1. CREATE (Insert Data)
```sql
-- Insert a single row
INSERT INTO users (name, email, age) 
VALUES ('John Doe', 'john@example.com', 25);

-- Insert multiple rows
INSERT INTO users (name, email, age) 
VALUES 
    ('Alice', 'alice@example.com', 30),
    ('Bob', 'bob@example.com', 28);
```

## 📖 2. READ (Retrieve Data)
```sql
-- Select all columns from a table
SELECT * FROM users;

-- Select specific columns
SELECT name, email FROM users;

-- Filter data using WHERE clause
SELECT * FROM users WHERE age > 25;

-- Sort results
SELECT * FROM users ORDER BY age DESC;

-- Limit the number of results
SELECT * FROM users LIMIT 5;
```

## 📝 3. UPDATE (Modify Data)
```sql
-- Update a single column
UPDATE users 
SET age = 26 
WHERE name = 'John Doe';

-- Update multiple columns
UPDATE users 
SET age = 32, email = 'newalice@example.com' 
WHERE name = 'Alice';
```

## 🗑️ 4. DELETE (Remove Data)
```sql
-- Delete specific row(s)
DELETE FROM users WHERE name = 'Bob';

-- Delete all rows (⚠️ Use with caution)
DELETE FROM users;

-- Delete all rows and reset identity column (⚠️ Irreversible)
TRUNCATE TABLE users;
```

## ⚡ Table Structure Management
```sql
-- Create Table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    age INT
);

-- Drop Table
DROP TABLE users;
```
