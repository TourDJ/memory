
> [Spring document](https://docs.spring.io/spring/docs/4.3.13.RELEASE/spring-framework-reference/htmlsingle/)

## Spring 注解

#### [@Configuration](https://www.tuicool.com/articles/M3MVr2)

明确指出该类是 Bean 配置的信息源。Spring 对标注 Configuration 的类有如下要求：  
* 配置类不能是 final 的；
* 配置类不能是本地化的，亦即不能将配置类定义在其他类的方法内部；
* 配置类必须有一个无参构造函数。


#### @RequestParam  
@RequestParam用于将请求参数区数据映射到功能处理方法的参数上。
例如： 请求中包含username参数（如/requestparam1?userName=zhang），则自动传入。 

      public String login(@RequestParam(value="username", required=true, defaultValue="zhang") String username)

多个参数传递，例如：url?userName=zhangsan&userName=wangwu, 多个数据之间使用“，”分割；参数入参的数据为“zhangsan,wangwu”, 使用如下方式来接收多个请求参数：

      public String login(@RequestParam(value="userName") String []  userNames)     

#### @PathVariable
当使用@RequestMapping URI template 样式映射时， 即 someUrl/{paramId}, 这时的paramId可通过 @Pathvariable注解绑定它传过来的值到方法的参数上。

      @RequestMapping("/blogs/{id}")  
      public void findBlog(@PathVariable String id, Model model) {      
        // implementation omitted  
      } 
上面代码把URI template 中变量 id 的值绑定到方法的参数上。若方法参数名称和需要绑定的uri template中变量名称不一致，需要在@PathVariable("name")指定uri template中的名称。

#### @Re
questBody

作用： 
* 该注解用于读取Request请求的body部分数据，使用系统默认配置的HttpMessageConverter进行解析，然后把相应的数据绑定到要返回的对象上；
* 再把HttpMessageConverter返回的对象数据绑定到 controller中方法的参数上。

使用时机：

A) GET、POST方式提交时， 根据request header Content-Type的值来判断:

    application/x-www-form-urlencoded， 可选（即非必须，因为这种情况的数据@RequestParam, @ModelAttribute也可以处理，当然@RequestBody也能处理）；
    multipart/form-data, 不能处理（即使用@RequestBody不能处理这种格式的数据）；
    其他格式， 必须（其他格式包括application/json, application/xml等。这些格式的数据，必须使用@RequestBody来处理）；
B) PUT方式提交时， 根据request header Content-Type的值来判断:

    application/x-www-form-urlencoded， 必须；
    multipart/form-data, 不能处理；
    其他格式， 必须；
> 说明：request的body部分的数据编码格式由header部分的Content-Type指定；

#### @ResponseBody

作用： 
该注解用于将Controller的方法返回的对象，通过适当的HttpMessageConverter转换为指定格式后，写入到Response对象的body数据区。

使用时机：
返回的数据不是html标签的页面，而是其他某种格式的数据时（如json、xml等）使用

#### [@SessionAttributes](http://www.cnblogs.com/daxin/p/SessionAttributes.html)
SessionAttributes 注解应用到 Controller上面，可以将Model中的属性同步到session当中。
在默认情况下，ModelMap 中的属性作用域是 request 级别是，也就是说，当本次请求结束后，ModelMap 中的属性将销毁。如果希望在多个请求中共享 ModelMap 中的属性，必须将其属性转存到 session 中，这样 ModelMap 的属性才可以被跨请求访问。Spring 允许我们有选择地指定 ModelMap 中的哪些属性需要转存到 session 中，以便下一个请求属对应的 ModelMap 的属性列表中还能访问到这些属性。这一功能是通过类定义处标注 @SessionAttributes 注解来实现的。通过[实验](http://www.cnblogs.com/waytofall/p/3460533.html)验证一下。

      @Controller
      @RequestMapping("/Demo.do")
      @SessionAttributes(value={"attr1","attr2"})
      public class Demo {

          @RequestMapping(params="method=index")
          public ModelAndView index() {
              ModelAndView mav = new ModelAndView("index.jsp");
              mav.addObject("attr1", "attr1Value");
              mav.addObject("attr2", "attr2Value");
              return mav;
          }

          @RequestMapping(params="method=index2")
          public ModelAndView index2(@ModelAttribute("attr1")String attr1, @ModelAttribute("attr2")String attr2) {
              ModelAndView mav = new ModelAndView("success.jsp");
              return mav;
          }
      }

#### [@ModelAttribute](http://www.cnblogs.com/Hymen/p/3296952.html)
我们可以在需要访问 Session 属性的 controller 上加上 @SessionAttributes，然后在 action 需要的 User 参数上加上 @ModelAttribute，并保证两者的属性名称一致。SpringMVC 就会自动将 @SessionAttributes 定义的属性注入到 ModelMap 对象，在 setup action 的参数列表时，去 ModelMap 中取到这样的对象，再添加到参数列表。只要我们不去调用 SessionStatus 的 setComplete() 方法，这个对象就会一直保留在 Session 中，从而实现 Session 信息的共享。

@ModelAttribute注释方法
被@ModelAttribute注释的方法会在此controller每个方法执行前被执行，因此对于一个controller映射多个URL的用法来说，要谨慎使用。

#### @RestController 与 @Controller
@RestController注解相当于@ResponseBody ＋ @Controller合在一起的作用。

1)如果只是使用@RestController注解Controller，则Controller中的方法无法返回jsp页面，配置的视图解析器InternalResourceViewResolver不起作用，返回的内容就是Return 里的内容。
例如：本来应该到success.jsp页面的，则其显示success.

