

## apache 启动、停止

#### Redhat 系统
如果apache安装成为linux的服务的话，可以用以下命令操作：

        service httpd start 启动

        service httpd restart 重新启动

        service httpd stop 停止服务


#### Ubuntu 系统

启动apache服务  

        sudo /etc/init.d/apache2 start

重启apache服务  

        sudo /etc/init.d/apache2 restart

停止apache服务

        sudo /etc/init.d/apache2 stop
