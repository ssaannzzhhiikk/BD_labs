-- 1 --
CREATE TABLE Reviewer (
    reviewerID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Reviewer (reviewerID, name) VALUES
(301, 'Alex Johnson'),
(302, 'Maria Gomez'),
(303, 'John Doe'),
(304, 'Linda Brown'),
(305, 'Michael Thompson'),
(306, 'Emily Davis'),
(307, 'Daniel White'),
(308, 'Sophia Lee');

CREATE TABLE Movie (
    movieID INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    releaseYear INT NOT NULL,
    director VARCHAR(100)
);

INSERT INTO Movie (movieID, title, releaseYear, director) VALUES
(401, 'Future World', 2024, 'Alice Smith'),
(402, 'The Last Adventure', 2024, 'John Black'),
(403, 'New Horizons', 2024, 'Maria Johnson'),
(404, 'Time Capsule', 2024, 'Chris Martin'),
(405, 'Beyond the Stars', 2024, NULL),
(406, 'The Silent Valley', 2024, 'Laura Green'),
(407, 'Lost in the Echo', 2024, 'Daniel White'),
(408, 'Shadow of Destiny', 2024, 'James Clarke');

CREATE TABLE Review (
    reviewerID INT,
    movieID INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    reviewDate DATE,
    PRIMARY KEY (reviewerID, movieID),
    FOREIGN KEY (reviewerID) REFERENCES Reviewer(reviewerID),
    FOREIGN KEY (movieID) REFERENCES Movie(movieID)
);

INSERT INTO Review (reviewerID, movieID, rating, reviewDate) VALUES
(301, 401, 5, '2024-02-15'),
(301, 402, 4, '2024-02-20'),
(302, 403, 5, '2024-01-11'),
(303, 404, 3, '2024-01-23'),
(304, 405, 4, '2024-01-15'),
(305, 406, 2, '2024-03-01'),
(306, 407, 5, '2024-02-05'),
(307, 408, 4, '2024-03-12');

-- 2 --
CREATE OR REPLACE VIEW HighRatedMovieYears AS
SELECT DISTINCT m.releaseYear
FROM Movie m
JOIN Review r ON m.movieID = r.movieID
WHERE r.rating >= 4
ORDER BY m.releaseYear ASC;

-- 3 --
CREATE INDEX idx_review_rating ON Review(rating);
CREATE INDEX idx_movie_releaseYear ON Movie(releaseYear);

-- 4 --
CREATE ROLE lab_user WITH LOGIN CREATEROLE;

-- 5 --
GRANT CONNECT ON DATABASE lab9 TO lab_user;

GRANT USAGE ON SCHEMA public TO lab_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO lab_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO lab_user;

-- 6 --
ALTER TABLE Reviewer OWNER TO lab_user;
ALTER TABLE Movie OWNER TO lab_user;
ALTER TABLE Review OWNER TO lab_user;

-- 7 --
CREATE OR REPLACE VIEW TopRated2024Movies AS
SELECT m.title AS movie_title, rv.name AS reviewer_name
FROM Movie m
JOIN Review r ON m.movieID = r.movieID
JOIN Reviewer rv ON r.reviewerID = rv.reviewerID
WHERE r.rating = 5 AND EXTRACT(YEAR FROM r.reviewDate) = 2024
ORDER BY m.title ASC;
