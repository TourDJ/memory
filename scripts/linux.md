
## linux 基础知识

#### 向文件添加和追加内容

添加内容

    ivan@jiefang:~/test$ echo Hello > a.txt

追加内容

    ivan@jiefang:~/test$ echo World >> a.txt

> 其中，> 是覆盖，>> 是追加。

***

## deb 包安装方法  

#### 安装一个 Debian 软件包

    dpkg -i <package.deb>

#### 列出 <package.deb> 的内容

    dpkg -c <package.deb>

#### 从 <package.deb> 中提取包裹信息

    dpkg -I <package.deb>

#### 移除一个已安装的包裹

    dpkg -r <package>

#### 完全清除一个已安装的包裹。和 remove 不同的是，remove 只是删掉数据和可执行文件，purge 另外还删除所有的配制文件

    dpkg -P <package>

#### 列出 <package> 安装的所有文件清单。同时请看 dpkg -c 来检查一个 .deb 文件的内容

    dpkg -L <package>

#### 显示已安装包裹的信息。同时请看 apt-cache 显示 Debian 存档中的包裹信息，以及 dpkg -I 来显示从一个 .deb 文件中提取的包裹信息

    dpkg -s <package>

#### 重新配制一个已经安装的包裹，如果它使用的是 debconf (debconf 为包裹安装提供了一个统一的配制界面)

    dpkg-reconfigure <package>
 
 
apt-cache 是linux下的一个apt软件包管理工具，它可查询apt的二进制软件包缓存文件。
参见： http://zwkufo.blog.163.com/blog/static/258825120092245519896/

## linux 命令

#### nohup 命令

　　用途：不挂断地运行命令。  

　　语法：nohup Command [ Arg ... ] [　& ]       

　　描述：nohup 命令运行由 Command 参数和任何相关的 Arg 参数指定的命令，忽略所有挂断（SIGHUP）信号。在注销后使用 nohup 命令运行后台中的程序。要运行后台中的 nohup 命令，添加 & （ 表示"and"的符号）到命令的尾部。   


## linux 中变量的含义

$# 是传给脚本的参数个数
$0 是脚本本身的名字
$1 是传递给该shell脚本的第一个参数
$2 是传递给该shell脚本的第二个参数
$@ 是传给脚本的所有参数的列表
$* 是以一个单字符串显示所有向脚本传递的参数，与位置变量不同，参数可超过9个
$$ 是脚本运行的当前进程ID号
$? 是显示最后命令的退出状态，0表示没有错误，其他表示有错误