2)如果需要返回到指定页面，则需要用 @Controller配合视图解析器InternalResourceViewResolver才行。
3)如果需要返回JSON，XML或自定义mediaType内容到页面，则需要在对应的方法上加上@ResponseBody注解。

***


## Spring 标签

\<context:annotation-config/\> 

将隐式地向 Spring 容器注册 4 个 BeanPostProcessor：
  * AutowiredAnnotationBeanPostProcessor
  * CommonAnnotationBeanPostProcessor
  * PersistenceAnnotationBeanPostProcessor
  * equiredAnnotationBeanPostProcessor

详情看[这里](http://blog.csdn.net/jationxiaozi/article/details/6084757)


[\<context:component-scan base-package="pack.pack"/\>](http://www.cnblogs.com/iuranus/archive/2012/07/19/2599084.html)

该配置项其实也包含了自动注入上述processor的功能，因此当使用<context:component-scan/>后，即可将<context:annotation-config/>省去。


## Spring mvc

#### [ViewResolver](http://blog.csdn.net/prince2270/article/details/5891085)
Spring MVC使用ViewResolver来根据controller中返回的view名关联到具体的View对象。使用View对象来渲染返回值以生成最终的视图，如html,json或pdf等。

[ContentNegotiatingViewResolver](http://www.open-open.com/lib/view/open1417705219152.html) 视图解析器,利用他就可以配置多种返回值。
[Migrating spring 3.2 REST to Spring 4](https://javattitude.com/2014/04/20/migrating-spring-3-2-rest-to-spring-4/)


## Spring AOP
AOP（Aspect Orient Programming），作为面向对象编程的一种补充，广泛应用于处理一些具有横切性质的系统级服务，如事务管理、安全检查、缓存、对象池管理等。
> 横向抽取代码复用: 基于代理技术,在不修改原来代码的前提下,对原有方法进行增强。

#### AOP相关术语
|术语	 | 中文  |描述   |
| ----- | --------- | :------ |
|joinpoint |连接点  |指那些被拦截到的点。在Spring中,这些点指方法(因为Spring只支持方法类型的连接点)。|
|pointcut |切入点  |指需要(配置)被增强的 joinpoint。|
|advice |通知/增强  |指拦截到joinpoint后要做的操作。通知分为前置通知/后置通知/异常通知/最终通知/环绕通知等。|
|aspect |切面	|切入点和通知的结合。|
|target |目标对象|  需要被代理(增强)的对象.|
|proxy |代理对象  |目标对象被AOP 织入 增强/通知后,产生的对象。|
|weaving |织入  |指把增强/通知应用到目标对象来创建代理对象的过程，(Spring采用动态代理织入,AspectJ采用编译期织入和类装载期织入)。|
|introduction |引介  |一种特殊通知,在不修改类代码的前提下,可以在运行期为类动态地添加一些Method/Field(不常用)。|

#### Spring aop 通知
AOP联盟为通知Advice定义了org.aopalliance.aop.Advice接口, Spring在Advice的基础上,根据通知在目标方法的连接点位置,扩充为以下五类：   

|通知	 | 接口  | 注解  |描述   | 备注   | 
| -------- | --------- | ------- | :------ |------- | 
|前置通知 |MethodBeforeAdvice  |@Before  |在目标方法执行前实施增强| 权限控制 |
|后置通知 |AfterReturningAdvice  |@AfterReturning  |在目标方法执行后实施增强| |
|环绕通知 |MethodInterceptor  |@Around |在目标方法执行前后实施增强| 权限控制/性能监控/缓存实现/事务管理 |
|异常抛出通知 |ThrowsAdvice	|@AfterThrowing  |在目标方法抛出异常后实施增强| 发生异常后,记录错误日志 |
|引介通知 |IntroductionInterceptor  |@DeclareParents  |在目标类中添加新的方法和属性| |
|最终final通知 |- |@After  | 不管是否异常,该通知都会执行 | 释放资源 |

#### 切入点表达式
|AspectJ 指示器 | 描述 |
|------- | --------- |
|args()	 | 限制连接点匹配参数为执行类型的执行方法 |
|@args()	 | 限制连接点匹配参数由执行注解标注的执行方法 |
|execution()	 | 匹配连接点的执行方法 |
|this()	 | 限制连接点匹配AOP代理的Bean引用类型为指定类型的Bean |
|target()	 | 限制连接点匹配目标对象为指定类型的类 |
|@target()	 | 限制连接点匹配目标对象被指定的注解标注的类 |
|within()	 | 限制连接点匹配匹配指定的类型 |
|@within()	 | 限制连接点匹配指定注解标注的类型 |
@annotation	限制匹配带有指定注解的连接点

execution 函数定义语法： 	   	

execution(<访问修饰符> <返回类型><方法名>(<参数>)<异常>) 
例如:

      1) execution(public * *(..)) # 匹配所有public方法. 
      2) execution(* com.tang.dao.*(..)) # 匹配指定包下所有类方法(不包含子包) 
      3) execution(* com.tang.dao..*(..)) # 匹配指定包下所有类方法(包含子包) 
      4) execution(* com.tang.service.impl.OrderServiceImple.*(..)) # 匹配指定类所有方法 
      5) execution(* com.tang.service.OrderService+.*(..)) # 匹配实现特定接口所有类方法 
      6) execution(* save*(..)) # 匹配所有save开头的方法
