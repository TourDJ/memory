
Nginx ("engine x") 是一个高性能的 HTTP 和 反向代理服务器，也是一个 IMAP/POP3/SMTP 代理服务器。 Nginx 是由 Igor Sysoev 为俄罗斯访问量第二的 
Rambler.ru 站点开发的，第一个公开版本0.1.0发布于2004年10月4日。其将源代码以类BSD许可证的形式发布，因它的稳定性、丰富的功能集、示例配置文件和低系
统资源的消耗而闻名。

尽管Node.JS的性能不错，但处理静态事务确实不是他的专长，如：gzip编码，静态文件，HTTP缓存，SSL处理，负载平衡和反向代理及多站点代理等，都可以通过nginx
来完成，从而减小node.js的负载，并通过nginx强大的缓存来节省您网站的流量从而提高网站的加载速度。


nginx.conf 完整例子看 [这里](https://www.nginx.com/resources/wiki/start/topics/examples/full/)

      # For more information on configuration, see:
      #   * Official English Documentation: http://nginx.org/en/docs/
      #   * Official Russian Documentation: http://nginx.org/ru/docs/

      user              nginx;
      worker_processes  1;

      error_log  /var/log/nginx/error.log;
      #error_log  /var/log/nginx/error.log  notice;
      #error_log  /var/log/nginx/error.log  info;

      pid        /var/run/nginx.pid;

      events {
          worker_connections  1024;
      }

      http {
          proxy_cache_path  /var/cache/nginx levels=1:2 keys_zone=one:8m max_size=3000m inactive=600m;
          proxy_temp_path /var/tmp;
          include       mime.types;
          default_type  application/octet-stream;
          sendfile        on;
          keepalive_timeout  65;

          access_log  /var/log/nginx/access.log  main;

          gzip on;
          gzip_comp_level 6;
          gzip_vary on;
          gzip_min_length  1000;
          gzip_proxied any;
          gzip_types text/plain text/html text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;
          gzip_buffers 16 8k;

          #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                            '$status $body_bytes_sent "$http_referer" '
                            '"$http_user_agent" "$http_x_forwarded_for"';
          #tcp_nopush     on;

          # Load config files from the /etc/nginx/conf.d directory
          # The default server is in conf.d/default.conf
          #include /etc/nginx/conf.d/*.conf;
          #include /etc/nginx/sites-enabled/*;

          upstream silly_face_society_upstream {
            server 127.0.0.1:61337;
            server 127.0.0.1:61338;
            keepalive 64;
          }

          server {
              listen 80;
              listen 443 ssl;

              ssl_certificate /some/location/sillyfacesociety.com.bundle.crt;
              ssl_certificate_key /some/location/sillyfacesociety.com.key;
              ssl_protocols        SSLv3 TLSv1;
              ssl_ciphers HIGH:!aNULL:!MD5;

              server_name sillyfacesociety.com www.sillyfacesociety.com;

              if ($host = 'sillyfacesociety.com' ) {
                      rewrite  ^/(.*)$  http://www.sillyfacesociety.com/$1  permanent;
              }

              error_page 502  /errors/502.html;

              location ~ ^/(images/|img/|javascript/|js/|css/|stylesheets/|flash/|media/|static/|robots.txt|humans.txt|favicon.ico) {
                root /usr/local/silly_face_society/node/public;
                access_log off;
                expires max;
              }

              location /errors {
                internal;
                alias /usr/local/silly_face_society/node/public/errors;
              }

              location / {
                proxy_redirect off;
                proxy_set_header   X-Real-IP            $remote_addr;
                proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
                proxy_set_header   X-Forwarded-Proto $scheme;
                proxy_set_header   Host                   $http_host;
                proxy_set_header   X-NginX-Proxy    true;
                proxy_set_header   Connection "";
                proxy_http_version 1.1;
                proxy_cache one;
                proxy_cache_key sfs$request_uri$scheme;
                proxy_pass         http://silly_face_society_upstream;
              }
          }

          ## 静态资源
          server {
              listen 80;
              listen 443 ssl;
              ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
              server_name youpu.qingtime.cn;
              access_log logs/youpu.qingtime.cn.log;

              ssl_certificate     /etc/nginx/ssl/youpu.qingtime.cn.cer;
              ssl_certificate_key /etc/nginx/ssl/youpu.qingtime.cn.key;

              root /home/work/websites/youpu.qingtime.cn;
              index index.html;


              #location ~* \.(ico|gif|jpg|png|bmp|html|htm|css|svg|js)$ {
              #  access_log   off;
              #  expires      30d;
              #  break;
              #}

              ## 静态文件拦截器
              location ~ ^/(images/|img/|javascript/|js/|css/|stylesheets/|flash/|media/|static/|robots.txt|humans.txt|favicon.ico) {
                root /usr/local/silly_face_society/node/public;
                access_log off;
                expires max;
              }

          }    
      }


[详细解释](http://blog.argteam.com/coding/hardening-node-js-for-production-part-2-using-nginx-to-avoid-node-js-load/)


