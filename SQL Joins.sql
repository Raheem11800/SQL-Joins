create database JOINS;
use JOINS;



CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact VARCHAR(50),
    Address VARCHAR(255)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    Dtae DATE,
    Method VARCHAR(50),
    customer_id INT
);

CREATE TABLE FeedBack (
    feedback_id INT PRIMARY KEY,
    Rating INT,
    comments TEXT,
    customer_id INT
);

CREATE TABLE QualityInspection (
    id INT PRIMARY KEY,
    observation TEXT,
    yes_or_no BOOLEAN,
    room_id INT
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    description TEXT,
    start_date DATE,
    end_date DATE,
    customer_id INT
);

CREATE TABLE Contractor (
    contractor_id INT PRIMARY KEY,
    Name VARCHAR(100),
    license VARCHAR(50),
    contact VARCHAR(50)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    height DECIMAL(5, 2),
    area DECIMAL(10, 2),
    doors INT,
    project_id INT
);

CREATE TABLE Task (
    task_id INT PRIMARY KEY,
    description TEXT,
    status VARCHAR(50),
    project_id INT
);

CREATE TABLE Material (
    material_id INT PRIMARY KEY,
    supplier VARCHAR(100),
    cost DECIMAL(10, 2),
    name VARCHAR(100),
    contractor_id INT
);

CREATE TABLE Warranty (
    id INT PRIMARY KEY,
    terms_and_conditions TEXT,
    warranty_provides VARCHAR(255),
    material_id INT
);


INSERT INTO Customer (customer_id, Name, Contact, Address) VALUES
(1, 'John Doe', '1234567890', '123 Elm Street'),
(2, 'Jane Smith', '0987654321', '456 Oak Avenue');

INSERT INTO Payment (Payment_ID, Amount, Dtae, Method, customer_id) VALUES
(1, 250.00, '2024-05-01', 'Credit Card', 1),
(2, 150.50, '2024-05-02', 'Cash', 2);

INSERT INTO FeedBack (feedback_id, Rating, comments, customer_id) VALUES
(1, 5, 'Excellent service', 1),
(2, 4, 'Very good, but room for improvement', 2);

INSERT INTO QualityInspection (id, observation, yes_or_no, room_id) VALUES
(1, 'Walls are clean and painted', TRUE, 1),
(2, 'Minor cracks in the ceiling', FALSE, 2);

INSERT INTO Project (project_id, description, start_date, end_date, customer_id) VALUES
(1, 'Building a new house', '2024-01-01', '2024-12-31', 1),
(2, 'Renovating the kitchen', '2024-03-01', '2024-06-30', 2);

INSERT INTO Contractor (contractor_id, Name, license, contact) VALUES
(1, 'ABC Construction', 'LIC123456', '1122334455'),
(2, 'XYZ Builders', 'LIC654321', '5544332211');

INSERT INTO Room (room_id, height, area, doors, project_id) VALUES
(1, 2.5, 20.0, 1, 1),
(2, 3.0, 25.5, 2, 2);

INSERT INTO Task (task_id, description, status, project_id) VALUES
(1, 'Install flooring', 'Completed', 1),
(2, 'Paint walls', 'In Progress', 2);

INSERT INTO Material (material_id, supplier, cost, name, contractor_id) VALUES
(1, 'Home Depot', 50.00, 'Cement', 1),
(2, 'Lowe\'s', 30.00, 'Paint', 2);

INSERT INTO Warranty (id, terms_and_conditions, warranty_provides, material_id) VALUES
(1, '5-year warranty for structural defects', 'Structural Defects', 1),
(2, '2-year warranty for paint', 'Paint', 2);


ALTER TABLE Payment
ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

ALTER TABLE FeedBack
ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

ALTER TABLE QualityInspection
ADD FOREIGN KEY (room_id) REFERENCES Room(room_id);

ALTER TABLE Project
ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

ALTER TABLE Room
ADD FOREIGN KEY (project_id) REFERENCES Project(project_id);

