
## mysql 变量
##### FOREIGN_KEY_CHECKS    
MySQL还原数据库，禁用和启用外键约束的方法(FOREIGN_KEY_CHECKS) 
禁用

    SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0
 
启用

    SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS
> 有时还原数据库时，因为表有约束导致40014错误，可以通过关闭外键约束，还原成功时再启用。

#### mysql 命令
查看是否还有其他进程在使用

    mysql -uroot -proot -h127.0.0.1 -P3306 -e 'show processlist;'

备份数据

    mysqldump -uroot -proot express_user > ~/expressuser.sql

查看mysql是否运行

    ps aux | grep mysql
