Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show Databases;
+--------------------+
| Database           |
+--------------------+
| college2           |
| collegedb          |
| information_schema |
| miniproject        |
| mysql              |
| performance_schema |
| popquiz            |
| sit103             |
| sqlbasic_sit103    |
| sys                |
+--------------------+
10 rows in set (0.03 sec)

mysql> create Database temp;
Query OK, 1 row affected (0.01 sec)

mysql> use temp;
Database changed
mysql> create table student (
    -> id INT PRIMARY KEY,
    -> name VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT into student values(1,'Saniya');
Query OK, 1 row affected (0.02 sec)

mysql> select * from student;
+----+--------+
| id | name   |
+----+--------+
|  1 | Saniya |
+----+--------+
1 row in set (0.00 sec)

mysql> select * from student;
+----+---------+
| id | name    |
+----+---------+
|  1 | Saniya  |
|  2 | lavanya |
+----+---------+
2 rows in set (0.00 sec)

mysql> create table test (
    -> id INT,
    -> Value INT UNSIGNED // unsigned stores the positive values
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+----------------+
| Tables_in_temp |
+----------------+
| student        |
| test           |
+----------------+
2 rows in set (0.00 sec)

mysql> DROP Database temp; // to delete the database
Query OK, 2 rows affected (0.11 sec)

mysql> show Databases;
+--------------------+
| Database           |
+--------------------+
| college2           |
| collegedb          |
| information_schema |
| miniproject        |
| mysql              |
| performance_schema |
| popquiz            |
| sit103             |
| sqlbasic_sit103    |
| sys                |
+--------------------+
10 rows in set (0.02 sec)

mysql> create Database ORG;
Query OK, 1 row affected (0.01 sec)

mysql> show Databases;
+--------------------+
| Database           |
+--------------------+
| college2           |
| collegedb          |
| information_schema |
| miniproject        |
| mysql              |
| org                |
| performance_schema |
| popquiz            |
| sit103             |
| sqlbasic_sit103    |
| sys                |
+--------------------+
11 rows in set (0.00 sec)

mysql> use org;
Database changed

mysql> CREATE TABLE WORKER (
    ->     WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ->     FIRST_NAME CHAR(25),
    ->     LAST_NAME CHAR(25),
    ->     SALARY INT,
    ->     JOINING_DATE DATETIME,
    ->     DEPARTMENT CHAR(25)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO WORKER
    ->     (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    ->     (001, 'MONIKA', 'ARORA', 100000, '14-02-20 09.00.00', 'HR'),
    ->     (002, 'JATIN', 'VERMA', 200000, '14-06-11 09.00.01', 'ADMIN'),
    ->     (003, 'JACK', 'TERRIS', 100000, '15-06-11 09.00.04', 'EMPLOYEE'),
    ->     (004, 'SAHIL', 'KUMAR', 600000, '15-06-11 09.00.06', 'ADMIN'),
    ->     (005, 'SONALI', 'BHADRA', 200000, '15-06-11 09.00.06', 'ACCOUNT');
Query OK, 5 rows affected, 5 warnings (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 5

mysql> SELECT * FROM WORKER;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         3 | JACK       | TERRIS    | 100000 | 2015-06-11 09:00:04 | EMPLOYEE   |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
+-----------+------------+-----------+--------+---------------------+------------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE BONUS (
    -> WORKER_REF_ID INT,
    -> BONUS_AMOUNT INT(10),
    -> BONUS_DATE DATETIME,
    -> FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER (WORKER_ID) ON DELETE CASCADE // ON DELETE CASCADE MEANS THAT IF IN THE PARENT TABLE ROW WILL BE DELETED IT WILL BE DELETED IN THE CHILD TABLE ALSO.
    -> );
Query OK, 0 rows affected, 1 warning (0.10 sec)

mysql> INSERT INTO BONUS
    ->     (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    ->     (001, 5000, '16-02-20'),
    ->     (002, 6000, '16-02-23'),
    ->     (003, 4000, '12-02-11'),
    ->     (001, 4500, '16-02-20'),
    ->     (002, 3500, '12-02-11');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE TITLE (
    -> WORKER_REF_ID INT,
    -> WORKER_TITLE CHAR(25),
    -> AFFECTED_FROM DATETIME,
    -> FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO TITLE
    ->     (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    ->     (3, 'EXECUTIVE', '2016-06-11 00:00:00'),
    ->     (1, 'MANAGER', '2016-02-20 00:00:00'),
    ->     (5, 'ACCOUNTANT', '2016-06-11 00:00:00'),
    ->     (4, 'ASST.MANAGER', '2016-06-11 00:00:00'),
    ->     (2, 'EXECUTIVE', '2016-06-11 00:00:00');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from TITLE;
+---------------+--------------+---------------------+
| WORKER_REF_ID | WORKER_TITLE | AFFECTED_FROM       |
+---------------+--------------+---------------------+
|             3 | EXECUTIVE    | 2016-06-11 00:00:00 |
|             1 | MANAGER      | 2016-02-20 00:00:00 |
|             5 | ACCOUNTANT   | 2016-06-11 00:00:00 |
|             4 | ASST.MANAGER | 2016-06-11 00:00:00 |
|             2 | EXECUTIVE    | 2016-06-11 00:00:00 |
+---------------+--------------+---------------------+
5 rows in set (0.00 sec)

mysql> SELECT FIRST_NAME, SALARY FROM WORKER;
+------------+--------+
| FIRST_NAME | SALARY |
+------------+--------+
| MONIKA     | 100000 |
| JATIN      | 200000 |
| JACK       | 100000 |
| SAHIL      | 600000 |
| SONALI     | 200000 |
+------------+--------+
5 rows in set (0.00 sec)


-- WHERE CLAUSE  
mysql> SELECT * FROM WORKER;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         3 | JACK       | TERRIS    | 100000 | 2015-06-11 09:00:04 | EMPLOYEE   |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
+-----------+------------+-----------+--------+---------------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM WORKER WHERE SALARY>500000;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
+-----------+------------+-----------+--------+---------------------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM WORKER WHERE Department = 'HR';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
+-----------+------------+-----------+--------+---------------------+------------+
1 row in set (0.00 sec)

-- BETWEEN 

mysql> SELECT * FROM WORKER WHERE SALARY BETWEEN 200000 AND 600000;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
+-----------+------------+-----------+--------+---------------------+------------+

-- MULTIPLE CHOICES 
mysql> SELECT * from WORKER WHERE DEPARTMENT ='HR' OR DEPARTMENT = 'ADMIN';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
+-----------+------------+-----------+--------+---------------------+------------+
3 rows in set (0.00 sec)

-- IN  // INSTEAD OF USING MULTIPLE OR WE CAN USE SINGLE IN
mysql> SELECT * FROM WORKER WHERE FIRST_NAME IN ('SAHIL', 'JYOTI','ARYAN', 'SONALI');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set (0.00 sec)

-- NOT (TO EXCLUDE)
mysql> SELECT * FROM WORKER WHERE DEPARTMENT NOT IN ('HR', 'ADMIN');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         3 | JACK       | TERRIS    | 100000 | 2015-06-11 09:00:04 | EMPLOYEE   |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set (0.00 sec)

-- USE OF NULL
mysql>  Insert into WORKER VALUES (7, 'RAJ', 'SINGH', 600000, '15-06-11 09.00.06', 'ADMIN');
Query OK, 1 row affected, 1 warning (0.02 sec)

mysql>  Insert into WORKER VALUES (8, 'ADAB', 'ARORA', NULL, '15-06-11 09.00.06', 'EMPLOYEE');
Query OK, 1 row affected, 1 warning (0.02 sec)

mysql> SELECT * from WORKER where SALARY is NULL;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         8 | ADAB       | ARORA     |   NULL | 2015-06-11 09:00:06 | EMPLOYEE   |
+-----------+------------+-----------+--------+---------------------+------------+
1 row in set (0.00 sec)

--  WILDCARD 
mysql> select * from WORKER where first_name LIKE '%i%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.00 sec)

mysql> select * from WORKER where first_name LIKE '_i%';
Empty set (0.00 sec)

mysql> select * from WORKER where first_name LIKE '_a%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         3 | JACK       | TERRIS    | 100000 | 2015-06-11 09:00:04 | EMPLOYEE   |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         7 | RAJ        | SINGH     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.00 sec)

-- SORTINg (ascending Order)
mysql> select * from worker ORDER BY salary;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         8 | ADAB       | ARORA     |   NULL | 2015-06-11 09:00:06 | EMPLOYEE   |
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | JACK       | TERRIS    | 100000 | 2015-06-11 09:00:04 | EMPLOYEE   |
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         7 | RAJ        | SINGH     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
+-----------+------------+-----------+--------+---------------------+------------+
7 rows in set (0.00 sec)

-- in descending order 
mysql> select * from worker ORDER BY salary desc;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | SAHIL      | KUMAR     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         7 | RAJ        | SINGH     | 600000 | 2015-06-11 09:00:06 | ADMIN      |
|         2 | JATIN      | VERMA     | 200000 | 2014-06-11 09:00:01 | ADMIN      |
|         5 | SONALI     | BHADRA    | 200000 | 2015-06-11 09:00:06 | ACCOUNT    |
|         1 | MONIKA     | ARORA     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | JACK       | TERRIS    | 100000 | 2015-06-11 09:00:04 | EMPLOYEE   |
|         8 | ADAB       | ARORA     |   NULL | 2015-06-11 09:00:06 | EMPLOYEE   |
+-----------+------------+-----------+--------+---------------------+------------+
7 rows in set (0.00 sec)

-- Distinct Values 
mysql> select department from worker;
+------------+
| department |
+------------+
| HR         |
| ADMIN      |
| EMPLOYEE   |
| ADMIN      |
| ACCOUNT    |
| ADMIN      |
| EMPLOYEE   |
+------------+
7 rows in set (0.00 sec)

mysql> select DISTINCT department from worker;
+------------+
| department |
+------------+
| HR         |
| ADMIN      |
| EMPLOYEE   |
| ACCOUNT    |
+------------+
4 rows in set (0.00 sec)

-- Data Grouping (Aggregation function - count, sum, avg, max)
-- find no of employees working in different departments
mysql> select department from worker GROUP BY department;
+------------+
| department |
+------------+
| HR         |
| ADMIN      |
| EMPLOYEE   |
| ACCOUNT    |
+------------+
4 rows in set (0.00 sec)

mysql> select department, count(department) from worker GROUP BY department;
+------------+-------------------+
| department | count(department) |
+------------+-------------------+
| HR         |                 1 |
| ADMIN      |                 3 |
| EMPLOYEE   |                 2 |
| ACCOUNT    |                 1 |
+------------+-------------------+
4 rows in set (0.00 sec)

mysql> select department, avg(salary) from worker GROUP BY department;
+------------+-------------+
| department | avg(salary) |
+------------+-------------+
| HR         | 100000.0000 |
| ADMIN      | 466666.6667 |
| EMPLOYEE   | 100000.0000 |
| ACCOUNT    | 200000.0000 |
+------------+-------------+
4 rows in set (0.00 sec)

mysql> select department, MAX(salary) from worker group by department;
+------------+-------------+
| department | MAX(salary) |
+------------+-------------+
| HR         |      100000 |
| ADMIN      |      600000 |
| EMPLOYEE   |      100000 |
| ACCOUNT    |      200000 |
+------------+-------------+
4 rows in set (0.02 sec)

mysql> select department, MIN(salary) from worker group by department;
+------------+-------------+
| department | MIN(salary) |
+------------+-------------+
| HR         |      100000 |
| ADMIN      |      200000 |
| EMPLOYEE   |      100000 |
| ACCOUNT    |      200000 |
+------------+-------------+
4 rows in set (0.00 sec)

mysql> select department, sum(salary) from worker group by department;
+------------+-------------+
| department | sum(salary) |
+------------+-------------+
| HR         |      100000 |
| ADMIN      |     1400000 |
| EMPLOYEE   |      100000 |
| ACCOUNT    |      200000 |
+------------+-------------+
4 rows in set (0.00 sec)

-- Having (filtering inside group by)
-- provide the count of department which only contains more than 2 employees
mysql> select department, COUNT(department) from worker group by department;
+------------+-------------------+
| department | COUNT(department) |
+------------+-------------------+
| HR         |                 1 |
| ADMIN      |                 3 |
| EMPLOYEE   |                 2 |
| ACCOUNT    |                 1 |
+------------+-------------------+
4 rows in set (0.01 sec)

mysql> select department, COUNT(department) from worker group by department having COUNT(department) > 2;
+------------+-------------------+
| department | COUNT(department) |
+------------+-------------------+
| ADMIN      |                 3 |
+------------+-------------------+
1 row in set (0.01 sec)

-- DDL Constraint Commands

mysql> create table account(
    -> id int PRIMARY KEY,
    -> name varchar(255) UNIQUE,
    -> balance INT,
    -> CONSTRAINT acc_balance_chk CHECK(balance >1000)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> INSERT INTO account(id, name, balance)
    -> values(1, 'A', 10000);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO account values(2, 'A', 500);
ERROR 3819 (HY000): Check constraint 'acc_balance_chk' is violated.
mysql> INSERT INTO account values(1, 'A', 5000);
ERROR 1062 (23000): Duplicate entry '1' for key 'account.PRIMARY'
mysql> INSERT INTO account values(3, 'A', 5000);
ERROR 1062 (23000): Duplicate entry 'A' for key 'account.name'

mysql> Drop table account;
Query OK, 0 rows affected (0.04 sec)

mysql> create table account(
    -> id int PRIMARY KEY,
    -> name varchar(255) UNIQUE,
    -> balance INT NOT NULL DEFAULT 0
    -> );
Query OK, 0 rows affected (0.06 sec)


mysql> INSERT INTO account(id, name)
    -> values(1,'A');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO account(id, name)
    -> values (2, 'B');
Query OK, 1 row affected (0.02 sec)

mysql> select * from account;
+----+------+---------+
| id | name | balance |
+----+------+---------+
|  1 | A    |       0 |
|  2 | B    |       0 |
+----+------+---------+
2 rows in set (0.00 sec)

-- ADD new column
mysql> ALTER table account ADD interest FLOAT NOT NULL DEFAULT 0;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from account;
+----+------+---------+----------+
| id | name | balance | interest |
+----+------+---------+----------+
|  1 | A    |       0 |        0 |
|  2 | B    |       0 |        0 |
+----+------+---------+----------+
2 rows in set (0.00 sec)

-- Modify the datatype 
mysql> ALTER Table account MODIFY interest DOUBLE NOT NULL DEFAULT 0;
Query OK, 2 rows affected (0.13 sec)
Records: 2  Duplicates: 0  Warnings: 0

-- Describe the account 
mysql> DESC account; 
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int          | NO   | PRI | NULL    |       |
| name     | varchar(255) | YES  | UNI | NULL    |       |
| balance  | int          | NO   |     | 0       |       |
| interest | double       | NO   |     | 0       |       |
+----------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

-- CHANGE the column name 
mysql> ALTER table account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 4;
Query OK, 2 rows affected (0.17 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> DESC account;
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| id              | int          | NO   | PRI | NULL    |       |
| name            | varchar(255) | YES  | UNI | NULL    |       |
| balance         | int          | NO   |     | 0       |       |
| saving_interest | float        | NO   |     | 4       |       |
+-----------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

-- Drop the column 
mysql> Alter table account DROP column saving_interest;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Desc account;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| id      | int          | NO   | PRI | NULL    |       |
| name    | varchar(255) | YES  | UNI | NULL    |       |
| balance | int          | NO   |     | 0       |       |
+---------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

-- RENAME Table 
mysql> ALTER table account RENAME TO account_details;
Query OK, 0 rows affected (0.03 sec)

mysql> desc account;
ERROR 1146 (42S02): Table 'org.account' doesn't exist'

mysql> show tables;
+-----------------+
| Tables_in_org   |
+-----------------+
| account_details |
| bonus           |
| title           |
| worker          |
+-----------------+
4 rows in set (0.00 sec)

-- DML commands (INSERT, UPDATE, DELETE) -- 

mysql> create table customer (
    -> id INTEGER PRIMARY KEY,
    -> cname VARCHAR(225),
    -> Address varchar(255),
    -> Gender char(2),
    -> City varchar(225),
    -> Pincode integer
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO customer values
    -> (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
    -> (1252, 'Suman Sharma', 'Model Town', 'F', 'Ludhiana', 141002),
    -> (1253, 'Rajesh Mehta', 'Civil Lines', 'M', 'Amritsar', 143001),
    -> (1254, 'Neha Gupta', 'Sector 17', 'F', 'Chandigarh', 160017),
    -> (1255, 'Vikram Singh', 'Shastri Nagar', 'M', 'Patiala', 147001);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> insert into customer values(1252, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);
ERROR 1062 (23000): Duplicate entry '1252' for key 'customer.PRIMARY'

mysql> insert into customer(id, cname)
    -> values (121, 'Bob');
Query OK, 1 row affected (0.02 sec)

mysql> select * from customer;
+------+--------------+---------------+--------+------------+---------+
| id   | cname        | Address       | Gender | City       | Pincode |
+------+--------------+---------------+--------+------------+---------+
|  121 | Bob          | NULL          | NULL   | NULL       |    NULL |
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar  |  144002 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana   |  141002 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar   |  143001 |
| 1254 | Neha Gupta   | Sector 17     | F      | Chandigarh |  160017 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala    |  147001 |
+------+--------------+---------------+--------+------------+---------+
6 rows in set (0.00 sec)

-- update 
mysql> update customer SET ADdress='Mumbai', Gender='M' where id=121;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer;
+------+--------------+---------------+--------+------------+---------+
| id   | cname        | Address       | Gender | City       | Pincode |
+------+--------------+---------------+--------+------------+---------+
|  121 | Bob          | Mumbai        | M      | NULL       |    NULL |
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar  |  144002 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana   |  141002 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar   |  143001 |
| 1254 | Neha Gupta   | Sector 17     | F      | Chandigarh |  160017 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala    |  147001 |
+------+--------------+---------------+--------+------------+---------+
6 rows in set (0.00 sec)

-- update multiple rows
-- we use below command in mysql so that we can tell that it is safe
SET SQL_SAFE_UPDATES = 0;

mysql> update customer set pincode=110000;
Query OK, 6 rows affected (0.02 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from customer;
+------+--------------+---------------+--------+------------+---------+
| id   | cname        | Address       | Gender | City       | Pincode |
+------+--------------+---------------+--------+------------+---------+
|  121 | Bob          | Mumbai        | M      | NULL       |  110000 |
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar  |  110000 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana   |  110000 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar   |  110000 |
| 1254 | Neha Gupta   | Sector 17     | F      | Chandigarh |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala    |  110000 |
+------+--------------+---------------+--------+------------+---------+
6 rows in set (0.00 sec)

mysql> update customer set pincode = pincode + 1;
Query OK, 6 rows affected (0.01 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from customer;
+------+--------------+---------------+--------+------------+---------+
| id   | cname        | Address       | Gender | City       | Pincode |
+------+--------------+---------------+--------+------------+---------+
|  121 | Bob          | Mumbai        | M      | NULL       |  110001 |
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar  |  110001 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana   |  110001 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar   |  110001 |
| 1254 | Neha Gupta   | Sector 17     | F      | Chandigarh |  110001 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala    |  110001 |
+------+--------------+---------------+--------+------------+---------+
6 rows in set (0.00 sec)

mysql> SET SQL_SAFE_UPDATES = 1;
Query OK, 0 rows affected (0.01 sec)

mysql> SET SQL_SAFE_UPDATES = 1;
Query OK, 0 rows affected (0.01 sec)

mysql> update customer set pincode=110000;
ERROR 1175 (HY000): You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.
mysql> SET SQL_SAFE_UPDATES = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> update customer set pincode=110000;
Query OK, 6 rows affected (0.02 sec)
Rows matched: 6  Changed: 6  Warnings: 0

mysql> select * from customer;
+------+--------------+---------------+--------+------------+---------+
| id   | cname        | Address       | Gender | City       | Pincode |
+------+--------------+---------------+--------+------------+---------+
|  121 | Bob          | Mumbai        | M      | NULL       |  110000 |
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar  |  110000 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana   |  110000 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar   |  110000 |
| 1254 | Neha Gupta   | Sector 17     | F      | Chandigarh |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala    |  110000 |
+------+--------------+---------------+--------+------------+---------+
6 rows in set (0.00 sec)

mysql>  SET SQL_SAFE_UPDATES = 1;
Query OK, 0 rows affected (0.00 sec)

-- Delete cascade 
mysql> create table Order_details (
    -> Order_id integer PRIMARY KEY,
    -> delivery_date DATE,
    -> cust_id INT,
    -> FOREIGN KEY(cust_id) references Customer(id)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> Insert into order_details values (1, '2019-03-11', 1254);
Query OK, 1 row affected (0.02 sec)

mysql> select * from order_details;
+----------+---------------+---------+
| Order_id | delivery_date | cust_id |
+----------+---------------+---------+
|        1 | 2019-03-11    |    1254 |
+----------+---------------+---------+
1 row in set (0.00 sec)

mysql> delete from customer where id = 1254; -- error for deleting 
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails 
(`org`.`order_details`, CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`))

mysql> create table Order_details (
    -> Order_id integer PRIMARY KEY,
    -> delivery_date DATE,
    -> cust_id INT,
    -> FOREIGN KEY(cust_id) references Customer(id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> Insert into order_details values (1, '2019-03-11', 1254);
Query OK, 1 row affected (0.02 sec)

mysql>  Insert into order_details values (2, '2019-02-12', 1252);
Query OK, 1 row affected (0.02 sec)

mysql> select * from order_details;
+----------+---------------+---------+
| Order_id | delivery_date | cust_id |
+----------+---------------+---------+
|        1 | 2019-03-11    |    1254 |
|        2 | 2019-02-12    |    1252 |
+----------+---------------+---------+
2 rows in set (0.00 sec)

mysql> delete from customer where id = 1254;
Query OK, 1 row affected (0.02 sec)

mysql> select * from customer;
+------+--------------+---------------+--------+-----------+---------+
| id   | cname        | Address       | Gender | City      | Pincode |
+------+--------------+---------------+--------+-----------+---------+
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar |  110000 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana  |  110000 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar  |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala   |  110000 |
+------+--------------+---------------+--------+-----------+---------+
4 rows in set (0.00 sec)

mysql> select * from order_details;
+----------+---------------+---------+
| Order_id | delivery_date | cust_id |
+----------+---------------+---------+
|        2 | 2019-02-12    |    1252 |
+----------+---------------+---------+
1 row in set (0.00 sec) -- no order left with index 1254

mysql> drop table order_details;
Query OK, 0 rows affected (0.04 sec)

mysql> create table Order_details (
    -> Order_id integer PRIMARY KEY,
    -> delivery_date DATE,
    -> cust_id INT,
    -> FOREIGN KEY(cust_id) references Customer(id) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> select * from customer;
+------+--------------+---------------+--------+-----------+---------+
| id   | cname        | Address       | Gender | City      | Pincode |
+------+--------------+---------------+--------+-----------+---------+
| 1251 | Ram Kumar    | Dilbagh Nagar | M      | Jalandhar |  110000 |
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana  |  110000 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar  |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala   |  110000 |
+------+--------------+---------------+--------+-----------+---------+
4 rows in set (0.02 sec)

mysql> Insert into order_details values (1, '2019-03-11', 1252);
Query OK, 1 row affected (0.01 sec)

mysql> Insert into order_details values (2, '2019-06-11', 1251);
Query OK, 1 row affected (0.02 sec)

mysql> select * from order_details;
+----------+---------------+---------+
| Order_id | delivery_date | cust_id |
+----------+---------------+---------+
|        1 | 2019-03-11    |    1252 |
|        2 | 2019-06-11    |    1251 |
+----------+---------------+---------+
2 rows in set (0.00 sec)

mysql> delete from customer where id = 1251;
Query OK, 1 row affected (0.02 sec)

mysql> select * from order_details;
+----------+---------------+---------+
| Order_id | delivery_date | cust_id |
+----------+---------------+---------+
|        1 | 2019-03-11    |    1252 |
|        2 | 2019-06-11    |    NULL |
+----------+---------------+---------+
2 rows in set (0.00 sec)

-- REPLACE 
mysql> select * from customer;
+------+--------------+---------------+--------+----------+---------+
| id   | cname        | Address       | Gender | City     | Pincode |
+------+--------------+---------------+--------+----------+---------+
| 1252 | Suman Sharma | Model Town    | F      | Ludhiana |  110000 |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala  |  110000 |
+------+--------------+---------------+--------+----------+---------+
3 rows in set (0.00 sec)

-- here we use replace to change the values;
mysql> Replace into customer (id, City) values(1252, 'City colony');
Query OK, 2 rows affected (0.02 sec)

mysql> select * from customer;
+------+--------------+---------------+--------+-------------+---------+
| id   | cname        | Address       | Gender | City        | Pincode |
+------+--------------+---------------+--------+-------------+---------+
| 1252 | NULL         | NULL          | NULL   | City colony |    NULL |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar    |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala     |  110000 |
+------+--------------+---------------+--------+-------------+---------+
3 rows in set (0.00 sec)

-- below replace acts as insert because 1251 id does not exist 
mysql> replace into customer (id, cname, City) values(1251, 'raj', 'Chandigarh'); 
Query OK, 1 row affected (0.01 sec)

mysql> select * from customer;
+------+--------------+---------------+--------+-------------+---------+
| id   | cname        | Address       | Gender | City        | Pincode |
+------+--------------+---------------+--------+-------------+---------+
| 1251 | raj          | NULL          | NULL   | Chandigarh  |    NULL |
| 1252 | NULL         | NULL          | NULL   | City colony |    NULL |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar    |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala     |  110000 |
+------+--------------+---------------+--------+-------------+---------+
4 rows in set (0.00 sec)

mysql> replace into customer set id = 1300, cname = 'Mac', City = 'Utah';
Query OK, 1 row affected (0.02 sec)

mysql> select * from customer;
+------+--------------+---------------+--------+-------------+---------+
| id   | cname        | Address       | Gender | City        | Pincode |
+------+--------------+---------------+--------+-------------+---------+
| 1251 | raj          | NULL          | NULL   | Chandigarh  |    NULL |
| 1252 | NULL         | NULL          | NULL   | City colony |    NULL |
| 1253 | Rajesh Mehta | Civil Lines   | M      | Amritsar    |  110000 |
| 1255 | Vikram Singh | Shastri Nagar | M      | Patiala     |  110000 |
| 1300 | Mac          | NULL          | NULL   | Utah        |    NULL |
+------+--------------+---------------+--------+-------------+---------+
5 rows in set (0.00 sec)





