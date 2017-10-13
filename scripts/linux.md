

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
   

## linux 命令

#### nohup 命令

　　用途：不挂断地运行命令。  

　　语法：nohup Command [ Arg ... ] [　& ]       

　　描述：nohup 命令运行由 Command 参数和任何相关的 Arg 参数指定的命令，忽略所有挂断（SIGHUP）信号。在注销后使用 nohup 命令运行后台中的程序。要运行后台中的 nohup 命令，添加 & （ 表示"and"的符号）到命令的尾部。   
