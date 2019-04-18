

### Java 泛型

关键字说明
* ? 通配符类型
* <? extends T> 表示类型的上界，表示参数化类型的可能是 T 或是 T 的子类
* <? super T> 表示类型下界（Java Core中叫超类型限定），表示参数化类型是此类型的超类型（父类型），直至Object

extends 可用于的返回类型限定，不能用于参数类型限定。super 可用于参数类型限定，不能用于返回类型限定。

> 带有super超类型限定的通配符可以向泛型对象写入，带有extends子类型限定的通配符可以向泛型对象读取。


### Java 异常

Java 异常层级图：

[原图](http://www.benchresources.net/wp-content/uploads/2017/02/exception-hierarchy-in-java.png)  

![Exception-class](https://github.com/Smallbucket/memory/blob/master/docs/java/images/Exception_Classes.png)    
[原图](https://www3.ntu.edu.sg/home/ehchua/programming/java/J5a_ExceptionAssert.html#zz-1.4)     
