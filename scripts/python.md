
Python 安装

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


## ipython 

[安装](https://github.com/ipython/ipython/downloads)
