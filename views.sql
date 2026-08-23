PS C:\Users\Asus> mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 132
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use org;
Database changed
mysql> select * from Employee;
+----+-------+---------+------+-----------------+---------+---------+
| id | fname | lname   | Age  | emailID         | PhoneNo | City    |
+----+-------+---------+------+-----------------+---------+---------+
|  1 | Aman  | Proto   |   32 | aman@gmail.com  | 898     | Delhi   |
|  2 | Yagya | Narayan |   44 | yagya@gmail.com | 222     | Palam   |
|  3 | Rahul | BD      |   22 | rahul@gmail.com | 444     | Kolkata |
|  4 | Jatin | Hermit  |   31 | jatin@gmail.com | 666     | Raipur  |
|  5 | PK    | Pandey  |   21 | pk@gmail.com    | 555     | Jaipur  |
+----+-------+---------+------+-----------------+---------+---------+
5 rows in set (0.01 sec)

-- to create custom view 
mysql> create view custom_view as select fname,age from employee;
Query OK, 0 rows affected (0.05 sec)

mysql> select * from custom_view;
+-------+------+
| fname | age  |
+-------+------+
| Aman  |   32 |
| Yagya |   44 |
| Rahul |   22 |
| Jatin |   31 |
| PK    |   21 |
+-------+------+
5 rows in set (0.01 sec)

-- alter the custom view 
mysql> alter view custom_view as select fname, lname, age from employee;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from custom_view;
+-------+---------+------+
| fname | lname   | age  |
+-------+---------+------+
| Aman  | Proto   |   32 |
| Yagya | Narayan |   44 |
| Rahul | BD      |   22 |
| Jatin | Hermit  |   31 |
| PK    | Pandey  |   21 |
+-------+---------+------+
5 rows in set (0.01 sec)

-- drop the custom view 
mysql> drop view if exists custom_view;
Query OK, 0 rows affected (0.02 sec)

-- no view exists after the drop of the table 
mysql> select * from custom_view;
ERROR 1146 (42S02): Table 'org.custom_view' doesn't exist