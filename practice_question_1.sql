# Create a database for your company named XYZ.

CREATE DATABASE XYZ;

use XYZ;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT NOT NULL
);
INSERT INTO employee
(id, name, salary)
VALUES
(1, "adam", 25000),
(2, "bob", 30000),
(3, "casey", 40000);
SELECT * FROM employee;

# Write the query to find the avg marks in each city in ascending order
CREATE TABLE student (
	roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student 
(roll_no, name, marks, grade, city) 
VALUES
(101, "Anil", 71, "C", "Delhi"),
(102, "Anil1", 88, "A", "Banglore"),
(103, "Anil2", 90, "A", "Delhi"),
(104, "Anil3", 20, "F", "Mumbai"),
(105, "Anil4", 12, "F", "Delhi"),
(106, "Anil5", 45, "P", "Banglore"),
(107, "Anil6", 99, "A", "Mumbai");

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY avg(marks) DESC;

SELECT city, COUNT(roll_no)
FROM student
GROUP BY city
HAVING MAX(marks) > 95;