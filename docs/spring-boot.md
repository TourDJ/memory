
Spring boot 博文摘录：

@ SpringBoot理念就是零配置编程，但是如果绝对需要使用XML的配置，我们建议您仍旧从一个@Configuration类开始，你可以使用@ImportResouce注解加载XML配置文件

@ 在使用springboot的时候一般是极少需要添加配置文件的(application.properties除外)，但是在实际应用中也会存在不得不添加配置文件的情况，例如集成其他框架或者需要配置一些中间件等，在这种情况下，我们就需要引入我们自定义的xml配置文件了。

