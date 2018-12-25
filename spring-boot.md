

## Spring boot 配置

### spring-boot-starter-jdbc
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


### spring-boot-configuration-processor
spring默认使用yml中的配置，但有时候要用传统的xml或properties配置，就需要使用spring-boot-configuration-processor了
```java
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-configuration-processor</artifactId>
    <optional>true</optional>
</dependency>
```
再在你的配置类开头加上@PropertySource("classpath:your.properties")，其余用法与加载yml的配置一样

