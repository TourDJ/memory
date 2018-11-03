
*随着js技术生态圈的不断发展，nodejs 工程的目录结构现在变得越来越复杂，项目下面不断出现新的配置文件。简单总结一下，加深理解。*

#### jsconfig.json
	
The presence of jsconfig.json file in a directory indicates that the directory is the root of a JavaScript Project. The jsconfig.json file specifies the root files and the options for the features provided by the JavaScript language service.

目录中存在jsconfig.json文件表示该目录是JavaScript项目的根目录。 jsconfig.json文件指定根文件和JavaScript语言服务提供的功能选项。

***

#### jest.config.js

***

#### .travis.yml
Travis CI是在线托管的CI服务，用Travis来进行持续集成。.travis.yml 文件添加到存储库以告知Travis CI要执行的操作。

***

#### .babelrc
[.babelrc](https://babeljs.io/docs/en/configuration#babelrc) 是 babel 配置文件。
示例：
```javascript
{
  "presets": [...],
  "plugins": [...]
}
```
***
