VIEWS
******

mysql> CREATE VIEW Available_Books AS SELECT BOOK.Title FROM BOOK WHERE Status='Yes';
Query OK, 0 rows affected (0.03 sec)

mysql> SELECT * FROM Available_Books;
+---------------+
| Title         |
+---------------+
| Primal Hunter |
|  Small Things |
+---------------+
2 rows in set (0.01 sec)
