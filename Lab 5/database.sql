CREATE DATABASE library_db;

-- Librarians
CREATE TABLE librarians (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(4,2)
);

INSERT INTO librarians (librarian_id, name, city, commission) VALUES
(2001, 'Michael Green', 'New York', 0.15),
(2002, 'Anna Blue', 'California', 0.13),
(2003, 'Chris Red', 'London', 0.12),
(2004, 'Emma Yellow', 'Paris', 0.14),
(2005, 'David Purple', 'Berlin', 0.12),
(2006, 'Laura Orange', 'Rome', 0.13);


-- Members
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    city VARCHAR(100),
    membership_level INT,
    librarian_id INT REFERENCES librarians(librarian_id)
);

INSERT INTO members (member_id, member_name, city, membership_level, librarian_id) VALUES
(1001, 'John Doe', 'New York', 1, 2001),
(1002, 'Alice Johnson', 'California', 2, 2002),
(1003, 'Bob Smith', 'London', 1, 2003),
(1004, 'Sara Green', 'Paris', 3, 2004),
(1005, 'David Brown', 'New York', 1, 2001),
(1006, 'Emma White', 'Berlin', 2, 2005),
(1007, 'Olivia Black', 'Rome', 3, 2006);


-- Borrowings
CREATE TABLE borrowings (
    borrowing_id INT PRIMARY KEY,
    borrow_date DATE,
    return_date DATE,
    member_id INT REFERENCES members(member_id),
    librarian_id INT REFERENCES librarians(librarian_id),
    book_id INT
);

INSERT INTO borrowings (borrowing_id, borrow_date, return_date, member_id, librarian_id, book_id) VALUES
(30001, '2023-01-05', '2023-01-10', 1002, 2002, 5001),
(30002, '2022-07-10', '2022-07-17', 1003, 2003, 5002),
(30003, '2021-05-12', '2021-05-20', 1001, 2001, 5003),
(30004, '2022-04-08', '2022-04-15', 1006, 2005, 5004),
(30005, '2024-02-20', '2024-02-29', 1007, 2006, 5005),
(30006, '2023-06-02', '2023-06-12', 1005, 2001, 5001);