***

> Spring 的 AOP 代理由 Spring 的 IoC 容器负责生成、管理，其依赖关系也由 IoC 容器负责管理。因此，AOP 代理可以直接使用容器中的其他 Bean 实例作为目标，这种关系可由 IoC 容器的依赖注入提供。

#### Spring 原始 AOP
配置文件：

	<bean id="service" class="com.tang.springaop.OrderServiceImpl" />
	<bean id="advice" class="com.tang.springaop.ConcreteInterceptor" />
	<bean id="serviceProxy" class="org.springframework.aop.framework.ProxyFactoryBean">
		<property name="target" ref="service" />
		<property name="interceptorNames" value="advice" />
		<property name="proxyTargetClass" value="false" />
	</bean>
测试代码：

      @RunWith(SpringJUnit4ClassRunner.class)
      @ContextConfiguration(locations = "classpath:applicationContext.xml")
      public class AOPClient {

          @Autowired
          @Qualifier("serviceProxy")
          private OrderService service;

          @Test
          public void client() {
              ...
          }
      }
 
> Spring AOP 框架对 AOP 代理类的处理原则是：如果目标对象的实现类实现了接口，Spring AOP 将会采用 JDK 动态代理来生成 AOP 代理类；如果目标对象的实现类没有实现接口，Spring AOP 将会采用 CGLIB 来生成 AOP 代理类。
     
#### Spring AOP XML 使用
在Spring的配置文件中，所有的切面和通知器都必须定义在 <aop:config> 元素内部。<aop:config> 内部包括 aop:pointcut， aop:advisor， aop:aspect 标签。
* aop:pointcut : 切入点定义
* aop:advisor: 定义Spring传统AOP的切面,只支持一个pointcut/一个advice
* aop:aspect : 定义AspectJ切面的,可以包含多个pointcut/多个advice

配置文件：

      <bean id="advice" class="com.tang.springaop.ConcreteInterceptor" />
	<aop:config proxy-target-class="true">
		<aop:pointcut expression="execution(* com.tang.springaop.OrderServiceImpl.*(..))" id="pointcut"/>
		<aop:advisor advice-ref="advice" pointcut-ref="pointcut"/>	
	</aop:config>

