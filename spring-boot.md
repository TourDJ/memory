

## Spring boot 配置

* spring-boot-starter-jdbc
Spring 对数据库的操作在jdbc上面做了深层次的封装，使用spring的注入功能，可以把DataSource注册到JdbcTemplate之中。 
JdbcTemplate 是在JDBC API基础上提供了更抽象的封装，并提供了基于方法注解的事务管理能力。 通过使用SpringBoot自动配置功能并代替我们自动配置beans。
在maven中，我们需要增加spring-boot-starter-jdbc模块
```java
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```
通过这个模块为我们做了以下几件事
* tomcat-jdbc－{version}.jar为我们自动配置DataSource.
* 如果你没有定义任何DataSource，SpringBoot将会自动配置一个内存的数据库资源设置
* 如果没有设置任一个beans，SpringBoot会自动注册它
* 初始化数据库

> 如果我们在classpath里定义了schema.sql和data.sql文件，springBoot将会使用这些文件自动初始化数据库(但你必须选建库)
除了载入schema.sql和data.sql外，SpringBoot也会载入schema-${platform}.sql和data-${platform}.sql，如果在你的classpath下存在的话。
spring.datasource.schema=xxxx-db.sql 可以定义你的建库文件
spring.datasource.data=xxxx-data.sql  可以定义你的数据文件
spring.datasource.initialize＝true|false 可以决定是不是要初始化这些数据库文件
spring.datasource.continueOnError＝true|false 有了错误是否继续运行

