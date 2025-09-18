-- ====================================================
-- Assignment: Complete Database Management System
-- Use Case: Library Management System
-- ====================================================

-- ============================
-- Step 1: Create Database
-- ============================
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- ============================
-- Step 2: Create Tables
-- ============================

-- Table: Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    JoinDate DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Bio TEXT
);

-- Table: Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublicationYear YEAR,
    CopiesAvailable INT DEFAULT 1 NOT NULL
);

-- Table: BookAuthors (Many-to-Many relationship between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- Table: BorrowRecords
CREATE TABLE BorrowRecords (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL DEFAULT CURRENT_DATE,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);

-- ============================
-- Step 3: Sample Data (Optional)
-- ============================
INSERT INTO Members (FullName, Email, PhoneNumber)
VALUES
('John Doe', 'john@example.com', '0712345678'),
('Jane Smith', 'jane@example.com', '0723456789');

INSERT INTO Authors (FullName, Bio)
VALUES
('J.K. Rowling', 'Author of Harry Potter series'),
('George Orwell', 'Author of 1984 and Animal Farm');

INSERT INTO Books (Title, ISBN, PublicationYear, CopiesAvailable)
VALUES
('Harry Potter and the Sorcerer''s Stone', '9780439708180', 1997, 5),
('1984', '9780451524935', 1949, 3);

INSERT INTO BookAuthors (BookID, AuthorID)
VALUES
(1, 1),
(2, 2);

INSERT INTO BorrowRecords (MemberID, BookID, BorrowDate, DueDate)
VALUES
(1, 1, '2025-09-18', '2025-10-02'),
(2, 2, '2025-09-18', '2025-10-02');

-- ============================
-- Step 4: Verification Queries
-- ============================
-- List all borrowed books with member info
SELECT br.BorrowID, m.FullName AS Member, b.Title AS Book, br.BorrowDate, br.DueDate, br.ReturnDate
FROM BorrowRecords br
INNER JOIN Members m ON br.MemberID = m.MemberID
INNER JOIN Books b ON br.BookID = b.BookID;

-- List all books with their authors
SELECT b.Title AS Book, a.FullName AS Author
FROM Books b
INNER JOIN BookAuthors ba ON b.BookID = ba.BookID
INNER JOIN Authors a ON ba.AuthorID = a.AuthorID;
