

## Debian 源码安装 PostgreSQL

下载源码包并解压

      wget https://www.postgresql.org/ftp/source/v9.6.4/
      tar zxvf postgresql-9.6.4.tar.gz
      cd postgresql-9.6.4

编译安装

      ./configure --prefix=/usr/local/pgsql
      make
      make install

> 编译如果出现以下错误：   
  configure: error: readline library not found   
> 解决方法：     
  You probably need to install libreadline-dev.
  A quick way to search for packages in cases like this is to use a command like:    
    apt-cache search libreadline    
    sudo apt-get install libreadline-dev

创建用户与组：

      groupadd postgres
      useradd -d /home/postgres -s /bin/bash -g postgres -m postgres
      cd /usr/local/pgsql/
      mkdir data
      chown postgres:postgres data/
 

配置环境变量：

      su - postgres
      vi .profile (增加 export PG_DATA=/usr/local/pgsql/data)
      source ./.bash_profile 

初始化数据库：

      initdb -E UNICODE -D /usr/local/pgsql/data
      cd /usr/local/pgsql/data
      touch pgsql.log

修改监听地址与端口参数：

      vi postgresql.conf 
      listen_addresses = '*'         # what IP address(es) to listen on;
                                              # comma-separated list of addresses;
                                              # defaults to 'localhost', '*' = all
                                              # (change requires restart)
      port = 5432                            # (change requires restart)

启动数据库服务器

      pg_ctl -D /usr/local/pgsql/data/ -l pgsql.log start




