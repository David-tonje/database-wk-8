# Library Management System Database

## Overview
This project implements a **relational database** for a Library Management System using **MySQL**.  
It is designed to manage library members, books, authors, and borrowing records efficiently while maintaining data integrity.

---

## Features
- Well-structured relational tables:
  - **Members** – stores library members’ details.  
  - **Authors** – stores author information.  
  - **Books** – stores book information.  
  - **BookAuthors** – handles the many-to-many relationship between books and authors.  
  - **BorrowRecords** – tracks books borrowed by members.  

- Proper **constraints**:
  - Primary Keys (`PRIMARY KEY`)  
  - Foreign Keys (`FOREIGN KEY`)  
  - Unique constraints (`UNIQUE`)  
  - Mandatory fields (`NOT NULL`)  

- Relationships:
  - **One-to-Many**: Members → BorrowRecords, Books → BorrowRecords  
  - **Many-to-Many**: Books ↔ Authors via BookAuthors  

---

## Database Schema

**Tables and Relationships:**

1. **Members**  
   - `MemberID` (PK)  
   - `FullName`  
   - `Email` (Unique)  
   - `PhoneNumber`  
   - `JoinDate`  

2. **Authors**  
   - `AuthorID` (PK)  
   - `FullName`  
   - `Bio`  

3. **Books**  
   - `BookID` (PK)  
   - `Title`  
   - `ISBN` (Unique)  
   - `PublicationYear`  
   - `CopiesAvailable`  

4. **BookAuthors** (Many-to-Many)  
   - `BookID` (FK → Books)  
   - `AuthorID` (FK → Authors)  

5. **BorrowRecords** (One-to-Many)  
   - `BorrowID` (PK)  
   - `MemberID` (FK → Members)  
   - `BookID` (FK → Books)  
   - `BorrowDate`  
   - `DueDate`  
   - `ReturnDate`  

---

## How to Use
1. Open **MySQL Workbench** or any MySQL client.  
2. Run the `library_management.sql` file to create the database, tables, and sample data.  
3. Use `SELECT` queries to retrieve data:  
   - List all borrowed books with member details.  
   - List all books with their authors.  
4. Add, update, or remove records using `INSERT`, `UPDATE`, and `DELETE` queries as needed.  

---

## Notes
- The database enforces **referential integrity** using foreign key constraints.  
- Many-to-many relationships are resolved using junction tables (`BookAuthors`).  
- Sample data is included for testing and demonstration purposes.  