ALTER TABLE Task
ADD FOREIGN KEY (project_id) REFERENCES Project(project_id);

ALTER TABLE Material
ADD FOREIGN KEY (contractor_id) REFERENCES Contractor(contractor_id);

ALTER TABLE Warranty
ADD FOREIGN KEY (material_id) REFERENCES Material(material_id);

SELECT * 
FROM Customer c
INNER JOIN Payment p ON c.customer_id = p.customer_id;

SELECT * 
FROM Customer c
INNER JOIN Feedback f ON c.customer_id = f.customer_id;

SELECT * 
FROM Project p
INNER JOIN Room r ON p.project_id = r.project_id;

SELECT * 
FROM Room r
INNER JOIN QualityInspection q ON r.room_id = q.room_id;

SELECT * 
FROM Material m
INNER JOIN Warranty w ON m.material_id = w.material_id;

SELECT * 
FROM Customer c
LEFT JOIN Payment p ON c.customer_id = p.customer_id;

SELECT * 
FROM Customer c
LEFT JOIN Feedback f ON c.customer_id = f.customer_id;

SELECT * 
FROM Project p
LEFT JOIN Room r ON p.project_id = r.project_id;

SELECT * 
FROM Room r
LEFT JOIN QualityInspection q ON r.room_id = q.room_id;

SELECT * 
FROM Material m
LEFT JOIN Warranty w ON m.material_id = w.material_id;

SELECT * 
FROM Customer c
RIGHT JOIN Payment p ON c.customer_id = p.customer_id;

SELECT * 
FROM Customer c
RIGHT JOIN Feedback f ON c.customer_id = f.customer_id;

SELECT * 
FROM Project p
RIGHT JOIN Room r ON p.project_id = r.project_id;

SELECT * 
FROM Room r
RIGHT JOIN QualityInspection q ON r.room_id = q.room_id;

SELECT * 
FROM Material m
RIGHT JOIN Warranty w ON m.material_id = w.material_id;

SELECT * 
FROM Customer c
LEFT JOIN Payment p ON c.customer_id = p.customer_id
UNION
SELECT * 
FROM Customer c
RIGHT JOIN Payment p ON c.customer_id = p.customer_id;

SELECT * 
FROM Customer c
LEFT JOIN Feedback f ON c.customer_id = f.customer_id
UNION
SELECT * 
FROM Customer c
RIGHT JOIN Feedback f ON c.customer_id = f.customer_id;

SELECT * 
FROM Project p
LEFT JOIN Room r ON p.project_id = r.project_id
UNION
SELECT * 
FROM Project p
RIGHT JOIN Room r ON p.project_id = r.project_id;

SELECT * 
FROM Room r
LEFT JOIN QualityInspection q ON r.room_id = q.room_id
UNION
SELECT * 
FROM Room r
RIGHT JOIN QualityInspection q ON r.room_id = q.room_id;


SELECT * 
FROM Material m
LEFT JOIN Warranty w ON m.material_id = w.material_id
UNION
SELECT * 
FROM Material m
RIGHT JOIN Warranty w ON m.material_id = w.material_id;

SELECT a.Name AS Customer1, b.Name AS Customer2, a.Address
FROM Customer a
INNER JOIN Customer b ON a.Address = b.Address AND a.customer_id <> b.customer_id;

SELECT a.project_id AS Project1, b.project_id AS Project2, a.start_date
FROM Project a
INNER JOIN Project b ON a.start_date = b.start_date AND a.project_id <> b.project_id;

SELECT a.room_id AS Room1, b.room_id AS Room2, a.height
FROM Room a
INNER JOIN Room b ON a.height = b.height AND a.room_id <> b.room_id;

SELECT a.name AS Material1, b.name AS Material2, a.supplier
FROM Material a
INNER JOIN Material b ON a.supplier = b.supplier AND a.material_id <> b.material_id;

SELECT a.Name AS Contractor1, b.Name AS Contractor2, a.license
FROM Contractor a
INNER JOIN Contractor b ON a.license = b.license AND a.contractor_id <> b.contractor_id;
