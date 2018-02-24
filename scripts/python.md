
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
    
## Python 函数
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

-*- coding: utf-8 -*-
目的是告诉Python解释器，用UTF-8编码读取源代码。

#### pass 语句在函数中的作用

    def mypython():
        pass
    
定义一个函数 mypython，但函数体部分暂时还没有完成，又不能空着不写内容，因此可以用pass来替代占个位置。

#### pass 语句在循环中的作用

    while True:
        pass

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

文档：http://docs.jinkan.org/docs/flask/index.html

