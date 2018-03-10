

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

