# Creating multiple databases
create database temp1;
CREATE DATABASE college;
CREATE DATABASE IF NOT EXISTS college;

# Droppiing a database
DROP DATABASE temp1;
DROP DATABASE IF EXISTS temp1;

# Accessing a database
use college;

# Creating Tables
CREATE TABLE student (
	id INT primary KEY,
    name VARCHAR(50),
    age INT NOT NULL
);
CREATE TABLE student (
	rollno INT primary KEY,
    name VARCHAR(50)
);

# Deleting a table
DROP TABLE student;

# Inserting into tables
INSERT INTO student VALUES(1, "Naruto", 14);
INSERT INTO student VALUES(2, "Jiraiya", 50);

# Printing a table
SELECT * FROM student;

# List all the databases and tables
SHOW DATABASES;
SHOW TABLES;

# Table related queries
SELECT * FROM student;
INSERT INTO student
(rollno, name)
VALUES
(101, "karan"),
(102, "arjun"),
(103, "ram");

# Constraints:- Mainly 5 type => (UNIQUE, NOT NULL, PRIMARY KEY, FOREIGN KEY, DEFAULT)
# NOT NULL
# col1 INT NOT NULL;

# UNIQUE
# col2 INT UNIQUE;

# PRIMARY KEY
# id INT PRIMARY KEY; 
CREATE TABLE TEMP1 (
	id INT UNIQUE
);

# FOREIGN KEY (prevent action that would destroy links between tables)
CREATE TABLE temp (
	cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id)
);

# DEFAULT (Set the default the value of a column)
# salary INT DEFAULT 25000 

