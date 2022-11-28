mysql> SELECT * FROM BOOK_RETURN;
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | Late_days | Late_fee |
+----------+-----------------------+-----------+----------+
|      102 | 2019-09-17            |         8 |       16 |
+----------+-----------------------+-----------+----------+
mysql> SELECT * FROM LATE_FEE_RULE;
+-----------+---------+--------+
| from_days | To_days | Amount |
+-----------+---------+--------+
|         0 |       7 |   2300 |
|         7 |      30 |   4300 |
+-----------+---------+--------+
mysql> SELECT * FROM MEMBER;
+-----------+-------+-------------+---------+-----------------+--------------+-----------+
| Member_id | Name  | Branch_code | Roll_no | Email           | Date_of_Join | Status    |
+-----------+-------+-------------+---------+-----------------+--------------+-----------+
|        33 | Delna |         234 |      12 | delna@gmail.com | 2019-01-02   | Available |
|        34 | Tiya  |         250 |      11 | tiya@gmail.com  | 2019-01-02   | Available |
+-----------+-------+-------------+---------+-----------------+--------------+-----------+
mysql> SELECT * FROM LANGUAGE;
+---------+---------+
| lang_id | Name    |
+---------+---------+
|       1 | English |
+---------+---------+
mysql> SELECT * FROM BOOK_ISSUE;
+----------+---------------+---------+-----------+-------------------------+
| Issue_id | Date_of_issue | book_id | Member_id | Expected_Date_of_Return |
+----------+---------------+---------+-----------+-------------------------+
|      101 | 2019-09-09    |     101 |        33 | 2019-09-17              |
+----------+---------------+---------+-----------+-------------------------+
mysql> SELECT * FROM PUBLISHER;
+--------------+--------+-------------------------------+
| Publisher_id | Name   | Address                       |
+--------------+--------+-------------------------------+
|            1 | Ardra  | abc                           |
|            2 | Anjali | xyz                           |
|           12 | Leah   | House123 White Field Banglore |
+--------------+--------+-------------------------------+
mysql> SELECT * FROM BOOK_AUTHOR;
+---------+-----------+
| Book_id | Author_id |
+---------+-----------+
|     101 |       502 |
|     102 |       502 |
+---------+-----------+
mysql> SELECT * FROM BOOK;
+---------+---------------+-------------+------+--------------+----------------+--------+--------+
| Book_id | Title         | language_id | MRP  | Publisher_id | Published_date | Volumn | Status |
+---------+---------------+-------------+------+--------------+----------------+--------+--------+
|     101 | Hidden World  |           1 |  150 |            1 | 2020-09-09     |      2 | Yes    |
|     102 | Primal Hunter |           2 |  250 |            2 | 2000-07-09     |      5 | Yes    |
+---------+---------------+-------------+------+--------------+----------------+--------+--------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM AUTHOR;
+-----------+-------+-----------------+-------+--------+
| Author_id | Name  | Email           | Ph_no | Status |
+-----------+-------+-----------------+-------+--------+
|       501 | Delna | delna@gmail.com | 81118 | Yes    |
|       502 | tiya  | tiya@gmail.com  | 23345 | Yes    |
+-----------+-------+-----------------+-------+--------+
2 rows in set (0.00 sec)







1)

mysql> SELECT COUNT(*) FROM BOOK_AUTHOR,AUTHOR WHERE Name="Leana" AND AUTHOR.Author_id=BOOK_AUTHOR.Author_id;
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
2)

SELECT PUBLISHER.Name,COUNT(*) FROM BOOK,PUBLISHER WHERE BOOK.Publisher_id=PUBLISHER.Publisher_id GROUP BY(BOOK.Publisher_id);
+--------+----------+
| Name   | COUNT(*) |
+--------+----------+
| Ardra  |        1 |
| Anjali |        1 |
+--------+----------+

3)

mysql> select AUTHOR.Name from (select Author_id from(select Author_id,count(BOOK_AUTHOR.Book_id)as count from BOOK_AUTHOR group by BOOK_AUTHOR.Author_id)as T1 where count >1)as T2,AUTHOR where AUTHOR.Author_id=T2.Author_id;
+------+
| Name |
+------+
| tiya |
+------+

4)

mysql> SELECT BOOK.Title from BOOK,BOOK_ISSUE,BOOK_RETURN WHERE BOOK.Book_id = BOOK_ISSUE.Issue_id AND BOOK_ISSUE.Issue_id NOT IN(SELECT Issue_id FROM BOOK_RETURN)GROUP BY BOOK.Title;
+--------------+
| Title        |
+--------------+
| Hidden World |
+--------------+








