
**随着js技术生态圈的不断发展，nodejs 工程的目录结构现在变得越来越复杂，项目下面不断出现新的约定的文件夹(约定优先配置)及配置文件。简单总结一下，加深理解。**

## 配置文件

* ### [package.json](http://www.cnblogs.com/tzyy/p/5193811.html#_h1_10)      


* ### eslintConfig 
eslint 配置

***

* ### jsconfig.json
	
The presence of jsconfig.json file in a directory indicates that the directory is the root of a JavaScript Project. The jsconfig.json file specifies the root files and the options for the features provided by the JavaScript language service.

目录中存在jsconfig.json文件表示该目录是JavaScript项目的根目录。 jsconfig.json文件指定根文件和JavaScript语言服务提供的功能选项。

***

* ### jest.config.js

***

* ### .travis.yml
Travis CI是在线托管的CI服务，用Travis来进行持续集成。.travis.yml 文件添加到存储库以告知Travis CI要执行的操作。

***

* ### .babelrc
[.babelrc](https://babeljs.io/docs/en/configuration#babelrc) 是 babel 配置文件。
示例：
```javascript
{
  "presets": [...],
  "plugins": [...]
}
```
***

* ### manifest.json
为了实现 PWA 应用添加至桌面的功能，除了要求站点支持 HTTPS 之外，还需要准备 [manifest.json](https://lavas.baidu.com/doc/engage-retain-users/add-to-home-screen/introduction) 文件去配置应用的图标、名称等信息。举个例子，一个基本的 manifest.json 应包含如下信息：
```javascript
{
  "short_name": "React App",
  "name": "Create React App Sample",
  "icons": [
    {
      "src": "favicon.ico",
      "sizes": "64x64 32x32 24x24 16x16",
      "type": "image/x-icon"
    }
  ],
  "start_url": "./index.html",
  "display": "standalone",
  "theme_color": "#000000",
  "background_color": "#ffffff"
}
```
使用 link 标签将 manifest.json 部署到 PWA 站点 HTML 页面的头部，如下所示：
```javascript
<link rel="manifest" href="path-to-manifest/manifest.json">
```

***




