--Author: Austin Erben
--Date: 10/14/2024
--Description: 
	-- Part 2 of the Bluestaq database challenge #1
	-- Generates a relational schema for the library management system


-- Authors Table: One to many relationship with the books table
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

-- Borrowers Table: One to many relationship with the books table
CREATE TABLE Borrowers (
    borrower_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);

-- Books Table
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY, --inherently indexed
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL UNIQUE, --inherently indexed
    publication_date DATE,
    author_id INT,
    borrower_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE SET NULL,
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id) ON DELETE SET NULL
);

-- Create extra indexes based on access patterns. Note that book_id and isbn are already indexed.
-- Here I am assuming data is also being accessed based on author and borrower:
CREATE INDEX idx_author_id ON Books(author_id);
CREATE INDEX idx_borrower_id ON Books(borrower_id);