或者

	<context:component-scan base-package="com.tang.springaop" />
	<bean id="advice" class="com.tang.aspect.advice.Aspect" />
	<aop:config>
		<aop:aspect ref="advice">
			<aop:pointcut expression="execution(* com.tang.springaop.OrderServiceImpl.*(..))" id="pointcut" />
			<aop:before method="before" pointcut-ref="pointcut" />
                  <aop:after-returning method="afterReturning" returning="result" pointcut-ref="pointcut" />
                  <aop:around method="around" arg-names="point" pointcut-ref="pointcut" />
                  <aop:after-throwing method="afterThrowing" throwing="ex" pointcut-ref="pointcut" />
                  <aop:after method="after" pointcut-ref="pointcut" />
		</aop:aspect>
	</aop:config>
*method 对应 Aspect 类中的方法*

> Spring 依然采用运行时生成动态代理的方式来增强目标对象，所以它不需要增加额外的编译，也不需要 AspectJ 的织入器支持；而 AspectJ 在采用编译时增强，所以 AspectJ 需要使用自己的编译器来编译 Java 文件，还需要织入器。

#### Spring AOP 注解使用
使用AspectJ注解AOP需要在 applicationContext.xml 文件中开启注解自动代理功能。

	<context:component-scan base-package="com.tang.aspect.advice" />
	<aop:aspectj-autoproxy/>

注解使用：

      /**
       * @Aspect: 指定是一个切面
       * @Component: 指定可以被Spring容器扫描到
       */
      @Aspect
      @Component
      public class AnnoAspect {

            @Before("execution(* com.tang.springaop.OrderServiceImpl.*(..))")
            public void before(JoinPoint point) {
              System.out.printf("before %s%n", point.getKind());
          }

            @AfterReturning(value = "execution(* com.tang.springaop.OrderServiceImpl.*(..))", returning = "result")
            public void afterReturning(JoinPoint point, Object result) {
                System.out.printf("afterReturning 结果为 %s%n", result);
            }

            @Around("execution(* com.tang.springaop.OrderServiceImpl.*(..))")
            public Object around(ProceedingJoinPoint point) throws Throwable {
                long start = System.currentTimeMillis();
                Object result = point.proceed(point.getArgs());
                long time = System.currentTimeMillis() - start;

                System.out.printf("method %s invoke consuming %d ms%n", point.toLongString(), time);

                return result;
            }

            @AfterThrowing(value="execution(* com.tang.springaop.OrderServiceImpl.*(..))", throwing="ex")
            public void afterThrowing(JoinPoint point, Throwable ex) {
                String message = new StringBuilder("method ").append(point.getSignature().getName()).append(" error").toString();
                System.out.println(message);
            }

            @After("execution(* com.tang.springaop.OrderServiceImpl.*(..))")
            public void after(JoinPoint point) {
                System.out.println("After");
            }
      }

**@Pointcut定义切点**  
对于重复的切点,可以使用@Pointcut进行定义, 然后在通知注解内引用。

定义切点方法

      public class SelfPointcut {

          @Pointcut("execution(* com.tang.springaop.OrderServiceImpl.*(..))")
          public void pointcut() {
          }
      }

引用切点,在Advice上像调用方法一样引用切点:
      
      @After("SelfPointcut.pointcut()")
      public void after(JoinPoint point) {
          System.out.println("after");
      }

> AOP 广泛应用于处理一些具有横切性质的系统级服务，AOP 的出现是对 OOP 的良好补充，它使得开发者能用更优雅的方式处理具有横切性质的服务。不管是那种 AOP 实现，不论是 AspectJ、还是 Spring AOP，它们都需要动态地生成一个 AOP 代理类，区别只是生成 AOP 代理类的时机不同：AspectJ 采用编译时生成 AOP 代理类，因此具有更好的性能，但需要使用特定的编译器进行处理；而 Spring AOP 则采用运行时生成 AOP 代理类，因此无需使用特定编译器进行处理。由于 Spring AOP 需要在每次运行时生成 AOP 代理，因此性能略差一些。

**知识点**  
[Java JDK代理、CGLIB、AspectJ代理分析比较](https://zhuanlan.zhihu.com/p/28870960)  
[Spring 实践：AOP](http://www.importnew.com/19041.html)  
[Spring AOP 实现原理与 CGLIB 应用](https://www.ibm.com/developerworks/cn/java/j-lo-springaopcglib/index.html)  


