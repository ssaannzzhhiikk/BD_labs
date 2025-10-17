-- 2
CREATE TABLE Warehouses (
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

-- 2
CREATE TABLE Boxes (
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);

-- 4
SELECT * FROM Warehouses;

-- 5
SELECT * FROM Boxes WHERE value > 150;

-- 6
SELECT DISTINCT contents FROM Boxes;

-- 7
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse;

-- 8
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

-- 9
INSERT INTO Warehouses (code, location, capacity)
VALUES (6, 'New York', 3);


-- 10
INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

-- 11
UPDATE Boxes
SET value = value * 0.85
WHERE code = (
    SELECT code FROM Boxes
    ORDER BY value DESC
    OFFSET 2 LIMIT 1  -- Skip top 2 → third largest
);

-- 12
DELETE FROM Boxes
WHERE value < 150;

-- 13
DELETE FROM Boxes
USING Warehouses
WHERE Boxes.warehouse = Warehouses.code
  AND Warehouses.location = 'New York'
RETURNING Boxes.*;
