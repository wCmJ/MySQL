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
Time()    
select da, mo from orders where date(order_date) between '2019-07-08' and '2019-09-11';
select da, mo from orders where Year(order_date) = 2018 and Month(order_date) = 9;
Abs()   absolute
Cos()
Exp()
Mod()
Pi()
--------------------------------------------------------------------------------------------------------------------------------
row lines number
sum of all lines
max,min,mid of lines
AVG()   COUNT()   MAX()   MIN()   SUM()
count(*) contains lines with NULL
AVG()/MAX()/MIN()/SUM() discards lines with NULL
select AVG(DISTINCT prod_price) AS avg_price from products where vend_id = 1003;
error: count(distinct)
--------------------------------------------------------------------------------------------------------------------------------
select vend_id, COUNT(*) as num_prods FROM products group by vend_id;
group by指示MySQL分组数据，然后对每个组而不是整个结果进行聚集。
可嵌套、若嵌套汇总最后规定的分组、group by子句每列都必须是检所列或有效表达式、除聚集计算语句外，select每列都必须在group by中、NULL值作为一个分组返回
WHERE子句、GROUP BY子句、ORDER BY子句
select vend_id, count(*) as num_prods from products group by vend_id with rollup;
WITH ROLLUP：可以得到每个分组以及每个分组汇总级别的值
WHERE过滤行，HAVING过滤分组
select cust_id, count(*) as orders from orders group by cust_id HAVING count(*) >= 2;
create table productnotes
(
  note_id int not null auto_increment,
  prod_id char(10) not null,
  note_date datetime not null,
  note_text text null,
  primary key(note_id),
  fulltext(note_text)
)ENGINE=MyISAM;
create table customers
(
  cust_id int not null auto_increment,
  cust_name char(50) not null,
  cust_address char(50) null,
  cust_city char(50) null,
  cust_state char(5) NULL,
  cust_zip char(10) null,
  cust_country char(50) null,
  cust_contact char(50) null,
  cust_email char(255) null,
  PRIMARY KEY (cust_id)
)ENGINE=InnoDB;
create table orderitems
(
  order_num int not null,
  order_item int not null,
  prod_id char(10) not null,
  quantity int not null,
  item_price decimal(8,2) not null,
  PRIMARY KEY(order_num, order_item)
)ENGINE=InnoDB;  

SELECT 
ORDER BY(default:ASC, DESC)
WHERE(=, !=, <, >, <>, <=, >=, BETWEEN)(AND, OR, IN, NOT)(LIKE %/_)



select s.s1, s.s2, c.c1, c.c2 from stu as s inner join cla as c on s.id = c.id;
1. select main table s
2. select secondary table c
3. set link condition with on ...
4. add other condition where/order bu




















