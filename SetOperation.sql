mysql> create table dept1(
    -> empid INT PRIMARY KEY,
    -> name VARCHAR(25),
    -> role VARCHAR(180)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO dept1 values
    -> (1,'A','ENGINEER');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO dept1 values
    -> (2,'B','SALESMAN'),
    -> (3, 'C', 'MANAGER'),
    -> (4, 'D', 'SALESMAN'),
    -> (5, 'E', 'ENGINEER');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPT1;
+-------+------+----------+
| empid | name | role     |
+-------+------+----------+
|     1 | A    | ENGINEER |
|     2 | B    | SALESMAN |
|     3 | C    | MANAGER  |
|     4 | D    | SALESMAN |
|     5 | E    | ENGINEER |
+-------+------+----------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE DEPT2(
    -> empid INT PRIMARY KEY,
    -> name VARCHAR(25),
    -> role VARCHAR(180)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO dept2 (empid, name, role) VALUES
    ->     (3, 'C', 'MANAGER'),
    ->     (6, 'F', 'MARKETING'),
    ->     (7, 'G', 'SALESMAN');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPT2;
+-------+------+-----------+
| empid | name | role      |
+-------+------+-----------+
|     3 | C    | MANAGER   |
|     6 | F    | MARKETING |
|     7 | G    | SALESMAN  |
+-------+------+-----------+
3 rows in set (0.00 sec)

-- SET OPERATIONS
-- LIST OUT ALL THE EMPLOYEES IN THE COMPANY
mysql> SELECT * FROM DEPT1
    -> UNION
    -> SELECT * FROM DEPT2;
+-------+------+-----------+
| empid | name | role      |
+-------+------+-----------+
|     1 | A    | ENGINEER  |
|     2 | B    | SALESMAN  |
|     3 | C    | MANAGER   |
|     4 | D    | SALESMAN  |
|     5 | E    | ENGINEER  |
|     6 | F    | MARKETING |
|     7 | G    | SALESMAN  |
+-------+------+-----------+
7 rows in set (0.02 sec)

-- LIST OUT ALL THE EMPLOYESS IN ALL THE DEPARTMENTS WHO WORK AS SALESMAN
mysql> SELECT * FROM DEPT1 WHERE ROLE ='SALESMAN'
    -> UNION
    -> SELECT * FROM DEPT2 WHERE ROLE ='SALESMAN';
+-------+------+----------+
| empid | name | role     |
+-------+------+----------+
|     2 | B    | SALESMAN |
|     4 | D    | SALESMAN |
|     7 | G    | SALESMAN |
+-------+------+----------+
3 rows in set (0.00 sec)

-- LIST OUT ALL THE EMPLOYEES WHO WORK FOR BOTH THE DEPARTMENTS
-- INTERSECTION (As we cannot directly use intersect so we will emulate it )
mysql> SELECT * FROM DEPT1 INNER JOIN DEPT2 USING (EMPID);
+-------+------+---------+------+---------+
| empid | name | role    | name | role    |
+-------+------+---------+------+---------+
|     3 | C    | MANAGER | C    | MANAGER |
+-------+------+---------+------+---------+
1 row in set (0.00 sec)
-- since this is set operation so no of rows increse here inspite of columns . Thus the query will be 
mysql> select dept1.*  FROM DEPT1 INNER JOIN DEPT2 USING (EMPID);
+-------+------+---------+
| empid | name | role    |
+-------+------+---------+
|     3 | C    | MANAGER |
+-------+------+---------+
1 row in set (0.01 sec)

-- LIST OUT ALL THE EMPLOYEES WORKING IN DEPT 1 NOT IN DEPT2
-- MINUS OPERATION 
mysql> SELECT DEPT1.* FROM DEPT1 LEFT JOIN DEPT2 USING(EMPID)
    -> WHERE DEPT2.EMPID IS NULL;
+-------+------+----------+
| empid | name | role     |
+-------+------+----------+
|     1 | A    | ENGINEER |
|     2 | B    | SALESMAN |
|     4 | D    | SALESMAN |
|     5 | E    | ENGINEER |
+-------+------+----------+
4 rows in set (0.00 sec)
