
## pm2 使用

> pm2 是一个带有负载均衡功能的Node应用的进程管理器

## pm2 常用命令

#### 启动项目

    pm2 start app.js
    
#### 启动项目并命名

    pm2 start app.js --name test

#### 删除项目

    pm2 delete test

#### 重载项目

    pm2 reload test

#### 重启项目

    pm2 restart test

#### 查看详情

    pm2 show test


#### 批量操作

    pm2 reload all
    pm2 stop all
    pm2 restart all
    pm2 delete all

#### 集群启动

    pm2 start app.js -i 2 --name test

#### 自动重加载

    pm2 start app.js --name test --watch

#### 显示列表

    pm2 list

#### 打开实时监视器

    pm2 monit

#### 查看日志

    pm2 logs

