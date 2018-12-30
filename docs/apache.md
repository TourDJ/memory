

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


## apache 配置文件
DocumentRoot：应该是定义这个服务器对外发布的超文本文档存放的路径，也就是说，客户程序请求的URL就被映射为这个目录下的网页文件，这个目录下的子目录，
以及符号连接指出的文件和目录都能被浏览器访问。

也可以这么说，如果DocumentRoot=/usr/local/apache2/htdocs 那么，在htdocs下的所有文件、目录等都可以被浏览器访问，DocumentRoot提供了浏览器
与服务器互交的一个通道，通过DocumentRoot我们可以看到服务器中所想在网页上表现的所有东东。

当然，DocumentRoot下的所有东西并不是都希望被浏览器访问，像符号连接指出的文件就可以通过目录访问控制中提供的followsymlinks选项来打开或关闭支持与
否的特性。还可以利用 order  allow,deny 命令来控制访问服务器的一个固定区域及控制禁止访问服务器的主机。
