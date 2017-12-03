
spring mongodb 整合配置，详细解释看[这里](https://segmentfault.com/a/1190000005829384)

spring-mongo.xml

    <?xml version="1.0" encoding="UTF-8"?>
    <beans xmlns="http://www.springframework.org/schema/beans"
           xmlns:context="http://www.springframework.org/schema/context"
           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
           xmlns:mongo="http://www.springframework.org/schema/data/mongo"
           xsi:schemaLocation="http://www.springframework.org/schema/beans
            http://www.springframework.org/schema/beans/spring-beans-2.5.xsd
            http://www.springframework.org/schema/context
            http://www.springframework.org/schema/context/spring-context.xsd
            http://www.springframework.org/schema/data/mongo
            http://www.springframework.org/schema/data/mongo/spring-mongo.xsd
        ">


        <context:annotation-config/>

        <context:component-scan base-package="cn.joyven.web.*"/>

        <bean class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
            <property name="systemPropertiesModeName" value="SYSTEM_PROPERTIES_MODE_OVERRIDE"/>
            <property name="ignoreResourceNotFound" value="true"/>
            <property name="locations">
                <list>
                    <!-- 越靠后越有效，取到最后一个有效的未知 -->
                    <value>classpath:conf/properties/*.properties</value>
                </list>
            </property>
        </bean>

        <!-- 1.7版本+不支持mongo,支持mongo-client,options为client-options -->
        <!-- Usage of 'UserCredentials' with 'MongoClient' is no longer supported -->
        <!-- 配置mongodb连接池 ,创建mongoClient实例-->
        <!--credentials="mongodb://${mongo.user}:${mongo.pwd}@${mongo.host}:${mongo.port}/${mongo
        .defaultDbName}"为什么不起作用
        如果需要验证,mongo-client需要加这句: credentials="${mongo.user}:${mongo.pwd}@${mongo.defaultDbName}"
        -->
        <mongo:mongo-client id="mongoClient"  host="${mongo.host}" port="${mongo.port}">
            <mongo:client-options
                    connections-per-host="${mongo.connectionsPerHost}"
                    min-connections-per-host="${mongo.minConnectionsPerHost}"
                    threads-allowed-to-block-for-connection-multiplier="${mongo.threadsAllowedToBlockForConnectionMultiplier}"
                    connect-timeout="${mongo.connectTimeout}"
                    max-wait-time="${mongo.maxWaitTime}"
                    socket-keep-alive="${mongo.socketKeepAlive}"
                    socket-timeout="${mongo.socketTimeout}"
                    description="${mongo.description}"
                    max-connection-idle-time="${mongo.maxConnectionIdleTime}"
                    max-connection-life-time="${mongo.maxConnectionLifeTime}"
                    heartbeat-socket-timeout="${mongo.heartbeatSocketTimeout}"
                    heartbeat-connect-timeout="${mongo.heartbeatConnectTimeout}"
                    min-heartbeat-frequency="${mongo.minHeartbeatFrequency}"
                    heartbeat-frequency="${mongo.heartbeatFrequency}"

            />
        </mongo:mongo-client>

        <!-- dbname="${mongo.defaultDbName}" host="${mongo.host}"
                          port="${mongo.port}" username="${mongo.user}" password="${mongo.pwd}"
                          mongo-ref="mongoClient" -->
        <mongo:db-factory id="mongoDbFactory"
                          dbname="${mongo.defaultDbName}"
                          mongo-ref="mongoClient"/>

        <!-- 1.Spring提供的mongodb操作模板-->
        <mongo:template id="mongoTemplate" db-factory-ref="mongoDbFactory" write-concern="NORMAL"/>
        <!-- 2.Spring提供的mongodb操作模板-->
        <!--<bean id="mongoTemplate" class="org.springframework.data.mongodb.core.MongoTemplate">
            <constructor-arg ref="mongoDbFactory" />
        </bean>-->


        <!-- MongoDB GridFS Template 支持，操作mongodb存放的文件 -->
        <mongo:mapping-converter id="converter" db-factory-ref="mongoDbFactory"
                                 base-package="cn.idongjia.web.dao"/>
        <mongo:gridFsTemplate id="gridFsTemplcate" db-factory-ref="mongoDbFactory" converter-ref="converter" />

        <!-- mongodb bean的仓库目录，会自动扫描扩展了MongoRepository接口的接口进行注入 -->
        <mongo:repositories base-package="cn.joyven.web.repository" />

        <!--激活注解-->
        <bean class="org.springframework.context.annotation.CommonAnnotationBeanPostProcessor"/>

    </beans>

db.properties

    mongo.host=127.0.0.1
    mongo.port=27017
    mongo.defaultDbName=log
    mongo.user=joyven
    mongo.pwd=123456
    mongo.connectionsPerHost=10
    mongo.threadsAllowedToBlockForConnectionMultiplier=5
    mongo.minConnectionsPerHost=5
    #连接超时时间
    mongo.connectTimeout=10000
    #等待时间
    mongo.maxWaitTime=120000
    #Socket超时时间
    mongo.socketTimeout=0
    mongo.socketKeepAlive=true

    mongo.description=joyven test mongodb database
    mongo.maxConnectionIdleTime=1500
    mongo.maxConnectionLifeTime=0
    #mongo slave
    mongo.heartbeatSocketTimeout=1000
    mongo.heartbeatConnectTimeout=1500
    mongo.minHeartbeatFrequency=5
    mongo.heartbeatFrequency=10

相关参考：
[spring annotation](http://blog.csdn.net/kaiwii/article/details/7877663)
