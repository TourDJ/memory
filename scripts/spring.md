

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

#### @RequestBody

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
返回的数据不是html标签的页面，而是其他某种格式的数据时（如json、xml等）使用；

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

