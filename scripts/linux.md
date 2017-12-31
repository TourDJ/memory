

1. 读取 MBR 的信息,启动 Boot Manager
        Windows 使用 NTLDR 作为 Boot Manager,如果您的系统中安装多个
        版本的 Windows,您就需要在 NTLDR 中选择您要进入的系统。
        Linux 通常使用功能强大,配置灵活的 GRUB 作为 Boot Manager。
2. 加载系统内核,启动 init 进程
        init 进程是 Linux 的根进程,所有的系统进程都是它的子进程。
3. init 进程读取 /etc/inittab 文件中的信息,并进入预设的运行级别,
   按顺序运行该运行级别对应文件夹下的脚本。脚本通常以 start 参数启
   动,并指向一个系统中的程序。
        通常情况下, /etc/rcS.d/ 目录下的启动脚本首先被执行,然后是
        /etc/rcN.d/ 目录。例如您设定的运行级别为 3,那么它对应的启动
        目录为 /etc/rc3.d/ 。
4. 根据 /etc/rcS.d/ 文件夹中对应的脚本启动 Xwindow 服务器 xorg
        Xwindow 为 Linux 下的图形用户界面系统。
5. 启动登录管理器,等待用户登录
        Ubuntu 系统默认使用 GDM 作为登录管理器,您在登录管理器界面中
        输入用户名和密码后,便可以登录系统。(您可以在 /etc/rc3.d/
        文件夹中找到一个名为 S13gdm 的链接)

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

#### ldconfig
http://blog.csdn.net/Destina/article/details/6208319


## linux 中变量的含义

* $# 是传给脚本的参数个数
* $0 是脚本本身的名字
* $1 是传递给该shell脚本的第一个参数
* $2 是传递给该shell脚本的第二个参数
* $@ 是传给脚本的所有参数的列表
* $* 是以一个单字符串显示所有向脚本传递的参数，与位置变量不同，参数可超过9个
* $$ 是脚本运行的当前进程ID号
* $? 是显示最后命令的退出状态，0表示没有错误，其他表示有错误

## Debian 系命令
        
debian 的 runlevel级别定义如下：

    0 – Halt，关机模式
    1 – Single，单用户模式
    2 - Full multi-user with display manager (GUI)
    3 - Full multi-user with display manager (GUI)
    4 - Full multi-user with display manager (GUI)
    5 - Full multi-user with display manager (GUI)
    6 – Reboot，重启
可以发现2~5级是没有任何区别的。他们为多用户模式，这和一般的linux不一样。

sysv-rc-conf 是一个服务管理程序。

update-rc.d 类似与 RHEL 中的 chkconfig。

invoke-rc.d 类似与 RHEL 中的 service。

## 参考
[debian下服务控制命令](http://www.cnblogs.com/Joans/articles/4939002.html)
