-- SUB QUERIES 
mysql> CREATE TABLE Employee (
    ->     id INT PRIMARY KEY,
    ->     fname VARCHAR(50),
    ->     lname VARCHAR(50),
    ->     Age INT,
    ->     emailID VARCHAR(100),
    ->     PhoneNo VARCHAR(20),
    ->     City VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql>
mysql> -- Table: Client
mysql> CREATE TABLE Client (
    ->     id INT PRIMARY KEY,
    ->     first_name VARCHAR(50),
    ->     last_name VARCHAR(50),
    ->     age INT,
    ->     emailID VARCHAR(100),
    ->     PhoneNo VARCHAR(20),
    ->     City VARCHAR(50),
    ->     empID INT,
    ->     FOREIGN KEY (empID) REFERENCES Employee(id)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> -- Table: Project
mysql> CREATE TABLE Project (
    ->     id INT PRIMARY KEY,
    ->     empID INT,
    ->     name CHAR(10),
    ->     startdate DATE,
    ->     clientID INT,
    ->     FOREIGN KEY (empID) REFERENCES Employee(id),
    ->     FOREIGN KEY (clientID) REFERENCES Client(id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> -- Insert data into Employee table
mysql> INSERT INTO Employee (id, fname, lname, Age, emailID, PhoneNo, City) VALUES
    -> (1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
    -> (2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
    -> (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
    -> (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
    -> (5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert data into Client table
mysql> INSERT INTO Client (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
    -> (1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
    -> (2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
    -> (3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
    -> (4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
    -> (5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Insert data into Project table
mysql> INSERT INTO Project (id, empID, name, startdate, clientID) VALUES
    -> (1, 1, 'A', '2021-04-21', 3),
    -> (2, 2, 'B', '2021-03-12', 1),
    -> (3, 3, 'C', '2021-01-16', 5),
    -> (4, 3, 'D', '2021-04-27', 2),
    -> (5, 5, 'E', '2021-05-01', 4);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql> SELECT * FROM PROJECT;
+----+-------+------+------------+----------+
| id | empID | name | startdate  | clientID |
+----+-------+------+------------+----------+
|  1 |     1 | A    | 2021-04-21 |        3 |
|  2 |     2 | B    | 2021-03-12 |        1 |
|  3 |     3 | C    | 2021-01-16 |        5 |
|  4 |     3 | D    | 2021-04-27 |        2 |
|  5 |     5 | E    | 2021-05-01 |        4 |
+----+-------+------+------------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEE;
+----+-------+---------+------+-----------------+---------+---------+
| id | fname | lname   | Age  | emailID         | PhoneNo | City    |
+----+-------+---------+------+-----------------+---------+---------+
|  1 | Aman  | Proto   |   32 | aman@gmail.com  | 898     | Delhi   |
|  2 | Yagya | Narayan |   44 | yagya@gmail.com | 222     | Palam   |
|  3 | Rahul | BD      |   22 | rahul@gmail.com | 444     | Kolkata |
|  4 | Jatin | Hermit  |   31 | jatin@gmail.com | 666     | Raipur  |
|  5 | PK    | Pandey  |   21 | pk@gmail.com    | 555     | Jaipur  |
+----+-------+---------+------+-----------------+---------+---------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM CLIENT;
+----+------------+-----------+------+-------------------+---------+-----------+-------+
| id | first_name | last_name | age  | emailID           | PhoneNo | City      | empID |
+----+------------+-----------+------+-------------------+---------+-----------+-------+
|  1 | Mac        | Rogers    |   47 | mac@hotmail.com   | 333     | Kolkata   |     3 |
|  2 | Max        | Poirier   |   27 | max@gmail.com     | 222     | Kolkata   |     3 |
|  3 | Peter      | Jain      |   24 | peter@abc.com     | 111     | Delhi     |     1 |
|  4 | Sushant    | Aggarwal  |   23 | sushant@yahoo.com | 45454   | Hyderabad |     5 |
|  5 | Pratap     | Singh     |   36 | p@xyz.com         | 77767   | Mumbai    |     2 |
+----+------------+-----------+------+-------------------+---------+-----------+-------+
5 rows in set (0.01 sec)

-- Use where clause on the same Table 
mysql> select * from employee where age in (select age from employee where age > 30 );
+----+-------+---------+------+-----------------+---------+--------+
| id | fname | lname   | Age  | emailID         | PhoneNo | City   |
+----+-------+---------+------+-----------------+---------+--------+
|  1 | Aman  | Proto   |   32 | aman@gmail.com  | 898     | Delhi  |
|  2 | Yagya | Narayan |   44 | yagya@gmail.com | 222     | Palam  |
|  4 | Jatin | Hermit  |   31 | jatin@gmail.com | 666     | Raipur |
+----+-------+---------+------+-----------------+---------+--------+
3 rows in set (0.02 sec)

mysql> select * from employee where age > 30;
+----+-------+---------+------+-----------------+---------+--------+
| id | fname | lname   | Age  | emailID         | PhoneNo | City   |
+----+-------+---------+------+-----------------+---------+--------+
|  1 | Aman  | Proto   |   32 | aman@gmail.com  | 898     | Delhi  |
|  2 | Yagya | Narayan |   44 | yagya@gmail.com | 222     | Palam  |
|  4 | Jatin | Hermit  |   31 | jatin@gmail.com | 666     | Raipur |
+----+-------+---------+------+-----------------+---------+--------+
3 rows in set (0.00 sec)

-- where clause on different tables
-- employee details working in more than 1 projects
mysql> select * from employee where id in (
    -> select empID from project group by empID having count(empID) > 1
    -> );
+----+-------+-------+------+-----------------+---------+---------+
| id | fname | lname | Age  | emailID         | PhoneNo | City    |
+----+-------+-------+------+-----------------+---------+---------+
|  3 | Rahul | BD    |   22 | rahul@gmail.com | 444     | Kolkata |
+----+-------+-------+------+-----------------+---------+---------+
1 row in set (0.01 sec)

-- single value subquery 
-- employee details having age > avg(age)
mysql> select * from employee where age > (select avg(age) from Employee);
+----+-------+---------+------+-----------------+---------+--------+
| id | fname | lname   | Age  | emailID         | PhoneNo | City   |
+----+-------+---------+------+-----------------+---------+--------+
|  1 | Aman  | Proto   |   32 | aman@gmail.com  | 898     | Delhi  |
|  2 | Yagya | Narayan |   44 | yagya@gmail.com | 222     | Palam  |
|  4 | Jatin | Hermit  |   31 | jatin@gmail.com | 666     | Raipur |
+----+-------+---------+------+-----------------+---------+--------+
3 rows in set (0.00 sec)

mysql> select avg(age) from Employee;
+----------+
| avg(age) |
+----------+
|  30.0000 |
+----------+
1 row in set (0.00 sec)

-- From clause (Derived Tables)
-- Select max age person who first name contains 'a'
mysql> select max(age) from (select * from Employee where fname like '%a%') As Temp;
+----------+
| max(age) |
+----------+
|       44 |
+----------+
1 row in set (0.00 sec)

-- Corelated subquery 
-- find 3rd oldest employee 
mysql> select * from employee e1 where 3 = ( Select count(e2.age)
    -> from employee e2 where e2.age >= e1.age
    -> );
+----+-------+--------+------+-----------------+---------+--------+
| id | fname | lname  | Age  | emailID         | PhoneNo | City   |
+----+-------+--------+------+-----------------+---------+--------+
|  4 | Jatin | Hermit |   31 | jatin@gmail.com | 666     | Raipur |
+----+-------+--------+------+-----------------+---------+--------+
1 row in set (0.00 sec)


