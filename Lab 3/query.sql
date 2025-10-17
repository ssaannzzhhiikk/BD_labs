-- 3
SELECT last_name FROM students;

-- 4
SELECT DISTINCT last_name FROM students;

-- 5
SELECT * FROM students WHERE last_name = 'Johnson';

-- 6
SELECT * FROM students WHERE last_name = 'Johnson' OR last_name = 'Smith';

-- 7
SELECT s.*
FROM students s
JOIN registration r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE c.course_code = 'CS101';

-- 8
SELECT s.*
FROM students s
JOIN registration r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE c.course_code IN ('MATH201', 'PHYS301');

-- 9
SELECT SUM(credits) FROM courses;

-- 10
SELECT course_id, COUNT(*) AS student_count
FROM registration
group by course_id;

-- 11
SELECT course_id, COUNT(*) AS scount
FROM registration
group by course_id
HAVING COUNT(*) > 2;

-- 12
SELECT course_name
FROM courses
ORDER BY credits DESC
OFFSET 1 LIMIT 1;

-- 13
SELECT s.first_name, s.last_name
FROM students s
JOIN registration r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE c.credits = (
    SELECT MIN(credits) FROM courses
);

-- 14
SELECT * FROM students WHERE city = 'Almaty';

-- 15
SELECT * FROM courses WHERE credits > 3
ORDER BY credits ASC, course_id DESC;

-- 16
UPDATE courses
SET credits = credits - 1
WHERE credits = (SELECT MIN(credits) FROM courses);

-- 17
UPDATE registration
SET course_id = (SELECT course_id FROM courses WHERE course_code = 'CS101')
WHERE course_id = (SELECT course_id FROM courses WHERE course_code = 'MATH201');

-- 18
DELETE FROM students
WHERE student_id IN (
    SELECT student_id
    FROM registration
    WHERE course_id = (SELECT course_id FROM courses WHERE course_code = 'CS101')
);

-- 19
DELETE FROM students;
