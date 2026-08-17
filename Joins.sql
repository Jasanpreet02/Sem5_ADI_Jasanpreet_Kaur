mysql> -- Table: Employee  
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

mysql> select * from employee;
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

mysql> select * from Project;
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

mysql> Select * from Client;
+----+------------+-----------+------+-------------------+---------+-----------+-------+
| id | first_name | last_name | age  | emailID           | PhoneNo | City      | empID |
+----+------------+-----------+------+-------------------+---------+-----------+-------+
|  1 | Mac        | Rogers    |   47 | mac@hotmail.com   | 333     | Kolkata   |     3 |
|  2 | Max        | Poirier   |   27 | max@gmail.com     | 222     | Kolkata   |     3 |
|  3 | Peter      | Jain      |   24 | peter@abc.com     | 111     | Delhi     |     1 |
|  4 | Sushant    | Aggarwal  |   23 | sushant@yahoo.com | 45454   | Hyderabad |     5 |
|  5 | Pratap     | Singh     |   36 | p@xyz.com         | 77767   | Mumbai    |     2 |
+----+------------+-----------+------+-------------------+---------+-----------+-------+
5 rows in set (0.00 sec)

-- INNER JOIN
 -- Enlist all the employees id , name along with the project allocated to them
mysql> select e.id,e.fname,e.lname,p.id,p.name from employee as e INNER JOIN Project as p ON e.id = p.empID;
+----+-------+---------+----+------+
| id | fname | lname   | id | name |
+----+-------+---------+----+------+
|  1 | Aman  | Proto   |  1 | A    |
|  2 | Yagya | Narayan |  2 | B    |
|  3 | Rahul | BD      |  3 | C    |
|  3 | Rahul | BD      |  4 | D    |
|  5 | PK    | Pandey  |  5 | E    |
+----+-------+---------+----+------+
5 rows in set (0.00 sec)

-- fetch out all the employee ID's and their contact details who have been working from jaipur with the clients name working in Hyderabad.
mysql> select e.id, e.emailID, e.phoneNo, c.first_name, c.last_name from Employee as e INNER JOIN Client as c ON e.id = c.empID where e.City = 'Jaipur' and c.City = 'Hyderabad';
+----+--------------+---------+------------+-----------+
| id | emailID      | phoneNo | first_name | last_name |
+----+--------------+---------+------------+-----------+
|  5 | pk@gmail.com | 555     | Sushant    | Aggarwal  |
+----+--------------+---------+------------+-----------+
1 row in set (0.00 sec)

-- LEFT JOIN
-- fetch out each project allocated to each employee
 select * from Employee LEFT JOIN Project on Employee.id = Project.id;
 --OR
 mysql> select * from Employee as e LEFT JOIN Project as p on e.id = p.id;
+----+-------+---------+------+-----------------+---------+---------+------+-------+------+------------+----------+
| id | fname | lname   | Age  | emailID         | PhoneNo | City    | id   | empID | name | startdate  | clientID |
+----+-------+---------+------+-----------------+---------+---------+------+-------+------+------------+----------+
|  1 | Aman  | Proto   |   32 | aman@gmail.com  | 898     | Delhi   |    1 |     1 | A    | 2021-04-21 |        3 |
|  2 | Yagya | Narayan |   44 | yagya@gmail.com | 222     | Palam   |    2 |     2 | B    | 2021-03-12 |        1 |
|  3 | Rahul | BD      |   22 | rahul@gmail.com | 444     | Kolkata |    3 |     3 | C    | 2021-01-16 |        5 |
|  4 | Jatin | Hermit  |   31 | jatin@gmail.com | 666     | Raipur  |    4 |     3 | D    | 2021-04-27 |        2 |
|  5 | PK    | Pandey  |   21 | pk@gmail.com    | 555     | Jaipur  |    5 |     5 | E    | 2021-05-01 |        4 |
+----+-------+---------+------+-----------------+---------+---------+------+-------+------+------------+----------+
5 rows in set (0.01 sec)

-- RIGHT JOIN
 -- List out all the projects along with the employee's name and their respective allocated email ID.
 mysql> select p.id, p.name, e.fname, e.lname, e.emailID from Employee as e RIGHT JOIN Project as p on e.id = p.empID;
+----+------+-------+---------+-----------------+
| id | name | fname | lname   | emailID         |
+----+------+-------+---------+-----------------+
|  1 | A    | Aman  | Proto   | aman@gmail.com  |
|  2 | B    | Yagya | Narayan | yagya@gmail.com |
|  3 | C    | Rahul | BD      | rahul@gmail.com |
|  4 | D    | Rahul | BD      | rahul@gmail.com |
|  5 | E    | PK    | Pandey  | pk@gmail.com    |
+----+------+-------+---------+-----------------+
5 rows in set (0.00 sec)

-- CROSS JOIN
-- List out all the combination possible for the employee's name and projects that can exist
mysql> select e.fname, e.lname, p.id, p.name from Employee as e cross join Project as p;
+-------+---------+----+------+
| fname | lname   | id | name |
+-------+---------+----+------+
| PK    | Pandey  |  1 | A    |
| Jatin | Hermit  |  1 | A    |
| Rahul | BD      |  1 | A    |
| Yagya | Narayan |  1 | A    |
| Aman  | Proto   |  1 | A    |
| PK    | Pandey  |  2 | B    |
| Jatin | Hermit  |  2 | B    |
| Rahul | BD      |  2 | B    |
| Yagya | Narayan |  2 | B    |
| Aman  | Proto   |  2 | B    |
| PK    | Pandey  |  3 | C    |
| Jatin | Hermit  |  3 | C    |
| Rahul | BD      |  3 | C    |
| Yagya | Narayan |  3 | C    |
| Aman  | Proto   |  3 | C    |
| PK    | Pandey  |  4 | D    |
| Jatin | Hermit  |  4 | D    |
| Rahul | BD      |  4 | D    |
| Yagya | Narayan |  4 | D    |
| Aman  | Proto   |  4 | D    |
| PK    | Pandey  |  5 | E    |
| Jatin | Hermit  |  5 | E    |
| Rahul | BD      |  5 | E    |
| Yagya | Narayan |  5 | E    |
| Aman  | Proto   |  5 | E    |
+-------+---------+----+------+
25 rows in set (0.01 sec)

-- Use JOIN without using word Join
mysql> select e.id, e.fname, e.lname, p.id, p.name from employee as e, project as p where e.id = p.empID;
+----+-------+---------+----+------+
| id | fname | lname   | id | name |
+----+-------+---------+----+------+
|  1 | Aman  | Proto   |  1 | A    |
|  2 | Yagya | Narayan |  2 | B    |
|  3 | Rahul | BD      |  3 | C    |
|  3 | Rahul | BD      |  4 | D    |
|  5 | PK    | Pandey  |  5 | E    |
+----+-------+---------+----+------+
5 rows in set (0.00 sec)

