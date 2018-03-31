
Spring boot 博文摘录：

@ SpringBoot理念就是零配置编程，但是如果绝对需要使用XML的配置，我们建议您仍旧从一个@Configuration类开始，你可以使用@ImportResouce注解加载XML配置文件

@ 在使用springboot的时候一般是极少需要添加配置文件的(application.properties除外)，但是在实际应用中也会存在不得不添加配置文件的情况，例如集成其他框架或者需要配置一些中间件等，在这种情况下，我们就需要引入我们自定义的xml配置文件了。

@ Spring Boot 不单单从 application.properties 获取配置，所以我们可以在程序中多种设置配置属性。按照以下列表的优先级排列：
1.命令行参数
2.java:comp/env 里的 JNDI 属性
3.JVM 系统属性
4.操作系统环境变量
5.RandomValuePropertySource 属性类生成的 random.* 属性
6.应用以外的 application.properties（或 yml）文件
7.打包在应用内的 application.properties（或 yml）文件
8.在应用 @Configuration 配置类中，用 @PropertySource 注解声明的属性文件
9.SpringApplication.setDefaultProperties 声明的默认属性

