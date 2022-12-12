STORED PROCEDURES III
*********************

1)
mysql> CREATE DATABASE EMPLOYEES;
Query OK, 1 row affected (0.00 sec)
mysql> USE EMPLOYEES;
Database changed

2)
mysql> CREATE TABLE CITY(city_name varchar(20),postal_code int(20) primary key,state varchar(20));
Query OK, 0 rows affected (0.33 sec)

mysql> desc CITY;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| city_name   | varchar(20) | YES  |     | NULL    |       |
| postal_code | int(20)     | NO   | PRI | NULL    |       |
| state       | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

3)
mysql> CREATE TABLE EMPLOYEE(emp_id int(10) primary key,first_name varchar(20),last_name varchar(20),email varchar(20),phone_no int(10),hire_date date,salary int(10),postal_code int(10),foreign key(postal_code)references CITY(postal_code));
Query OK, 0 rows affected (0.33 sec)

mysql> desc EMPLOYEE;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| emp_id      | int(10)     | NO   | PRI | NULL    |       |
| first_name  | varchar(20) | YES  |     | NULL    |       |
| last_name   | varchar(20) | YES  |     | NULL    |       |
| email       | varchar(20) | YES  |     | NULL    |       |
| phone_no    | int(10)     | YES  |     | NULL    |       |
| hire_date   | date        | YES  |     | NULL    |       |
| salary      | int(10)     | YES  |     | NULL    |       |
| postal_code | int(10)     | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

4)
mysql> CREATE TABLE DEPARTMENT(manager_id int(10) primary key,dept_name varchar(20),foreign key(manager_id)references EMPLOYEE(emp_id));
Query OK, 0 rows affected (0.28 sec)

mysql> desc DEPARTMENT;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| manager_id | int(10)     | NO   | PRI | NULL    |       |
| dept_name  | varchar(20) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
5)
mysql> INSERT INTO CITY VALUES('THIRUVANTHAPURAM',686523,'KERALA');
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO CITY VALUES('CHANGANASSERY',686535,'KERALA');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO CITY VALUES('PALA',686536,'KERALA');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO CITY VALUE('KOTTAYAM',686545,'KERALA');
Query OK, 1 row affected (0.04 sec)
mysql> INSERT INTO CITY VALUES('OOTY',686589,'TAMIL NADU');
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM CITY;
+------------------+-------------+------------+
| city_name        | postal_code | state      |
+------------------+-------------+------------+
| THIRUVANTHAPURAM |      686523 | KERALA     |
| CHANGANASSERY    |      686535 | KERALA     |
| PALA             |      686536 | KERALA     |
| KOTTAYAM         |      686545 | KERALA     |
| OOTY             |      686589 | TAMIL NADU |
+------------------+-------------+------------+
5 rows in set (0.00 sec)
6)

mysql> INSERT INTO EMPLOYEE VALUES(1001,'Abhinanth','K','abhi@gmail.com',2134569834,'2001-08-10',10000,686535);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO EMPLOYEE VALUES(1002,'Abhijith','C','abhijith@gmail.com',903456781,'2020-05-30',15000,686589);
Query OK, 1 row affected (0.04 sec)
mysql> INSERT INTO EMPLOYEE VALUES(1003,'Amal','Ashok','amal@gmail.com',973456781,'1990-08-12',8000,686523);
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM EMPLOYEE;
+--------+------------+-----------+--------------------+------------+------------+--------+-------------+
| emp_id | first_name | last_name | email              | phone_no   | hire_date  | salary | postal_code |
+--------+------------+-----------+--------------------+------------+------------+--------+-------------+
|   1001 | Abhinanth  | K         | abhi@gmail.com     | 2134569834 | 2001-08-10 |  10000 |      686535 |
|   1002 | Abhijith   | C         | abhijith@gmail.com |  903456781 | 2020-05-30 |  15000 |      686589 |
|   1003 | Amal       | Ashok     | amal@gmail.com     |  973456781 | 1990-08-12 |   8000 |      686523 |
+--------+------------+-----------+--------------------+------------+------------+--------+-------------+
3 rows in set (0.00 sec)
7)
mysql> INSERT INTO DEPARTMENT VALUES(1001,'Mathematics');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO DEPARTMENT VALUES(1002,'Physics');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO DEPARTMENT VALUES(1003,'Programming');
Query OK, 1 row affected (0.04 sec)

mysql> select * from DEPARTMENT;
+------------+-------------+
| manager_id | dept_name   |
+------------+-------------+
|       1001 | Mathematics |
|       1002 | Physics     |
|       1003 | Programming |
+------------+-------------+
3 rows in set (0.00 sec)
8)

mysql> delimiter //
mysql> CREATE procedure test1(IN sal int)
    -> begin
    -> (SELECT COUNT(emp_id)no_employees from EMPLOYEE WHERE salary>sal);
    -> (SELECT COUNT(emp_id)no_employees1 from EMPLOYEE WHERE salary<sal);
    -> (SELECT COUNT(emp_id)no_employees2 from EMPLOYEE WHERE salary=sal);
    -> end //
Query OK, 0 rows affected (0.00 sec)

mysql> call test1(10000);
    -> //
+--------------+
| no_employees |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

+---------------+
| no_employees1 |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)

+---------------+
| no_employees2 |
+---------------+
|             1 |
+---------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)



