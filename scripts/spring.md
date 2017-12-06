

## Spring 注解

@Configuration

明确指出该类是 Bean 配置的信息源。Spring 对标注 Configuration 的类有如下要求：  
* 配置类不能是 final 的；
* 配置类不能是本地化的，亦即不能将配置类定义在其他类的方法内部；
* 配置类必须有一个无参构造函数。

详情看[这里](https://www.tuicool.com/articles/M3MVr2)


## Spring 标签

\<context:annotation-config/\> 

将隐式地向 Spring 容器注册 4 个 BeanPostProcessor：
  * AutowiredAnnotationBeanPostProcessor
  * CommonAnnotationBeanPostProcessor
  * PersistenceAnnotationBeanPostProcessor
  * equiredAnnotationBeanPostProcessor

详情看[这里](http://blog.csdn.net/jationxiaozi/article/details/6084757)


\<context:component-scan base-package="pack.pack"/\>

该配置项其实也包含了自动注入上述processor的功能，因此当使用<context:component-scan/>后，即可将<context:annotation-config/>省去。

详情看[这里](http://www.cnblogs.com/iuranus/archive/2012/07/19/2599084.html)
