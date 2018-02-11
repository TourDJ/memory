
Redis是REmote DIctionary Server的缩写。Redis是一种高级key-value数据库。它跟memcached类似，不过数据可以持久化，而且支持的数据类型很丰富。
有字符串，链表，集合和有序集合。支持在服务器端计算集合的并，交和补集(difference)等，还支持多种排序功能。所以Redis也可以被看成是一个数据结构服
务器。 

> Redis的所有数据都是保存在内存中，然后不定期的通过异步方式保存到磁盘上(这称为“半持久化模式”)；也可以把每一次数据变化都写入到一个append only 
file(aof)里面(这称为“全持久化模式”)。

## 安装

  wget http://download.redis.io/releases/redis-2.8.9.tar.gz
  tar zxvf redis-2.8.9.tar.gz
  cd redis-2.8.9
  #直接make 编译
  make
  #可使用root用户执行`make install`，将可执行文件拷贝到/usr/local/bin目录下。这样就可以直接敲名字运行程序了。
  make install

> make install命令执行完成后，会在/usr/local/bin目录下生成本个可执行文件，分别是redis-server、redis-cli、redis-benchmark、
  redis-check-aof 、redis-check-dump，它们的作用如下：

    * redis-server：Redis服务器的daemon启动程序
    * redis-cli：Redis命令行操作工具。也可以用telnet根据其纯文本协议来操作
    * redis-benchmark：Redis性能测试工具，测试Redis在当前系统下的读写性能
    * redis-check-aof：数据修复
    * redis-check-dump：检查导出工具

> 为什么没用标准的Linux安装三板斧呢？官方维基是这样说的：
  Redis can run just fine without a configuration file (when executed without a config file a standard configuration is used). 
  With thedefault configuration Redis will log to the standard output so you can check what happens. Later, you canchange the 
  default settings.
