-- 3
CREATE VIEW ny_librarians AS
SELECT * FROM librarians
WHERE city = 'New York';


-- 4
CREATE VIEW borrow_details AS
    SELECT b.borrowing_id, b.borrow_date, b.return_date,
           m.member_name, l.name AS librarian_name
FROM borrowings b
JOIN members m ON b.member_id = m.member_id
JOIN librarians l ON b.librarian_id = l.librarian_id;


-- 5
CREATE VIEW top_members AS
    SELECT * FROM members
WHERE membership_level = (SELECT MAX(membership_level) FROM members);


-- 6
CREATE VIEW librarian_count AS
    SELECT city, COUNT(*) AS total_librarians
FROM librarians
GROUP BY city;

-- 7
CREATE VIEW librarians_multi AS
    SELECT librarian_id, COUNT(DISTINCT member_id) AS member_count
FROM members
GROUP BY librarian_id
HAVING COUNT(DISTINCT member_id) > 1;

-- 8
CREATE ROLE intern;
GRANT library_user TO intern;
