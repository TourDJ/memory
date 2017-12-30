
## JDK 安装配置

#### Deiban(Ubuntu) 下安装配置 JDK(OpenJDK)

1 下载安装jdk	

	$sudo apt-get install openjdk-8-jdk
2 查看当前系统中的JVM

	$sudo update-alternatives --display java
3、安装JVM路径	

	$sudo update-alternatives --install /usr/bin/java java /usr/local/jdk1.8.0_152/bin/java 1400
> 命令： update-alternatives --install link name path priority <br>
	link 为系统中功能相同软件的公共链接目录，比如/usr/bin/java(需绝对目录)	 <br>	
	name 为命令链接符名称,如java  <br>	 	
	path 为你所要使用新命令、新软件的所在目录  <br>		 
	priority 为优先级，当命令链接已存在时，需高于当前值，因为当alternative为自动模式时,系统默认启用priority高的链接;整数根据版本号设置的优先级（更改的优先级需要大于当前的）  <br>

4、更换系统 JVM

	$sudo update-alternatives --config java
5、配置环境变量
在文件 /etc/profile 中添加以下几行： 

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

#### linux 下安装 eclipse
1, 下载 eclipse http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/2/eclipse-jee-oxygen-2-linux-gtk-x86_64.tar.gz

2, 解压

	$ tar -zxvf eclipse-SDK-3.7.2-linux-gtk.tar.gz
3、将文件夹移动到安装目录

	$ sudo mv eclipse /usr/local/
4、创建桌面链接
$ sudo vim /usr/share/applications/eclipse.desktop

	[Desktop Entry]
	Encoding=UTF-8
	Name=Eclipse
	Comment=Eclipse IDE
	Exec=eclipse
	Icon=/usr/local/eclipse/icon.xpm
	Terminal=false
	Type=Application
	Categories=GNOME;Application;Development;
	StartupNotify=true


#### dt.jar、tools.jar [作用](http://www.cnblogs.com/jtlgb/p/6039809.html)
* tools.jar：工具类库，它跟我们程序中用到的基础类库没有关系。我们注意到在Path中变量值bin目录下的各个exe工具的大小都很小，一般都在27KB左右，这是因为它们实际上仅仅相当于是一层代码的包装，这些工具的实现所要用到的类库都在tools.jar中，用压缩软件打开tools.jar,你会发现有很多文件是和bin目录下的exe工具相对性的。编译和运行需要的都是toos.jar里面的类分别是   

	sun.tools.java.*;	   
	sun.tools.javac.*;	

* dt.jar：运行环境类库，主要是Swing包。

* rt.jar 是JAVA基础类库，默认就在Root Classloader的加载路径里面的，而在Claspath配置该变量是不需要的；同时jre/lib目录下的其他 jar:jce.jar、jsse.jar、charsets.jar、resources.jar 都在Root Classloader中。

