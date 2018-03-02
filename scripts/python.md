
> python 资料  
> * [The Python Tutorial](https://docs.python.org/2/tutorial/index.html)  
> * [简明 Python 教程](https://woodpecker.org.cn/abyteofpython_cn/chinese/index.html)  

***

## Python 语法
运行 python 文件  

	python hello.py
    
编译成 .pyc 文件

	python -m py_compile hello.py
	python hello.pyc
> .pyc 文件可以提高加载速度，但不能提高运行速度。

编译成 .pyo 文件

    python -O -m py_compile hello.py
    python hello.pyo

### python [内置属性](http://www.cnblogs.com/java-koma/articles/1877231.html)
一个python文件相当于一个模块，模块都有内置的属性信息，用 dir(模块名) 可以查看：		

	__doc__ ： 模块的docstring  
	__file__ ：模块文件在磁盘上的绝对路径  
	__name__ ：模块的名称（独立运行时值是__main__，被import时值是模块的名称）  

例如：

		def sayHello(name):
		    print "Hello, my name is %s" % name

		if __name__ == '__main__':
		    # 这里可以写测试代码，只有当单独运行时才会执行到这里，被其它模块import时是不会被执行的
		    sayHello("koma")

### python 运算符 

推荐阅读：  
[Python的运算符](https://zhuanlan.zhihu.com/p/20584316)
 
### Python 函数
#### map 函数
map()函数是 Python 内置的高阶函数，它接收一个函数 f 和一个 list，并通过把函数 f 依次作用在 list 的每个元素上，得到一个新的 list 并返回。

    def format_name(s):
        return s[0].upper() + s[1:].lower()
    
    print map(format_name, ['adam', 'LISA', 'barT'])
    
map()函数不改变原有的 list，而是返回一个新的 list。

#### reduce 函数
reduce()函数也是Python内置的一个高阶函数。reduce()函数接收的参数和 map()类似，一个函数 f，一个list，但行为和 map()不同，reduce()传入的函数 f 必须接收两个参数，reduce()对list的每个元素反复调用函数f，并返回最终结果值。

    def f(x, y):
        return x + y

    reduce(f, [1, 3, 5, 7, 9])
reduce()还可以接收第3个可选参数，作为计算的初始值。
例如

    reduce(f, [1, 3, 5, 7, 9], 100)

#### filter 函数
filter()函数是 Python 内置的另一个有用的高阶函数，filter()函数接收一个函数 f 和一个list，这个函数 f 的作用是对每个元素进行判断，返回 True或 False，filter()根据判断结果自动过滤掉不符合条件的元素，返回由符合条件元素组成的新list。

	import math
	def is_sqr(x):
	    r = int(math.sqrt(x))
	    return r*r==x
	print filter(is_sqr, range(1, 101))

#### sorted()函数
sorted()函数也是一个高阶函数，它可以接收一个比较函数来实现自定义排序，比较函数的定义是，传入两个待比较的元素 x, y，如果 x 应该排在 y 的前面，返回 -1，如果 x 应该排在 y 的后面，返回 1。如果 x 和 y 相等，返回 0。

	def cmp_ignore_case(s1, s2):
	    u1 = s1.upper()
	    u2 = s2.upper()
	    if u1 < u2:
		return -1
	    if u1 > u2:
		return 1
	    return 0
	print sorted(['bob', 'about', 'Zoo', 'Credit'], cmp_ignore_case)

> 链接： [python 常用函数](https://docs.python.org/2/library/functions.html)。

#### python 闭包
像内层函数引用了外层函数的变量（参数也算变量），然后返回内层函数的情况，称为闭包（Closure）。
例如：

	def count():
	    fs = []
	    for i in range(1, 4):
		def f(j):
		    def g():
			return j*j
		    return g
		r = f(i)
		fs.append(r)
	    return fs
	f1, f2, f3 = count()
	print f1(), f2(), f3()

#### python 匿名函数

	 map(lambda x: x * x, [1, 2, 3, 4, 5, 6, 7, 8, 9])
关键字 lambda 表示匿名函数，冒号前面的 x 表示函数参数。匿名函数有个限制，就是只能有一个表达式，不写return，返回值就是该表达式的结果。

### [python 参数](https://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001374738449338c8a122a7f2e047899fc162f4a7205ea3000)
Python 的函数定义非常简单，但灵活度却非常大。除了正常定义的必选参数外，还可以使用默认参数、可变参数和关键字参数，使得函数定义出来的接口，不但能处理复杂的参数，还可以简化调用者的代码。
* 默认参数  

		def power(x, n=2):
		    s = 1
		    while n > 0:
			n = n - 1
			s = s * x
		    return s
	    
* 可变参数  
可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple。定义可变参数和定义list或tuple参数相比，仅仅在参数前面加了一个*号。

		 def calc(*numbers):
		    sum = 0
		    for n in numbers:
			sum = sum + n * n
		    return sum

* 关键字参数
关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict。

		def person(name, age, **kw):
		    print 'name:', name, 'age:', age, 'other:', kw

> 参数组合  
> 在Python中定义函数，可以用必选参数、默认参数、可变参数和关键字参数，这4种参数都可以一起使用，或者只用其中某些，但是请注意，参数定义的顺序必须是：必选参数、默认参数、可变参数和关键字参数。

***

### Python 解释器
当我们编写Python代码时，我们得到的是一个包含Python代码的以.py为扩展名的文本文件。要运行代码，就需要 [Python 解释器](https://zhuanlan.zhihu.com/p/25256857)去执行.py文件。
常见 python 解释器：
* CPython：当我们从Python官方网站下载并安装好Python 2.7后，我们就直接获得了一个官方版本的解释器 CPython。
* IPython：IPython是基于CPython之上的一个交互式解释器。
* PyPy：PyPy是另一个Python解释器，它的目标是执行速度。
* Jython：Jython是运行在Java平台上的Python解释器，可以直接把Python代码编译成Java字节码执行。
* IronPython：IronPython和Jython类似，只不过IronPython是运行在微软.Net平台上的Python解释器，可以直接把Python代码编译成.Net的字节码。
> CPython用>>>作为提示符，而IPython用In [序号]:作为提示符。

### python 装饰器
python 内置的 @ 语法就是为了简化装饰器调用。

推荐阅读：  
[Python 装饰器](http://python.jobbole.com/82344/)

### python 迭代器和生成器

推荐阅读：  
[理解Python迭代对象、迭代器、生成器](https://zhuanlan.zhihu.com/p/24376869)  
[Python 迭代器与生成器](https://zhuanlan.zhihu.com/p/26123333)  
[Python 的迭代器和生成器](https://zhuanlan.zhihu.com/p/24499698)

***

编码

	-*- coding: utf-8 -*-
目的是告诉Python解释器，用UTF-8编码读取源代码。

#### pass 语句在函数中的作用

    def mypython():
        pass
    
定义一个函数 mypython，但函数体部分暂时还没有完成，又不能空着不写内容，因此可以用pass来替代占个位置。

#### pass 语句在循环中的作用

    while True:
        pass


## python web


推荐阅读：  
[Apache Tutorial: Dynamic Content with CGI](https://httpd.apache.org/docs/2.4/howto/cgi.html)
[Python Web部署方式总结](http://python.jobbole.com/85489/)

***

## Python 包管理工具

### pip 使用

#### 更新pip

    pip install -U pip
    
#### 安装PyPI软件

    pip install SomePackage

    [...]
    Successfully installed SomePackage
    
#### 查看具体安装文件

    pip show --files SomePackage

    Name: SomePackage
    Version: 1.0
    Location: /my/env/lib/pythonx.x/site-packages
    Files:
     ../somepackage/__init__.py
     [...]

#### 查看哪些软件需要更新
  
    pip list --outdated

    SomePackage (Current: 1.0 Latest: 2.0)

#### 升级软件包

    pip install --upgrade SomePackage

    [...]
    Found existing installation: SomePackage 1.0
    Uninstalling SomePackage:
      Successfully uninstalled SomePackage
    Running setup.py install for SomePackage
    Successfully installed SomePackage

#### 卸载软件包

    pip uninstall SomePackage

    Uninstalling SomePackage:
      /my/env/lib/pythonx.x/site-packages/somepackage
    Proceed (y/n)? y
    Successfully uninstalled SomePackage


#### 列出软件包清单

    pip list

    pip list --outdated

#### 查看软件包信息

    pip show pip


#### 搜寻

    pip search pycuda


## ipython 使用
IPython 是一个 python 的交互式 shell，比默认的python shell 好用得多，支持变量自动补全，自动缩进，支持 bash shell 命令，内置了许多很有用的功能和函数。
IPython 是基于BSD 开源的。

IPython 为交互式计算提供了一个丰富的架构，包含:

* 强大的交互式 shell
* Jupyter 内核
* 交互式的数据可视化工具
* 灵活、可嵌入的解释器
* 易于使用，高性能的并行计算工具

#### 安装

windows 

    [下载](https://github.com/ipython/ipython/downloads)ipython 及 pyreadline 
    安装 ipython
    安装pyreadline，解压pyreadline-2.0.zip 到python安装目录下C:\Python27\Lib\site-packages
    进入解压后的目录，执行python setup.py install，等待安装完毕
    
> 默认windows下没有readline模块可用，所以tab的自动补全以及console的颜色样式是“NoColor“。可以[下载](https://pypi.python.org/pypi/pyreadline/2.0) pyreadline包安装，安装方式与IPython相同。    

linux

    pip install ipython

#### Magic
IPython有一些"magic"关键字:

    %Exit, %Pprint, %Quit, %alias, %autocall, %autoindent, %automagic, 
    %bookmark, %cd, %color_info, %colors, %config, %dhist, %dirs, %ed, 
    %edit, %env, %hist, %logoff, %logon, %logstart, %logstate, %lsmagic, 
    %macro, %magic, %p, %page, %pdb, %pdef, %pdoc, %pfile, %pinfo, %popd, 
    %profile, %prun, %psource, %pushd, %pwd, %r, %rehash, %rehashx, %reset, 
    %run, %runlog, %save, %sc, %sx, %system_verbose, %unalias, %who, 
    %who_ls, %whos, %xmode 
IPython 会检查传给它的命令是否包含magic关键字。如果命令是一个magic关键字，IPython就自己来处理。如果不是magic关键字，就交给 Python（标准解释器）去处理。如果automagic打开（默认），你不需要在magic关键字前加%符号。相反，如果automagic是关闭的，则%是必须的。在命令提示符下输入命令magic就会显示所有magic关键字列表以及它们的简短的用法说明。良好的文档对于一个软件的任何一部分来说都是重要的，从在线IPython用户手册到内嵌文档（%magic），IPython当然不会在这方面有所缺失。

## python web 框架
#### Flask

相关资料:  
[Flask 文档](http://docs.jinkan.org/docs/flask/index.html)  
[Python 技巧总结](https://litaotao.github.io/python-materials)  


