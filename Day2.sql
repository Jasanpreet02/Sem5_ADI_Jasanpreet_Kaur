Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| college2           |
| information_schema |
| miniproject        |
| mysql              |
| performance_schema |
| popquiz            |
| sit103             |
| sqlbasic_sit103    |
| sys                |
+--------------------+
9 rows in set (0.03 sec)

mysql> CREATE DATABASE collegeDB;
Query OK, 1 row affected (0.02 sec)

mysql> USE collegeDB;
Database changed
mysql> CREATE TABLE Students(
    ->     student_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     name VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100) UNIQUE,
    ->     age INT CHECK(age>=18),
    ->     city VARCHAR(50),
    ->     course VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> CREATE TABLE Courses(
    ->     course_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     course_name VARCHAR(100) NOT NULL,
    ->     fees INT NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Enrollements(
    ->     enrollement_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     student_id INT,
    ->     course_id INT,
    ->     marks INT,
    ->     FOREIGN KEY(student_id) REFERENCES Students(student_id),
    ->     FOREIGN KEY(course_id) REFERENCES Courses(course_id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> SHOW TABLES;
+---------------------+
| Tables_in_collegedb |
+---------------------+
| courses             |
| enrollements        |
| students            |
+---------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Students(name,email,age,city,course)
    -> VALUES
    -> ('Rahul','rahul@gmail.com',21,'Delhi','Java'),
    -> ('Neha','neha@gmail.com',20,'Mumbai','Python'),
    -> ('Amit','amit@gmail.com',23,'Delhi','Java'),
    -> ('Priya','priya@gmail.com',22,'Chandigarh','Python'),
    -> ('Rohan','rohan@gmail.com',25,'Delhi','Java'),
    -> ('Simran','simran@gmail.com',24,'Mohali','DevOps'),
    -> ('Karan','karan@gmail.com',26,'Delhi','Python');
Query OK, 7 rows affected (0.03 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Students;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          1 | Rahul  | rahul@gmail.com  |   21 | Delhi      | Java   |
|          2 | Neha   | neha@gmail.com   |   20 | Mumbai     | Python |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi      | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
|          7 | Karan  | karan@gmail.com  |   26 | Delhi      | Python |
+------------+--------+------------------+------+------------+--------+
7 rows in set (0.00 sec)

mysql> INSERT INTO Courses(course_name,fees)
    -> VALUES
    -> ('Java',30000),
    -> ('Python',25000),
    -> ('DevOps',40000);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Courses;
+-----------+-------------+-------+
| course_id | course_name | fees  |
+-----------+-------------+-------+
|         1 | Java        | 30000 |
|         2 | Python      | 25000 |
|         3 | DevOps      | 40000 |
+-----------+-------------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Enrollements(student_id,course_id,marks)
    -> VALUES
    -> (1,1,90),
    -> (2,2,80),
    -> (3,1,95),
    -> (4,2,70),
    -> (5,1,88),
    -> (6,3,92),
    -> (7,2,75);
Query OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Enrollements;
+----------------+------------+-----------+-------+
| enrollement_id | student_id | course_id | marks |
+----------------+------------+-----------+-------+
|              1 |          1 |         1 |    90 |
|              2 |          2 |         2 |    80 |
|              3 |          3 |         1 |    95 |
|              4 |          4 |         2 |    70 |
|              5 |          5 |         1 |    88 |
|              6 |          6 |         3 |    92 |
|              7 |          7 |         2 |    75 |
+----------------+------------+-----------+-------+
7 rows in set (0.00 sec)

mysql> SELECT
    -> Students.name,
    -> Courses.course_name
    -> FROM Students
    -> INNER JOIN Courses
    -> ON Students.course=Courses.course_name;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | Java        |
| Neha   | Python      |
| Amit   | Java        |
| Priya  | Python      |
| Rohan  | Java        |
| Simran | DevOps      |
| Karan  | Python      |
+--------+-------------+
7 rows in set (0.00 sec)

mysql> SELECT city,
    -> COUNT(*) AS TotalStudents
    -> FROM Students
    -> GROUP BY city;
+------------+---------------+
| city       | TotalStudents |
+------------+---------------+
| Delhi      |             4 |
| Mumbai     |             1 |
| Chandigarh |             1 |
| Mohali     |             1 |
+------------+---------------+
4 rows in set (0.01 sec)

mysql> SELECT city,
    -> SUM(marks) AS TotalMarks
    -> FROM Students
    -> JOIN Enrollements
    -> ON Students.student_id=Enrollements.student_id
    -> GROUP BY city;
+------------+------------+
| city       | TotalMarks |
+------------+------------+
| Delhi      |        348 |
| Mumbai     |         80 |
| Chandigarh |         70 |
| Mohali     |         92 |
+------------+------------+
4 rows in set (0.01 sec)

mysql> SELECT city,
    -> AVG(marks) AS AverageMarks
    -> FROM Students
    -> JOIN Enrollements
    -> ON Students.student_id=Enrollements.student_id
    -> GROUP BY city;
+------------+--------------+
| city       | AverageMarks |
+------------+--------------+
| Delhi      |      87.0000 |
| Mumbai     |      80.0000 |
| Chandigarh |      70.0000 |
| Mohali     |      92.0000 |
+------------+--------------+
4 rows in set (0.01 sec)

mysql> SELECT city,
    -> AVG(marks) AS AverageMarks
    -> FROM Students
    -> JOIN Enrollements
    -> ON Students.student_id=Enrollements.student_id
    -> GROUP BY city
    -> HAVING AVG(marks)>85;
+--------+--------------+
| city   | AverageMarks |
+--------+--------------+
| Delhi  |      87.0000 |
| Mohali |      92.0000 |
+--------+--------------+
2 rows in set (0.01 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE city='Delhi';
+------------+-------+-----------------+------+-------+--------+
| student_id | name  | email           | age  | city  | course |
+------------+-------+-----------------+------+-------+--------+
|          1 | Rahul | rahul@gmail.com |   21 | Delhi | Java   |
|          3 | Amit  | amit@gmail.com  |   23 | Delhi | Java   |
|          5 | Rohan | rohan@gmail.com |   25 | Delhi | Java   |
|          7 | Karan | karan@gmail.com |   26 | Delhi | Python |
+------------+-------+-----------------+------+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE age>22;
+------------+--------+------------------+------+--------+--------+
| student_id | name   | email            | age  | city   | course |
+------------+--------+------------------+------+--------+--------+
|          3 | Amit   | amit@gmail.com   |   23 | Delhi  | Java   |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi  | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali | DevOps |
|          7 | Karan  | karan@gmail.com  |   26 | Delhi  | Python |
+------------+--------+------------------+------+--------+--------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> ORDER BY age;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          2 | Neha   | neha@gmail.com   |   20 | Mumbai     | Python |
|          1 | Rahul  | rahul@gmail.com  |   21 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi      | Java   |
|          7 | Karan  | karan@gmail.com  |   26 | Delhi      | Python |
+------------+--------+------------------+------+------------+--------+
7 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> ORDER BY age DESC;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          7 | Karan  | karan@gmail.com  |   26 | Delhi      | Python |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi      | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          1 | Rahul  | rahul@gmail.com  |   21 | Delhi      | Java   |
|          2 | Neha   | neha@gmail.com   |   20 | Mumbai     | Python |
+------------+--------+------------------+------+------------+--------+
7 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> LIMIT 3;
+------------+-------+-----------------+------+--------+--------+
| student_id | name  | email           | age  | city   | course |
+------------+-------+-----------------+------+--------+--------+
|          1 | Rahul | rahul@gmail.com |   21 | Delhi  | Java   |
|          2 | Neha  | neha@gmail.com  |   20 | Mumbai | Python |
|          3 | Amit  | amit@gmail.com  |   23 | Delhi  | Java   |
+------------+-------+-----------------+------+--------+--------+
3 rows in set (0.00 sec)

mysql> SELECT MIN(marks)
    -> FROM Enrollements;
+------------+
| MIN(marks) |
+------------+
|         70 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(marks)
    -> FROM Enrollements;
+------------+
| MAX(marks) |
+------------+
|         95 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE city IN ('Delhi','Mumbai');
+------------+-------+-----------------+------+--------+--------+
| student_id | name  | email           | age  | city   | course |
+------------+-------+-----------------+------+--------+--------+
|          1 | Rahul | rahul@gmail.com |   21 | Delhi  | Java   |
|          2 | Neha  | neha@gmail.com  |   20 | Mumbai | Python |
|          3 | Amit  | amit@gmail.com  |   23 | Delhi  | Java   |
|          5 | Rohan | rohan@gmail.com |   25 | Delhi  | Java   |
|          7 | Karan | karan@gmail.com |   26 | Delhi  | Python |
+------------+-------+-----------------+------+--------+--------+
5 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE age BETWEEN 21 AND 24;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          1 | Rahul  | rahul@gmail.com  |   21 | Delhi      | Java   |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
+------------+--------+------------------+------+------------+--------+
4 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE name LIKE 'R%';
+------------+-------+-----------------+------+-------+--------+
| student_id | name  | email           | age  | city  | course |
+------------+-------+-----------------+------+-------+--------+
|          1 | Rahul | rahul@gmail.com |   21 | Delhi | Java   |
|          5 | Rohan | rohan@gmail.com |   25 | Delhi | Java   |
+------------+-------+-----------------+------+-------+--------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students
    -> WHERE name LIKE '%a';
+------------+-------+-----------------+------+------------+--------+
| student_id | name  | email           | age  | city       | course |
+------------+-------+-----------------+------+------------+--------+
|          2 | Neha  | neha@gmail.com  |   20 | Mumbai     | Python |
|          4 | Priya | priya@gmail.com |   22 | Chandigarh | Python |
+------------+-------+-----------------+------+------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT DISTINCT city
    -> FROM Students;
+------------+
| city       |
+------------+
| Delhi      |
| Mumbai     |
| Chandigarh |
| Mohali     |
+------------+
4 rows in set (0.00 sec)

mysql> UPDATE Students
    -> SET city='Noida'
    -> WHERE student_id=1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT *
    -> FROM Students;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          1 | Rahul  | rahul@gmail.com  |   21 | Noida      | Java   |
|          2 | Neha   | neha@gmail.com   |   20 | Mumbai     | Python |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi      | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
|          7 | Karan  | karan@gmail.com  |   26 | Delhi      | Python |
+------------+--------+------------------+------+------------+--------+
7 rows in set (0.00 sec)

mysql> INSERT INTO Students(name,email,age,city,course)
    -> VALUES('Test','test@gmail.com',20,'Delhi','Java');
Query OK, 1 row affected (0.01 sec)

mysql> DELETE
    -> FROM Students
    -> WHERE name='Test';
Query OK, 1 row affected (0.01 sec)

mysql> SELECT *
    -> FROM Students;
+------------+--------+------------------+------+------------+--------+
| student_id | name   | email            | age  | city       | course |
+------------+--------+------------------+------+------------+--------+
|          1 | Rahul  | rahul@gmail.com  |   21 | Noida      | Java   |
|          2 | Neha   | neha@gmail.com   |   20 | Mumbai     | Python |
|          3 | Amit   | amit@gmail.com   |   23 | Delhi      | Java   |
|          4 | Priya  | priya@gmail.com  |   22 | Chandigarh | Python |
|          5 | Rohan  | rohan@gmail.com  |   25 | Delhi      | Java   |
|          6 | Simran | simran@gmail.com |   24 | Mohali     | DevOps |
|          7 | Karan  | karan@gmail.com  |   26 | Delhi      | Python |
+------------+--------+------------------+------+------------+--------+
7 rows in set (0.00 sec)

mysql>