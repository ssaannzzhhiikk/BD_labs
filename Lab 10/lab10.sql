-- 1

BEGIN;
INSERT INTO rentals (rental_id,movie_id, customer_id, rental_date, quantity)
VALUES (4, 1, 201, CURRENT_DATE, 2);

UPDATE movies
SET available_copies = available_copies - 2
WHERE movie_id = 1;

COMMIT;



-- 2
BEGIN;

-- Lock movie row
SELECT available_copies INTO TEMP TABLE tmp
FROM Movies
WHERE movie_id = 3
FOR UPDATE;

-- Check
DO $$
DECLARE
    available INTEGER;
BEGIN
    SELECT available_copies INTO available FROM tmp;
    IF available < 10 THEN
        RAISE EXCEPTION 'Not enough copies. Rolling back.';
    END IF;
END $$;

-- Proceed
INSERT INTO Rentals (rental_id, movie_id, customer_id, rental_date, quantity)
VALUES (5, 3, 202, CURRENT_DATE, 10);

UPDATE Movies
SET available_copies = available_copies - 10
WHERE movie_id = 3;

COMMIT;




-- 3

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

UPDATE movies
SET price_per_day = price_per_day + 1
WHERE movie_id = 1;


-- Session 2

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
 SELECT price_per_day FROM movies WHERE movie_id = 1;

SELECT price_per_day FROM movies WHERE movie_id = 1;

COMMIT;



-- 4

BEGIN;

UPDATE customers
SET email = 'alice.newemail@example.com'
WHERE customer_id = 201;

COMMIT;