CREATE TABLE emp (
  id INT NOT NULL,
  salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (101);

SELECT * FROM EMP;

# CHECK => It limit the values allowed in the column

CREATE TABLE city (
	id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK (age >= 18 AND city="DELHI")
);

CREATE TABLE student (
	roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

CREATE TABLE dept (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept 
VALUES
(101, "English"),
(102, "IT");

SELECT * FROM dept;

UPDATE dept
SET id = 103
WHERE id = 101;

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;

INSERT INTO student 
(roll_no, name, marks, grade, city) 
VALUES
(101, "Anil", 71, "C", "Delhi"),
(102, "Anil1", 88, "A", "Delhi"),
(103, "Anil2", 90, "A", "Delhi"),
(104, "Anil3", 20, "F", "Delhi"),
(105, "Anil4", 12, "F", "Delhi"),
(106, "Anil5", 45, "P", "Delhi"),
(107, "Anil6", 99, "A", "Delhi");

# SELECT => Used to select any data from the database
SELECT * FROM student; # * select all column
SELECT roll_no, marks FROM student;
SELECT DISTINCT city FROM student;  # DISTINCT => Select all unique values of the column

# WHERE => To define some conditions
SELECT col1, col2 FROM table_name
WHERE conditions;

SELECT * FROM student WHERE marks >= 75 AND city = "Delhi";

# OPERATORS => 
# 1. Arithmetic Operators => +, -, *, /, %
# 2. Comparison operators => =, !=, >, >=, <, <=
# 3. Logical Operators => AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
# 4. Bitwise operators => &, |

# AND => to check for both condition to be true
# OR => to check one of the conditions to be true
# BETWEEN => Select for a given range
# IN => Matches any values in the list
# NOT => To negate the given condition
 
# LIMIT Clause => Sets an upper limit on number of(tuples) rows to be returned
SELECT * FROM student LIMIT 3; 

# ORDER BY clause => To sort in ascending(ASC) or descending order (DESC)
SELECT * FROM student ORDER BY marks ASC;

SELECT * FROM student ORDER BY marks DESC LIMIT 3;

# AGGREGATE function:- Performs calculations on a set of values and return a single result
# COUNT()
# MAX()
# MIN()
# SUM()
# AVG()

SELECT MAX(marks) FROM student;

# GROUP BY clause => Groups rows that have the same values into summary rows.
# It group data from multiple records and group the result by one or more column.
SELECT grade , COUNT(grade)
FROM student 
GROUP BY grade;

# HAVING clause => Similar to WHERE used when we want to apply any condition after grouping
SELECT city, COUNT(roll_no)
FROM student
GROUP BY city
HAVING MAX(marks) > 95;

# General order of writing clause:
# SELECT column
# FROM table_name
# WHERE condition    # Apply conditions on rows
# GROUP BY column
# HAVING condition   # Apply condition on group columns
# ORDER BY column ASC;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city;

# Table related query
# UPDATE (to update table related query)
-- UPDATE table_name
-- SET col1 = var1, col2 = var2
-- WHERE condition;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = "O"
WHERE grade = "A";

UPDATE student
SET marks = marks + 1;

SELECT * FROM student;

# DELETE => to delete existing rows
-- DELETE FROM table_name
-- WHERE condition;

DELETE FROM student
WHERE marks < 33;

# Grant admin privillage to the root@localhost
-- SHOW GRANTS FOR 'root'@'localhost';
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

# Cascading for FOREIGN KEY
-- On Delete cascade
-- When we create a foreign key using this option, it deletes the referencing rows in the child table when the referenced is deleted in the parent table which has a primary key.

-- On Update cascade
-- When we create a foreign key using UPDATE CASCADE the reference rows are updated in the child table when the reference row is updated in the parent table which has a primary key.

# ALTER => to change the schema

-- ADD column
-- ALTER TABLE table_name
-- ADD COLUMN column_name datatype constraint;

-- DROP column
-- ALTER TABLE table_name
-- DROP COLUMN column_name;

-- RENAME table
-- ALTER TABLE table_name
-- RENAME TO new_table_name;

-- CHANGE  Column (rename)
-- ALTER TABLE table_name
-- CHANGE COLUMN old_name new_name new_datatype new_constraint;

-- MODIFY Column (modify datatype/constraint)
-- ALTER TABLE table_name
-- MODIFY col_name new_datatype new-constraint;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE student
CHANGE age stu_age INT;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE stu
RENAME TO student;

SELECT * FROM student;

# TRUNCATE => to delete table's data
-- TRUNCATE TABLE table_name;

TRUNCATE TABLE student;

# Joins in SQL => Joins is used to combine rows from two or more tables, based on a related column between them.
-- Inner Join => Return records that have matching values in both tables
-- SELECT column(s)
-- FROM tableA
-- INNER JOIN tableB
-- ON tableA.col_name = tableb.col_name;

CREATE TABLE Stu (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Course (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Stu (id, name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(1033, 'Alice Johnson');

INSERT INTO Course (id, name) VALUES
(101, 'Mathematics'),
(102, 'Physics'),
(103, 'History');

SELECT * FROM Course;

SELECT * 
FROM stu as s
INNER JOIN Course as c
ON s.id = c.id;

# LEFT JOIN => Returns all the records from the left tables, and the matched record from the right table
-- SEELCT column(s)
-- FROM tableA
-- LEFT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

SELECT * 
FROM stu as s
LEFT JOIN Course as c
ON s.id = c.id;

# RIGHT JOIN => Returns all the records from the right tables, and the matched record from the left table
-- SEELCT column(s)
-- FROM tableA
-- RIGHT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

SELECT * 
FROM stu as s
RIGHT JOIN Course as c
ON s.id = c.id;

# RIGHT JOIN => Returns all the records when there is a match in either left or right table
SELECT * FROM stu AS s
LEFT JOIN Course AS c
ON s.id = c.id
UNION
SELECT * FROM stu AS s
RIGHT JOIN Course AS c
ON s.id = c.id;

# LEFT EXCLUSIVE JOIN
SELECT * FROM stu AS s
LEFT JOIN Course AS c
ON s.id = c.id
WHERE c.id IS NULL;

# RIGHT EXCLUSIVE JOIN
SELECT * FROM stu AS s
RIGHT JOIN Course AS c
ON s.id = c.id
WHERE s.id IS NULL;

# SELF JOIN => It is a regular join but the table is joined with itself
-- SEELCT column(s)
-- FROM table as a
-- JOIN table as b
-- ON a.col_name = b.col_name;