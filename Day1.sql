indows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.


PS C:\Users\Asus> -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
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
| information_schema |
| miniproject        |
| mysql              |
| performance_schema |
| popquiz            |
| sit103             |
| sqlbasic_sit103    |
| sys                |
+--------------------+
8 rows in set (0.03 sec)

mysql> SELECT VERSION();
+-----------+
| VERSION() |
+-----------+
| 8.0.41    |
+-----------+
1 row in set (0.01 sec)

mysql> CREATE DATABASE college2;
Query OK, 1 row affected (0.02 sec)

mysql> USE college2;
Database changed
mysql> CREATE TABLE students(
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(30),
    ->     age INT,
    ->     course_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO students VALUES
    -> (1,'Rahul',20,101),
    -> (2,'Vishal',21,101);
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM students;
+----+--------+------+-----------+
| id | name   | age  | course_id |
+----+--------+------+-----------+
|  1 | Rahul  |   20 |       101 |
|  2 | Vishal |   21 |       101 |
+----+--------+------+-----------+
2 rows in set (0.01 sec)

mysql> SHOW TABLES;
+--------------------+
| Tables_in_college2 |
+--------------------+
| students           |
+--------------------+
1 row in set (0.02 sec)

mysql> CREATE TABLE courses (
    ->     course_id INT PRIMARY KEY,
    ->     course_name VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO courses VALUES
    -> (101,'Java'),
    -> (102,'Python'),
    -> (103,'PA');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT
    ->     students.name,
    ->     courses.course_name
    -> FROM students
    -> INNER JOIN courses
    -> ON students.course_id = courses.course_id;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | Java        |
| Vishal | Java        |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT
    -> students.name,
    -> courses.course_name
    -> FROM students
    -> INNER JOIN courses
    -> ON students.course_id = courses.course_id;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | Java        |
| Vishal | Java        |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> (5,'karan',25,104)
    -> (105,'AI')
    -> SELECT
    -> e.name AS Employee,
    -> m.name AS Manager
    -> FROM employees e
    -> LEFT JOIN employees m
    -> ON e.manager_id = m.id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5,'karan',25,104)
(105,'AI')
SELECT
e.name AS Employee,
m.name AS Manager
FROM e' at line 1
mysql> INSERT INTO students
    -> VALUES (5,'Karan',25,104);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO courses
    -> VALUES (104,'AI');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT
    -> students.name,
    -> courses.course_name
    -> FROM students
    -> LEFT JOIN courses
    -> ON students.course_id = courses.course_id;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | Java        |
| Vishal | Java        |
| Karan  | AI          |
+--------+-------------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE employees(
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(30),
    ->     manager_id INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO employees VALUES
    -> (1,'CEO',NULL),
    -> (2,'Manager',1),
    -> (3,'Neeraj',2),
    -> (4,'Rahul',2);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT
    -> e.name AS Employee,
    -> m.name AS Manager
    -> FROM employees e
    -> LEFT JOIN employees m
    -> ON e.manager_id = m.id;
+----------+---------+
| Employee | Manager |
+----------+---------+
| CEO      | NULL    |
| Manager  | CEO     |
| Neeraj   | Manager |
| Rahul    | Manager |
+----------+---------+
4 rows in set (0.00 sec)

mysql>
