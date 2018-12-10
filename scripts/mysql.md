
## MySQL 服务器

如果你指定 localhost 作为一个主机名【也就是你在本机上连接本机的mysql服务】， mysqladmin 默认使用Unix套接字文件连接，而不是TCP/IP。
从MySQL 4.1 开始，通过--protocol= {TCP |SOCKET | PIPE | MEMORY} 选项，你可以显示地指定连接协议，举例如下：

socket 连接：

    [zzz@zzz mysql]$ mysql -uroot
    ERROR 2002 (HY000): Can't connect to local MySQL server through socket
    '/home/zzx/mysql/mysql.sock' (2)

tcp 连接：

    [zzz@zzz mysql]$ mysql --protocol=TCP -uroot -p -P3307 -hlocalhost

***

## MySQL 安装
CentOS 7  
参考： [How To Install MySQL on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-7)

*** 

## MySQL 函数   
### 日期函数
#### date_add() 为日期增加一个时间间隔

    set @dt = now();
    select date_add(@dt, interval 1 day); -- add 1 day
    select date_add(@dt, interval 1 hour); -- add 1 hour
    select date_add(@dt, interval 1 minute); -- ...
    select date_add(@dt, interval 1 second);
    select date_add(@dt, interval 1 microsecond);
    select date_add(@dt, interval 1 week);
    select date_add(@dt, interval 1 month);
    select date_add(@dt, interval 1 quarter);
    select date_add(@dt, interval 1 year);
    select date_add(@dt, interval -1 day); -- sub 1 day


## MySQL 变量
##### FOREIGN_KEY_CHECKS    
MySQL还原数据库，禁用和启用外键约束的方法(FOREIGN_KEY_CHECKS) 
禁用

    SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0
 
启用

    SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS
> 有时还原数据库时，因为表有约束导致40014错误，可以通过关闭外键约束，还原成功时再启用。

#### DELIMITER
告诉mysql解释器，该段命令是否已经结束了，mysql是否可以执行了。默认情况下，delimiter是分号;。

## MySQL 命令
查看是否还有其他进程在使用

    mysql -uroot -proot -h127.0.0.1 -P3306 -e 'show processlist;'

备份数据

    mysqldump -uroot -proot express_user > ~/expressuser.sql

查看mysql是否运行

    ps aux | grep mysql
    
查看创建表语句

    show create table seckill\G
    
升级数据库版本

    mysql_upgrade -u root -p  
> mysql_upgrade examines all tables in all databases for incompatibilities with the current version of MySQL Server. mysql_upgrade also upgrades the system tables so that you can take advantage of new privileges or capabilities that might have been added.  
  

mysql 新设置用户或更改密码后需用flush privileges刷新MySQL的系统权限相关表，否则会出现拒绝访问，还有一种方法，就是重新启动mysql服务器，来使新设置生效。

    flush privileges

Grant 命令

    grant 权限 on 数据库对象 to 用户

查看字符集   

    show variables like 'character_set_%';    
    show variables like 'collation_%';
    
>   mysql 插入数据乱码解决方法：         
>       alter database jiefang character set utf8;    
>       set names 'utf8';    
>       set character_set_server=utf8;     
>   设置好后重新创建表

mysql 初始化       
以管理员身份打开命令行窗口, 运行:

	mysqld --initialize-insecure 
> 1.不设置root密码
  2.不能手动建data文件夹

删除 mysql 服务 

	sc delete mysql


修改密码

	ALTER USER 'root'@'localhost' IDENTIFIED BY '********'



 
*** 

参考资料：   
[MySQL的Grant命令](http://www.cnblogs.com/hcbin/archive/2010/04/23/1718379.html)   
[mysql 权限](http://blog.csdn.net/liang_0609/article/details/52473689)
