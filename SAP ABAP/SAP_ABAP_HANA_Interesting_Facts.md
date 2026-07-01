# SAP ABAP & SAP HANA -- Interesting Facts

## SAP ABAP Facts

### 1. ABAP is older than Java

-   ABAP was created in **1983**.
-   Java was released in **1995**.
-   It has powered enterprise systems for over **40 years**.

### 2. ABAP originally meant something different

Originally, **ABAP** stood for:

> **Allgemeiner Berichtsaufbereitungsprozessor** (German for "General
> Report Preparation Processor")

Today it officially stands for:

> **Advanced Business Application Programming**

### 3. SAP is written mostly in ABAP

Thousands of SAP ERP business applications are implemented in ABAP.

Examples: - Sales - Finance - HR - Manufacturing - Procurement

### 4. Every SAP transaction has a code

  Transaction   Purpose
  ------------- ------------------
  SE11          Data Dictionary
  SE38          Run programs
  SE80          Object Navigator
  SE37          Function Modules
  SE24          Classes
  SM37          Background Jobs
  ST22          Dump Analysis
  SU01          User Management

Experienced SAP developers often know hundreds of transaction codes by
memory.

### 5. Everything is stored in tables

Examples include: - Customers - Employees - Sales Orders - Materials -
Vendors

Almost everything in SAP ultimately resides in database tables.

### 6. ABAP is very database-centric

Most enterprise applications spend significant time: - Reading data -
Updating data - Validating data

ABAP provides built-in SQL syntax for database access.

### 7. ABAP now supports Object-Oriented Programming

Modern ABAP includes: - Classes - Interfaces - Inheritance -
Polymorphism - Encapsulation - Exceptions

Earlier ABAP was primarily procedural.

### 8. ABAP has automatic database buffering

Frequently accessed tables can be buffered in memory, reducing database
calls and improving performance.

### 9. ABAP includes its own debugger

The ABAP debugger lets developers: - Change variable values during
execution - Skip code - Set watchpoints - Trace execution - Inspect
internal tables

### 10. SAP systems process millions of business transactions daily

Large organizations can process: - Thousands of invoices - Millions of
records - Massive financial postings

ABAP is designed for high reliability and consistency.

------------------------------------------------------------------------

# SAP HANA Facts

### 11. HANA is an in-memory database

Unlike traditional databases that read mainly from disks, HANA keeps
most active data in **RAM**, enabling much faster access.

### 12. HANA can be thousands of times faster

Complex reports that once took hours may complete in seconds or minutes,
depending on the workload and data model.

### 13. HANA is both a database and an application platform

It supports: - SQL - Stored procedures - Graph processing - Text
search - Predictive analytics - Machine learning integration

### 14. HANA stores data in columns

Traditional databases commonly use row storage.

HANA primarily uses **columnar storage**, which is efficient for: -
Aggregations - Analytics - Business Intelligence

### 15. HANA compresses data heavily

Columnar storage often enables strong compression, reducing memory usage
while improving query performance.

### 16. HANA can process billions of rows quickly

It is optimized for: - Large joins - Aggregations - Parallel execution

### 17. HANA uses parallel processing

Modern servers may have dozens or even hundreds of CPU cores.

HANA distributes work across many cores simultaneously.

### 18. HANA eliminates many aggregate tables

Older SAP systems often required: - Summary tables - Precomputed
totals - Batch processing

HANA can calculate many results on demand.

### 19. HANA changed how ABAP is written

Developers are encouraged to: - Push calculations to the database -
Reduce data transfer - Write optimized Open SQL - Use CDS Views - Use
AMDP where appropriate

This principle is known as **Code Pushdown**.

### 20. CDS Views are one of HANA's biggest innovations

Core Data Services (CDS) allow developers to: - Define data models -
Create reusable views - Add annotations - Implement authorization
checks - Build APIs for applications

Many modern SAP applications rely heavily on CDS.

------------------------------------------------------------------------

# ABAP on HANA Changes Everything

## Before HANA

``` text
Database
    ↓
ABAP reads everything
    ↓
ABAP performs calculations
    ↓
Output
```

## With HANA

``` text
Database performs calculations
       ↓
Only the required result is sent to ABAP
       ↓
Faster applications
```

------------------------------------------------------------------------

# Interview Facts

-   Open SQL is database-independent.
-   Native SQL is database-specific.
-   HANA encourages Code Pushdown.
-   CDS Views can replace many traditional database views.
-   AMDP allows writing SQLScript procedures from ABAP.
-   Internal tables are memory-resident and central to ABAP programming.
-   Efficient database access has a greater impact on performance than
    complex ABAP logic.
-   Avoid `SELECT *` in production code when possible.
-   Avoid database operations inside loops.

------------------------------------------------------------------------

# Fun Facts

-   SAP software is used by many of the world's largest enterprises.
-   ABAP remains one of the highest-paying enterprise programming skills
    in many regions.
-   SAP HANA can manage terabytes of in-memory data on appropriately
    sized hardware.
-   Modern SAP S/4HANA applications are optimized specifically for SAP
    HANA.