JDK目录结构和文件作用[介绍](http://www.cnblogs.com/sunxucool/p/3489314.html)

***

## web.xml

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
<url-pattern> 元素指定对应于 Servlet 的URL路径，该路径是相对于Web应用程序上下文根的路径。
> Servlet 2.5规范允许<servlet-mapping>的<url-pattern>子元素出现多次，之前的规范只允许一个<servlet-mapping>元素包含一个<url-pattern>子元素。

	<servlet-mapping>
		<servlet-name>welcome</servlet-name>
		<url-pattern>/en/welcome</url-pattern>
		<url-pattern>/zh/welcome</url-pattern>
	</servlet-mapping>

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

## class 字节码文件
class [字节码](http://www.cnblogs.com/ivantang/p/6236711.html)文件是一组以8位字节为基础单位的二进制流，各个数据项目严格按照顺序紧凑地排列在Class文件之中，中间没有添加任何分隔符，这使得整个Class文件中存储的内容几乎全部都是程序运行的必要数据，没有空隙存在。当遇到需要占用8位字节以上的空间的数据项时，则会按照高位在前的方式分割成若干个8位字节进行存储。

## JVM 内部原理的相关特性
JVM([Java虚拟机](http://www.cnblogs.com/ivantang/p/5530787.html))一种用于计算设备的规范，可用不同的方式（软件或硬件）加以实现。编译虚拟机的指令集与编译微处理器的指令集非常类似。Java虚拟机包括一套字节码指令集、一组寄存器、一个栈、一个垃圾回收堆和一个存储方法域。Java虚拟机(JVM)是可运行Java代码的假想计算机。只要根据[JVM规格](http://www.cnblogs.com/ivantang/p/5531580.html)描述将解释器移植到特定的计算机上，就能保证经过编译的任何Java代码能够在该系统上运行。Java虚拟机是一个想象中的机器,在实际的计算机上通过软件模拟来实现。Java虚拟机有自己想象中的硬件,如处理器、[堆栈](http://www.cnblogs.com/ivantang/p/5531501.html)、寄存器等,还具有相应的指令系统。

为什么要分代?
[分代](http://www.cnblogs.com/ivantang/p/5530889.html)的垃圾回收策略，是基于这样一个事实：不同的对象的生命周期是不一样的。因此，不同生命周期的对象可以采取不同的收集方式，以便提高回收效率。

[JVM内存模型](http://www.cnblogs.com/ivantang/p/5530945.html)是Java的核心技术之一，现在很多编程语言都引入了类似Java JVM的[内存](http://www.cnblogs.com/ivantang/p/5531534.html)模型和垃圾收集器的[机制](http://www.cnblogs.com/ivantang/p/5531496.html)。

#### HotSpot
Java [HotSpot](http://www.cnblogs.com/ivantang/p/5531587.html) 虚拟机是Sun公司的Java平台一个高效的[虚拟机实现](http://www.cnblogs.com/ivantang/p/5531592.html)。Java HotSpot技术提供Java标准平台的基础设施，提供对快速开发、部署关键业务的桌面和企业应用程序的解决方案。Java SE可应用在Solaris操作环境、Linux和Windows下，也可以应用在其它通过Java技术认证的平台下。

#### 执行引擎
java 虚拟机字节码[执行引擎](http://www.cnblogs.com/sheeva/p/6347577.html)是jvm最核心的组成部分之一，它做的事情很简单：输入的是字节码文件，处理过程是字节码解析的等效过程，输出的是执行结果。

在jvm的内存结构里，存在这一块称为虚拟机栈的内存区域，虚拟机栈中的元素就是栈帧。每个栈帧主要包含4个部分：

局部变量表
操作数栈
动态连接
方法返回地址

#### java 沙箱
Java安全模型的核心就是[Java沙箱](https://yq.aliyun.com/articles/8620)（sandbox），什么是沙箱？沙箱是一个限制程序运行的环境。限制程序运行一方面是为了保护系统资源，同时另一方面也为了保护程序自己。沙箱主要限制系统资源访问，那系统资源包括什么？——CPU、内存、文件系统、网络。不同级别的沙箱对这些资源访问的限制也可以不一样。

组成Java沙箱的基本组件如下：
* 类加载体系结构
* class文件检验器
* 内置于Java虚拟机（及语言）的安全特性
* 安全管理器及Java API

#### java 类加载器
[类加载器](https://www.ibm.com/developerworks/cn/java/j-lo-classloader/index.html)（class loader）用来加载 Java 类到 Java 虚拟机中。
系统提供的类加载器主要有下面三个：
* 引导类加载器（bootstrap class loader）：它用来加载 Java 的核心库，是用原生代码来实现的，并不继承自 java.lang.ClassLoader。
* 扩展类加载器（extensions class loader）：它用来加载 Java 的扩展库。Java 虚拟机的实现会提供一个扩展库目录。该类加载器在此目录里面查找并加载 Java 类。
* 系统类加载器（system class loader）：它根据 Java 应用的类路径（CLASSPATH）来加载 Java 类。一般来说，Java 应用的类都是由它来完成加载的。可以通过 ClassLoader.getSystemClassLoader()来获取它。

#### class 文件校验器
class [文件校验器](http://blog.csdn.net/u013361114/article/details/25034077)就是为了保证class文件有正确的结构，能够正确运行。通过四趟扫描，保证了class文件正确 
* 第一趟：class文件的结构检查
* 第二趟：类型数据的语义检查
* 第三趟：字节码验证
* 第四趟：符号引用的验证

#### java 安全管理器
[安全管理器](https://yq.aliyun.com/articles/57223)(SecurityManager)在Java语言中的作用就是检查操作是否有权限执行。是Java沙箱的基础组件。

#### 策略和保护域
[策略](http://www.importnew.com/17093.html)是一组权限的总称，用于确定权限应该用于哪些代码源。保护域可以理解为代码源和相应权限的一个组合。

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

***

## Filter
[Filter 简介](http://www.open-open.com/lib/view/open1350703788524.html)   
Servlet API中提供了一个Filter接口，开发web应用时，如果编写的Java类实现了这个接口，则把这个java类称之为过滤器Filter。通过Filter技术，开发人员可以实现用户在访问某个目标资源之前，对访问的请求和响应进行拦截。简单说，就是可以实现web容器对某资源的访问前截获进行相关的处理，还可以在某资源向web容器返回响应前进行截获进行处理。

例如：

	<filter>
		<filter-name>logfilter</filter-name>
		<filter-class>com.tang.filter.LogFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>logfilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>

> [提示](http://www.cnblogs.com/therunningfish/p/6639192.html) FilterChain接口的doFilter方法用于通知Web容器把请求交给Filter链中的下一个Filter去处理，如果当前调用此方法的Filter对象是Filter链中的最后一个Filter，那么将把请求交给目标Servlet程序去处理。

Filter [分类](http://www.cnblogs.com/hh6plus/p/5548049.html)：一共分为四种过滤器：REQUEST, FORWARD, INCLUDE, ERROR，在web.xml的<filter-mapping>域中<dispatcher>进行配置。默认是REQUEST，可复选。



## Listener
[Listener](http://blog.csdn.net/u012228718/article/details/41730799) 是 Servlet 的监听器，它可以监听客户端的请求、服务端的操作等。
Listener 主要用于对 Session、Request、Context 进行监控。	

在Servlet 2.4和JSP 2.0 规范中一共有八个 listener 接口和六个 [event](http://www.blogjava.net/i369/articles/236313.html) 事件类。当一个事件发生的时候我们可以使用listener中的某个方法去对事件做出相应的响应，这些方法的参数都是java.util.EventObject的子类。	
	
8种监听器可以分为三类：
1）监听 Session、request、context 的创建于销毁，分别为  

	HttpSessionLister、ServletContextListener、ServletRequestListener
2）监听对象属性变化，分别为：

	HttpSessionAttributeLister、ServletContextAttributeListener、ServletRequestAttributeListener 
3）监听Session 内的对象，分别为

	HttpSessionBindingListener 和 HttpSessionActivationListener。
与上面六类不同，这两类 Listener 监听的是 Session 内的对象，而非 Session 本身，不需要在 web.xml中配置。


## Interceptor
[Interceptor](http://blog.csdn.net/ggibenben1314/article/details/45341855)是在面向切面编程的时候，在你的service的一个方法前调用一个方法，或者在方法后调用一个方法。两者的本质区别：拦截器是基于java的反射机制的，而过滤器是基于函数回调。
> Interceptor 是框架自己造的概念，Filter是servlet规范里的。

***

## Java 语言特性





