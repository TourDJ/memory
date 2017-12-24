
## JDK 安装配置

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

***

## web.xml

[格式定义](http://blog.csdn.net/liaoxiaohua1981/article/details/6759206)：

#### 初始化过程
* 在启动Web项目时，容器(比如Tomcat)会读web.xml配置文件中的两个节点 listener 和 contex-param。   
* 接着容器会创建一个 ServletContext(上下文),应用范围内即整个WEB项目都能使用这个上下文。  
* 接着容器会将读取到&lt;context-param&gt; 转化为键值对,并交给 ServletContext。 
* 容器创建 listener 中的类实例,即创建监听（备注：listener定义的类可以是自定义的类但必须需要继承 ServletContextListener）。   
* 在监听的类中会有一个contextInitialized(ServletContextEvent event)初始化方法，在这个方法中可以通过

    event.getServletContext().getInitParameter("contextConfigLocation") 
  来得到context-param 设定的值。在这个类中还必须有一个contextDestroyed(ServletContextEvent event) 销毁方法.用于关闭应用前释放资源，比如说数据库连接的关闭。 
* 得到这个context-param的值之后,你就可以做一些操作了.注意,这个时候你的WEB项目还没有完全启动完成.这个动作会比所有的Servlet都要早。 
    
> 由上面的初始化过程可知容器对于web.xml的加载过程是 context-param -> listener  -> filter  -> servlet 。

#### 如何使用
页面中
     
        ${initParam.contextConfigLocation}
Servlet中
        
        String paramValue=getServletContext().getInitParameter("contextConfigLocation")
        
#### context-param

    <context-param>  
        <param-name>contextConfigLocation</param-name>  
        <param-value>contextConfigLocationValue></param-value>  
    </context-param>  
    
作用：该元素用来声明应用范围(整个WEB项目)内的上下文初始化参数。
    param-name 设定上下文的参数名称。必须是唯一名称
    param-value 设定的参数名称的值


#### url-pattern
> Servlet 2.5规范允许<servlet-mapping>的<url-pattern>子元素出现多次，之前的规范只允许一个<servlet-mapping>元素包含一个<url-pattern>子元素。详细看[这里](http://blog.csdn.net/woshizoe/article/details/7696367)

##### Servlet 的 url 映射    
当Servlet容器接收到一个请求，它首先确定该请求应该由哪一个Web应用程序来响应。这是通过比较请求URI的开始部分与Web应用程序的上下文路径来确定的。映射到Servlet的路径是请求URI减去上下文的路径，Web应用程序的Context对象在去掉请求URI的上下文路径后，将按照下面的路径映射规则的顺序对剩余部分的路径进行处理，并且在找到第一个成功的匹配后，不再进行下一个匹配。

* 容器试着对请求的路径和Servlet映射的路径进行精确匹配，如果匹配成功，则调用这个Servlet来处理请求。
* 容器试着匹配最长的路径前缀，以斜杠（/）为路径分隔符，按照路径树逐级递减匹配，选择最长匹配的Servlet来处理请求。
* 如果请求的URL路径最后有扩展名，如.jsp，Servlet容器会试着匹配处理这个扩展名的Servlet。
* 如果按照前面3条规则没有找到匹配的Servlet，容器会调用Web应用程序默认的Servlet来对请求进行处理，如果没有定义默认的Servlet，容器将向客户端发送HTTP 404错误信息（请求资源不存在）。

##### 使用下面的语法来定义映射: 

* 以/开始并且以 /* 结束的字符串用来映射路径       
* 以*.为前缀的字符串用来映射扩展名         
* 以一个单独的/指示这个Web应用程序默认的Servlet    
* 所有其他的字符被用于精确匹配   

> [问题](http://blog.sina.com.cn/s/blog_7d0b04e70101mclr.html)： 为什么定义”/*.action”这样一个看起来很正常的匹配会错？  
  因为这个匹配即属于路径映射，也属于扩展映射，导致容器无法判断。
***

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

***

## Java 多线程
#### ThreadLocal
ThreadLocal类用来提供线程内部的局部变量。这种变量在多线程环境下访问(通过get或set方法访问)时能保证各个线程里的变量相对独立于其他线程内的变量。ThreadLocal实例通常来说都是private static类型的，用于关联线程和线程的上下文。

ThreadLocal的作用是提供线程内的局部变量，这种变量在线程的生命周期内起作用，减少同一个线程内多个函数或者组件之间一些公共变量的传递的复杂度。

***

## Java 异常

#### Exception

Throwable 类是 Java 语言中所有错误或异常的超类。它有两个子类：Error和Exception。

* Error：用于指示合理的应用程序不应该试图捕获的严重问题。

* Exception：它指出了合理的应用程序想要捕获的条件。Exception又分为两类：一种是CheckedException，一种是UncheckedException。这两种Exception的区别主要是CheckedException需要用try...catch...显示的捕获，而UncheckedException不需要捕获。通常UncheckedException又叫做RuntimeException。
Runtime异常无须显式声明抛出，如果程序需要捕捉Runtime异常，也可以使用try...catch块来捕捉Runtime异常。

> 异常链的使用：保存异常信息，在抛出另外一个异常的同时不丢失原来的异常。
    
    public Throwable initCause(Throwable cause)

#### throw 与 throws

* throw：是语句抛出异常。    
* throws： 是方法可能抛出异常的声明。

> throws可以单独使用，但throw不能， throw要么和try-catch-finally语句配套使用，要么与throws配套使用。但throws可以单独使 用，然后再由处理异常的方法捕获。  

摘自[这里](http://www.cnblogs.com/focusj/archive/2011/12/26/2301524.html)

***

## Servlet
[servlet](http://www.cnblogs.com/doit8791/p/4209442.html)是一种运行服务器端的java应用程序，具有独立于平台和协议的特性，并且可以动态的生成web页面，它工作在客户端请求与服务器响应的中间层。

#### ServletConfig
代表当前 Servlet 在web.xml中的配置信息。    
例如：

        <servlet>
            <servlet-name>UploadServlet</servlet-name>
            <servlet-class>com.tang.Servlet</servlet-class>
            <init-param>
                <param-name>name</param-name>
                <param-value>value</param-value>
            </init-param>
            <init-param>
                <param-name>encode</param-name>
                <param-value>utf-8</param-value>
            </init-param>
        </servlet>

> 在Servlet的配置文件中，可以使用一个或多个<init-param>标签为servlet配置一些初始化参数。  
  当servlet配置了初始化参数后，web容器在创建servlet实例对象时，会自动将这些初始化参数封装到ServletConfig对象中，并在调用servlet的init方法时，将ServletConfig对象传递给servlet。进而，程序员通过ServletConfig对象就可以得到当前servlet的初始化参数信息。

#### ServletContext
[ServletContext](http://www.cnblogs.com/smyhvae/p/4140877.html)代表当前web应用。WEB容器在启动时，它会为每个WEB应用程序都创建一个对应的ServletContext对象。ServletConfig对象中维护了ServletContext对象的引用。

1.做为域对象可以在整个web应用范围内共享数据。

* 域对象：在一个可以被看见的范围内共享数据用到对象
* 作用范围：整个web应用范围内共享数据
* 生命周期：当服务器启动web应用加载后创建出ServletContext对象后，域产生。当web应用被移除出容器或服务器关闭，随着web应用的销毁域销毁。

2、获取WEB应用的初始化参数

通过<init-param>标签为某一个单独的servlet加配置信息，这种配置信息在其他的Servlet中是无法访问到的。可如果我们使用<context-param>标签（与Servlet标签并列）为整个Web应用配置属性的话，那所有的Servlet就都能访问里面的参数了。例如：可以把数据库的配置信息放在这里。

* 请求参数 parameter --- 浏览器发送过来的请求中的参数信息
* 初始化参数 initparameter --- 在web.xml中为Servlet或ServletContext配置的初始化时带有的基本参数
* 域属性 attribute --- 四大作用域中存取的键值对



