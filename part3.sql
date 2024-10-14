--Author: Austin Erben
--Date: 10/14/2024
--Description: 
	-- Part 3 of the Bluestaq database challenge #1
	-- Write a stored procedure with three or more parameters that will insert a new record into the books table


CREATE OR REPLACE PROCEDURE insert_book(
    insert_title VARCHAR(255),
    insert_isbn VARCHAR(13),
    insert_publication_date DATE,
    insert_author_id INT,
    insert_borrower_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Books (title, isbn, publication_date, author_id, borrower_id)
    VALUES (insert_title, insert_isbn, insert_publication_date, insert_author_id, insert_borrower_id);
END;
$$;
