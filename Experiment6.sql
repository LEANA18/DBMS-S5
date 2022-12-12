mysql> DELIMITER //
mysql> create procedure BOOK_RETURN(IN p1 int,IN p2 date,IN p3 int,IN p4 int)
    -> begin
    -> UPDATE BOOK_ISSUE SET STATUS='Returned' where Issue_id=p1;
    -> insert into BOOK_RETURN values(p1,p2,p3,p4);
    -> end //
Query OK, 0 rows affected (0.07 sec)

mysql> DELIMITER ;
mysql> SELECT * FROM BOOK_RETURN;
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | Late_days | Late_fee |
+----------+-----------------------+-----------+----------+
|      102 | 2019-09-17            |         8 |       16 |
+----------+-----------------------+-----------+----------+

mysql> CALL BOOK_RETURN(102,"2019-09-17",8,125);
Query OK, 1 row affected (0.05 sec)

mysql> CALL BOOK_RETURN(103,"2013-02-27",3,12);
Query OK, 1 row affected (0.04 sec)

mysql> CALL BOOK_RETURN(200,"2014-01-01",2,9);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM BOOK_RETURN;
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | Late_days | Late_fee |
+----------+-----------------------+-----------+----------+
|      102 | 2019-09-17            |         8 |       16 |
|      102 | 2019-09-17            |         8 |      125 |
|      103 | 2013-02-27            |         3 |       12 |
|      200 | 2014-01-01            |         2 |        9 |
+----------+-----------------------+-----------+----------+
4 rows in set (0.00 sec)
