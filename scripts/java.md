
#### Ubuntu下安装配置OpenJDK
http://blog.csdn.net/gavin_dinggengjia/article/details/7363863

1、下载安装jdk
$sudo apt-get install openjdk-6-jdk
2、查看当前系统中的JVM
$sudo update-alternatives --display java
3、安装JVM路径
$sudo update-alternative s --install /usr/bin/java java /usr/lib/jvm/java-1.6.0-jdk/bin/java 60
4、更换系统 JVM
$sudo update-alternatives –config java
5、配置环境变量
$vim /etc/profile
添加以下几行： 

    export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk
    export JRE_HOME=$JAVA_HOME/jre  
    export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH  
    export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$JAVA_HOME:$PATH 
    
$source /etc/profile 使配置立刻生效

6、验证配置完成
$echo $JAVA_HOME
$java -version

#### linux 安装 jdk
1, 将源码文件 jdk-8u152-linux-x64.tar.gz 解压到 /usr/local 下
2, 配置环境变量
  在/etc/profile文件中，配置环境变量，编辑文件，在最后添加：

    export JAVA_HOME=/usr/java/jdk1.8.0_65 
    export JRE_HOME=$JAVA_HOME/jre 
    export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib 
    export PATH=$JAVA_HOME/bin:$PATH

  保存退出后，执行source /etc/profile是修改的环境变量生效。
  注： Debian 默认安装 OPENJDK，路径：
    
    lrwxrwxrwx 1 root root 22 11月  2 22:17 /usr/bin/java -> /etc/alternatives/java

#### buntu下安装eclipse
http://blog.csdn.net/gavin_dinggengjia/article/details/7364375
