-- 3
SELECT COUNT(*) AS total_borrowings
FROM borrowings
WHERE borrow_date BETWEEN '2020-01-01' AND '2024-12-31';


-- 4
SELECT AVG(membership_level) FROM members;


-- 5
SELECT COUNT(*) AS new_yorkers
FROM members
WHERE city = 'New York';


-- 6
SELECT MIN(borrow_date) AS earliest
FROM borrowings;


-- 7
SELECT member_name, city
FROM members
WHERE member_name LIKE '%n';


-- 8
SELECT b.*
FROM borrowings b
JOIN librarians l ON b.librarian_id = l.librarian_id
WHERE l.city = 'Paris'
    AND b.borrow_date BETWEEN '2021-01-01' AND '2023-12-31';


-- 9
SELECT * FROM borrowings WHERE borrow_date > '2023-01-01';


-- 10
SELECT m.member_name, COUNT(b.book_id) AS total_books
FROM borrowings b
JOIN members m ON b.member_id = m.member_id
GROUP BY m.member_name
ORDER BY total_books DESC;


-- 11
SELECT * FROM members WHERE membership_level = 3;


-- 12
SELECT * FROM librarians
WHERE commission = (SELECT MAX(commission) FROM librarians);