INT             4-BYTE 
BIGINT          8-BYTE
REAL/FLOAT(24)  4-BYTE 
DOUBLE          8-BYTE
DECIMAL(M,N)    总共20位，小数10位
CHAR(N)         定长字符串，N个字符的字符串
VARCHAR(N)      变长字符串，0~N个字符的字符串
BOOLEAN         True/False
DATA            2018-06-22
TIME            12:20:59
DATETIME        2018-06-22 12:20:59


商用数据库： Oracle, SQL Server, DB2
开源数据库： MySQL, PostgreSQL
桌面数据库： Access,桌面应用程序
嵌入式数据库： Sqlite,手机应用和桌面程序


MySQL is a interface, it contains many data engines:
    InnoDB:
    MyISAM: 不支持事务
    
Windows: install MySQL Community Server
Linux: apt-get install mysql-server

in command line:
    mysql -u root -p
    input password

关系数据库的表和表之间需要建立一对多， 多对一， 一对一的关系
每一行数据为一条记录， 一条记录由多个字段组成
主键： 能够区分不同的记录，不适用任何业务相关的字段作为主键。BIGINT, NOT NULL, ID/GUID(16-BYTE)
联合主键： 两个或更多的字段都设置为主键。
外键： 连接两张表的字段
        ALTER TABLE students
        ADD CONSTRAINT fk_class_id
        FOREIGN KEY (class_id)
        REFERENCE classes(id);
    外键约束的名称fk_class_id可以任意
    FOREIGN KEY (class_id)指定了class_id作为外键
    REFERENCE classes(id)指定了这个外键将关联到classes表的id列
    删除外键：
    ALTER TABLE students
    DROP FOREIGN KEY fk_class_id

SELECT * FROM TABLE1
SELECT * FROM TABLE1 WHERE C1 > 1 AND C2 > 2 OR C3 > 3 NOT C4 = 4(PRIORITY NOT AND OR);
SELECT COLUMN1, COLUMN2, COLUMN3 FROM TABLE1 WHERE CONDITION1;
SELECT COLUMN1, COLUMN2, COLUMN3 FROM TABLE1 ORDER BY COLUMN2;
SELECT COLUMN1, COLUMN2, COLUMN3 FROM TABLE1 ORDER BY COLUMN2 DESC;
SELECT COLUMN1, COLUMN2, COLUMN3 FROM TABLE1 ORDER BY COLUMN2 DESC, COLUMN3;
SELECT COLUMN1, COLUMN2, COLUMN3 FROM TABLE1 WHERE CONDITION1 ORDER BY COLUMN2 DESC;
SELECT COLUMN1, COLUMN2, COLUMN3 FROM TABLE1 WHERE CONDITION1 ORDER BY COLUMN2 DESC LIMIT 3 OFFSET 0;
LIMIT 后面表示最多显示的记录数目
OFFSET 后面表示的起始项，如果超过最大数量并不会报错，而是得到一个空的结果集。
LIMIT 15 == LIMIT 15 OFFSET 0
LIMIT 15 OFFSET 30 == LIMIT 30, 15

聚合函数：
    SELECT COUNT(*) FROM TABLE1;
        COUNT(*)表示查询所有列的行数
    SELECT COUNT(*) num FROM TABLE1;
    SELECT COUNT(*) num FROM TABLE1 WHERE CONDITION1;
    SUM     计算某一列的合计值，该列必须为数值类型
    AVG     计算某一列的平均值，该列必须为数值类型
    MAX     计算某一列的最大值
    MIN     计算某一列的最小值
    如果where没有匹配到任何行，COUNT()会返回0，上述四个会返回NULL。
    SELECT AVG(score) average FROM TABLE1 WHERE CONDITION1;
    SELECT CEILING(COUNT(*)/3) FROM TABLE1;
    
分组：
    SELECT COUNT(*) FROM TABLE1 WHERE CONDITION1 GROUP BY COLUMN1;
        GROUP BY指定了按COLUMN1分组，执行SELECT时，会把COLUMN1相同的列先分组，再分别计算。
    SELECT COLUMN1, COUNT(*) num FROM TABLE1 WHERE CONDITION1 GROUP BY COLUMN1;
    SELECT COLUMN1, COLUMN2, COUNT(*) num FROM TABLE1 WHERE CONDITION1 GROUP BY COLUMN1, COLUMN2;
    
多表查询：
    SELECT * FROM TABLE1, TABLE2;
        得到的结果为行的乘积，列相加
            
























