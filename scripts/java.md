
## 安装

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

#### ubuntu下安装eclipse
http://blog.csdn.net/gavin_dinggengjia/article/details/7364375


## web.xml

[格式定义](http://blog.csdn.net/liaoxiaohua1981/article/details/6759206)：

    <context-param>  
        <param-name>contextConfigLocation</param-name>  
        <param-value>contextConfigLocationValue></param-value>  
    </context-param>  
    
作用：该元素用来声明应用范围(整个WEB项目)内的上下文初始化参数。
    param-name 设定上下文的参数名称。必须是唯一名称
    param-value 设定的参数名称的值
    
#### 初始化过程
.在启动Web项目时，容器(比如Tomcat)会读web.xml配置文件中的两个节点<listener>和<contex-param>。   
.接着容器会创建一个ServletContext(上下文),应用范围内即整个WEB项目都能使用这个上下文。  
.接着容器会将读取到<context-param>转化为键值对,并交给ServletContext。 
.容器创建<listener></listener>中的类实例,即创建监听（备注：listener定义的类可以是自定义的类但必须需要继承ServletContextListener）。   
.在监听的类中会有一个contextInitialized(ServletContextEvent event)初始化方法，在这个方法中可以通过event.getServletContext().getInitParameter("contextConfigLocation") 来得到context-param 设定的值。在这个类中还必须有一个contextDestroyed(ServletContextEvent event) 销毁方法.用于关闭应用前释放资源，比如说数据库连接的关闭。 
.得到这个context-param的值之后,你就可以做一些操作了.注意,这个时候你的WEB项目还没有完全启动完成.这个动作会比所有的Servlet都要早。 
    
> 由上面的初始化过程可知容器对于web.xml的加载过程是context-param >> listener  >> fileter  >> servlet

#### 如何使用

    页面中 
        ${initParam.contextConfigLocation}

    Servlet中    
        String paramValue=getServletContext().getInitParameter("contextConfigLocation")




## JVM 内部原理的相关特性

#### java 沙箱
组成Java沙箱的基本组件如下：
* 类加载体系结构
* class文件检验器
* 内置于Java虚拟机（及语言）的安全特性
* 安全管理器及Java API

详细说明见[这里](http://zhaohe162.blog.163.com/blog/static/3821679720119311111880/)。

#### class 文件校验器
通过四趟扫描，保证了class文件正确 
* 第一趟：class文件的结构检查
* 第二趟：类型数据的语义检查
* 第三趟：字节码验证
* 第四趟：符号引用的验证

详细说明见[这里](http://blog.csdn.net/u013361114/article/details/25034077)

#### Java 异常

Throwable 类是 Java 语言中所有错误或异常的超类。它有两个子类：Error和Exception。

Error：用于指示合理的应用程序不应该试图捕获的严重问题。

Exception：它指出了合理的应用程序想要捕获的条件。Exception又分为两类：一种是CheckedException，一种是UncheckedException。这两种Exception的区别主要是CheckedException需要用try...catch...显示的捕获，而UncheckedException不需要捕获。通常UncheckedException又叫做RuntimeException。
Runtime异常无须显式声明抛出，如果程序需要捕捉Runtime异常，也可以使用try...catch块来捕捉Runtime异常。

异常链的使用：保存异常信息，在抛出另外一个异常的同时不丢失原来的异常。
    
    public Throwable initCause(Throwable cause)

throw：是语句抛出异常。  
throws： 是方法可能抛出异常的声明。   
throws可以单独使用，但throw不能， throw要么和try-catch-finally语句配套使用，要么与throws配套使用。但throws可以单独使 用，然后再由处理异常的方法捕获。  

摘自[这里](http://www.cnblogs.com/focusj/archive/2011/12/26/2301524.html)



