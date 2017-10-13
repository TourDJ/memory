

#### Access-Control-Allow-Origin
> Access-Control-Allow-Origin是从Cross Origin Resource Sharing (CORS)中分离出来的。这个header是决定哪些网站可以访问资源，通过定义一个通配符来决定是单一的网站还是所有网站可以访问我们的资源。需要注意的是，如果定义了通配符，那么 Access-Control-Allow-Credentials选项就无效了，而且user-agent的cookies不会在请求里发送。

正确的设置

    * – 通配符允许任何远程资源来访问含有Access-Control-Allow-Origin 的内容。  
    http://www.example.com – 只允许特定站点才能访问(http://[host], 或者 https://[host]) 

通常不正确的设置

    http://example.com, http://web2.example.com – 多个站点是不支持的，只能配置一个站点。  
    *.example.com – 只允许单一的站点  
    http://*.example.com – 同上面一样  


#### Etag
> HTTP 协议规格说明定义ETag为“被请求变量的实体值” （参见 —— 章节 14.19）。 另一种说法是，ETag是一个可以与Web资源关联的记号（token）。典型的Web资源可以一个Web页，但也可能是JSON或XML文档。服务器单独负责判断记号是什么及其含义，并在HTTP响应头中将其传送到客户端，以下是服务器端返回的格式：

        ETag: "50b1c1d4f775c61:df3"  
        
客户端的查询更新格式是这样的：  

      If-None-Match: W/"50b1c1d4f775c61:df3"  
 
 如果ETag没改变，则返回状态304然后不返回，这也和Last-Modified一样。本人测试Etag主要在断点下载时比较有用。 
 
      Last-Modified和Etags如何帮助提高性能?  
        
> 聪明的开发者会把Last-Modified 和ETags请求的http报头一起使用，这样可利用客户端（例如浏览器）的缓存。因为服务器首先产生 Last-Modified/Etag标记，服务器可在稍后使用它来判断页面是否已经被修改。本质上，客户端通过将该记号传回服务器要求服务器验证其（客户端）缓存。    

过程如下: 

       1. 客户端请求一个页面（A）。  
       2. 服务器返回页面A，并在给A加上一个Last-Modified/ETag。  
       3. 客户端展现该页面，并将页面连同Last-Modified/ETag一起缓存。  
       4. 客户再次请求页面A，并将上次请求时服务器返回的Last-Modified/ETag一起传递给服务器。  
       5. 服务器检查该Last-Modified或ETag，并判断出该页面自上次客户端请求之后还未被修改，直接返回响应304和一个空的响应体。
