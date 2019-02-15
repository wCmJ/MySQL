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



























