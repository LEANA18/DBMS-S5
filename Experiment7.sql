mysql> DELIMITER //
mysql> create procedure BOOK(IN p1 int(11),IN p2 varchar(15),IN p3 int(11),IN p4 bigint(20),IN p5 int(11),IN p6 date,IN p7 int(11),IN p8 varchar(20))
    -> begin
    -> insert into BOOK values(p1,p2,p3,p4,p5,p6,p7,p8);
    -> UPDATE BOOK SET Status="Not Available" where publisher_id=101;
    -> delete from BOOK where Book_id=101;
    -> end //
Query OK, 0 rows affemysql> CALL BOOK(105," Small Things",1,2300,3,"2020-09-20",6,"YES"); END//
Query OK, 1 row affected (0.11 sec)
cted (0.01 sec)
mysql> select * from BOOK;
    -> //
+---------+---------------+-------------+------+--------------+----------------+--------+--------+
| Book_id | Title         | language_id | MRP  | Publisher_id | Published_date | Volumn | Status |
+---------+---------------+-------------+------+--------------+----------------+--------+--------+
|     102 | Primal Hunter |           2 |  250 |            2 | 2000-07-09     |      5 | Yes    |
|     105 |  Small Things |           1 | 2300 |            3 | 2020-09-20     |      6 | YES    |
+---------+---------------+-------------+------+--------------+----------------+--------+--------+
2 rows in set (0.00 sec)
