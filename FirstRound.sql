recover password:
1.  create mysql-init.txt 
2.  mysqld --init-file=filelocation
3.  after update successfully, delete file
create user:
1.  create user 'username'@'localhost' identified by 'password';
2.  grant all on *.* to 'username'@'localhost';

----------------------------------
web page from server
server data from database
----------------------------------

--------
1.
--------
show databases;
show tables;
show columns from table1;
desc table1;
show status;
show grants;
show errors;
show warnings;

--------
2.
--------
select column1 from table1;
select column1, columns from table1;
select * from table1;
select DISTINCT column1 from table1;
select column1 from table1 LIMIT 1;
select column1 from table1 LIMIT 3,4;
select column1 from table1 LIMIT 4 OFFSET 3;
select table1.column1 from table1;
select table1.column1 from database1.table1;
--------------------------------------------------------------------------------------------------------------------------------
select column1 from table1 order by column1;
select column1,column2 from table1 order by column1, column2; (first column1 ASC, if equal, order column2 ASC)
select column1, column2, column3 from table1 order by column2 DESC;
select column1, column2, column3 from table1 order by column2 DESC, column1;(first column2 DESC, if equal column1 ASC)
--------------------------------------------------------------------------------------------------------------------------------
select column1 from table1 where column1 = value1;
select column1 from table1 where column1 < value1;
select column1 from table1 where column1 <= value1;
select column1 from table1 where column1 > value1;
select column1 from table1 where column1 >= value1;
select column1 from table1 where column1 <> value1;
select column1 from table1 where column1 != value1;
select column1 from table1 where column1 BETWEEN value1 and value2;
select column1 from table1 where column1 IS NULL;
select column1, column2 from table1 where column1 = value1 and column2 < value2;
select column1, column2 from table1 where column1 = value1 or column2 < value2; 
select column1, column2,column3 from table1 where column3 = value3 or column1 = value1 and column2 < value2;(first and, second or)
select column1, column2 from table1 where column1 IN (value1, value2) order by column2;
select column1, column2 from table1 where column1 NOT IN (value1, value2) order by column2;
--------------------------------------------------------------------------------------------------------------------------------
select column1, column2 from table1 where column1 LIKE '%abc%';(% matches any number and any character)
select column1, column2 from table1 where column1 LIKE '1_t';(_ matches only one character)
--------------------------------------------------------------------------------------------------------------------------------
select column1 from table1 where column1 REGEXP '1000' order by column1; (match rows contain 1000)
diff    (LIKE match all) (REGEXP match sub)
select column1 from table1 where column1 LIKE '1000' order by column1; (match rows only 1000, excat match)
select column1, column2 from table1 where column1 REGEXP '1000 | 2000 | 3000' order by column1;
select column1, column2 from table1 where column2 REGEXP '[123] tom' order by column1;
select column1, column2 from table1 where column2 REGEXP '[1|2|3] tom' order by column1;
select column1, column2 from table1 where column2 REGEXP '[234]';
select column1, column2 from table1 where column2 REGEXP '[2-4]';
select column1, column2 from table1 where column1 REGEXP '.';
select column1, column2 from table1 where column1 REGEXP '\\.';
\\. \\- \\f \\n \\r \\t \\v \\\ \\[ \\] \\| 
[:alnum:]   [:alpha:]   [:blank:]   [:cntrl:]   [:digit:]
*       zero or more
+       one or more
?       zero or one
{n}     n
{n,}    n or more
{n,m}   n to m(m<=255)
^       start of text
$       end of text
[[:<:]] start of string
[[:>:]] end of string
--------------------------------------------------------------------------------------------------------------------------------
select concat(column1,'(',column2,')') from table1;
select concat(column1,'(',column2,')') as newtitle from table1;
select id, title, id+id as doubleid from books;
+   -   *   /
--------------------------------------------------------------------------------------------------------------------------------
select id, title, upper(title) as UPP from books;
Left()  return left string of total
Right()
Length()
Locate()
Lower()
Upper()
Ltrim()
Rtrim()
soundex()
substring()
Date()    get date only, not contain exact time









SELECT 
ORDER BY(default:ASC, DESC)
WHERE(=, !=, <, >, <>, <=, >=, BETWEEN)(AND, OR, IN, NOT)(LIKE %/_)























