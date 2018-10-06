

## vim 使用
   ### [vim 概述](#summary)
     #### [vim 历史](history)
* ### [vim 模式](#mode)
* ### [vim 的 buffer、window 和 tab](#buffer)
* ### [vim 配置](#config)
* ### [vim 命令](#vimcmd)


*** 

## <a id="summary">vim 概述</a>    
在 Linux 的系統中使用文字编辑器来编辑你的 Linux 参数配置文件，是最平常不过的事情了，常常听到的就有： [emacs](http://www.gnu.org/software/emacs/), [pico](https://en.wikipedia.org/wiki/Pico_(text_editor)), [nano](http://sourceforge.net/projects/nano/), [joe](http://sourceforge.net/projects/joe-editor/), 与 [vim](http://www.vim.org) 等等。这些编辑器有什么区别呢？     

* [常见文件编辑器比较](http://encyclopedia.thefreedictionary.com/List+of+text+editors)   

* [维基百科的文本编辑器比较](http://en.wikipedia.org/wiki/Comparison_of_text_editors)    

vi 是古老的文本编辑器，vim是从 vi 发展出来的一个文本编辑器，和Emacs 并列成为类Unix系统 用户最喜欢的编辑器。作为开源世界最重要的编辑器之一，Vim 以其强大的功能和可定制能力被众多开发者所喜爱。因为太强大，所以要用好不容易。

### <a id="history">vim 历史</a>

-- 摘自维基百科
> Vim的第一个版本由Bram Moolenaar 在1991年发布。最初的简称是Vi IMitation ，随着功能的不断增加，正式名称改成了Vi IMproved。现在是在开放源代码 方式下发行的自由软件 。

> Bram Moolenaar 在 80 年代末购入他的 Amiga 计算机时，Amiga 上还没有他最常用的编辑器 vi。Bram 从一个开源的 vi 复制 Stevie 开始，开发了 Vim 的 1.0 版本。最初的目标只是完全复制 vi 的功能，那个时候的 Vim 是Vi IMitation（模拟）的简称。1991 年 Vim 1.14 版被 "Fred Fish Disk #591" 这个 Amiga 用的免费软体集所收录了。1992 年 1.22 版本的 Vim 被移植到了 UNIX 和 MS-DOS 上。从那个时候开始，Vim 的全名就变成 Vi IMproved（改良）了。

> 在这之后，Vim 加入了不计其数的新功能。做为第一个里程碑的是 1994 年的 3.0 版本加入了多视窗编辑模式（分割视窗）。从那之后，同一萤幕可以显示的 Vim 编辑文件数可以不止一个了。1996 年发布的 Vim 4.0 是第一个利用图型介面（GUI ）的版本。1998 年 5.0 版本的 Vim 加入了 highlight（语法高亮 ）功能。2001 年的 Vim 6.0 版本加入了代码折叠 、插件 、 多国语言支持、垂直分割视窗等功能。2006 年 5 月发布的 Vim 7.0 版更加入了拼字检查、上下文相关补全，标签页编辑等新功能。现在最新的版本是 2008 年 8 月发布的 Vim 7.2，该版本合并了 vim 7.1 以来的所有修正补丁，并且加入了脚本的浮点数支持。


Vim 和 TextMate 有很多不同，你常常会遇到它不让你输入，让你抓狂。Vim 有很多不同的模式，在不同的模式下，不同的按键有不同的功能。更让人崩溃的是，大写和小写的功能也天差地别。所以看看：

* [迁移到 Vim 的10个难关](http://blog.jobbole.com/18333/)    

***

## <a id="mode">vim 模式</a>
vim 是一个多模式的编辑器。初学者进入 vim 时，根本不知道怎么使用，很可能甚至不知道该怎么退出它，vim 中的快捷键跟我们平时使用的完全不一样。在我使用 vim 初期，常用的模式就三个：正常模式、插入模式和命令模式，所以就一直认为 vim 就只有三种模式，实际上，vim 的模式有 12 种之多，但常用的就几种，详情可查看 vim 的帮助文档：

     :help vim-modes

 * 正常模式(normal-mode)        
     正常模式一般用于浏览文件，也包括一些复制、粘贴、删除等操作。这时通过[vim 命令](#vimcmd)操作时，一般的键/键组合会被当成功能键，而不会键入对应的字符。初始打开 vim 就是正常模式，在其他模式下，按 ESC 键(有时需要按两下）就可回到正常模式。
 
 * 命令模式(command-mode)    
     在正常模式中，按下:（冒号）键，会进入命令模式。
 
 * 插入模式(insert-mode)      
     在正常模式中按下i, I, a, A等键，会进入插入模式。插入模式下可以向文件中添加内容。
 
 * 可视模式(visual-mode)     
     在正常模式按下v(普通选中), V(按行选中), <Ctrl>+v(按列选中)，可以进入可视模式。
 
 * 选择模式(select mode)
     在可视模式下按 <Ctrl>+g 进入。
 
 * 替换模式(replace-mode)    
     在正常模式按下R(shift+r)开启，此时光标所在的内容会被新输入内容替换。
 
 * 终端模式(Ex mode)   
     在正常模式按下gQ开启 REPL。
     > REPL: 读取-求值-输出”循环（英语：Read-Eval-Print Loop，简称REPL）是一个简单的，交互式的编程环境。

这里只列出了部分模式。

所以，Vim的学习曲线相当的大，如果你一开始看到的是一大堆VIM的命令分类，你一定会对这个编辑器失去兴趣的。因此建议一开始先熟悉一些常用的命令。

* [简明Vim练级攻略](http://blog.jobbole.com/18339/)    

稍微有点熟悉之后，可以渐进式的系统学习。

**vim 相关文档**      

当你发现你对 vim 还是挺感兴趣的，此时可以系统地学习下 vim 的入门知识，可以看看鸟哥的这篇介绍：

* [鳥哥的 Linux 私房菜 -- 第九章、vim 程式編輯器](http://linux.vbird.org/linux_basic/0310vi.php#tips_code)    

挺不错的，讲得还是比较详细，概念也解释的比较清楚。

之后，比较深入一点的，看这篇介绍，包括中英文版。

* [Vim galore](https://github.com/mhinz/vim-galore)    

* [Vim galore 中文](https://github.com/wsdjeg/vim-galore-zh_cn)   

vim 编辑器很强大，而他的强大之处其中一方面是有种类繁多的快捷键，通过快捷键可以进入各种模式，实现各种操作。这些快捷键我们不可能都一一记住，通常，我们只在记住一些常用的罢了。不过好在有专门的 vim 犍位图，需要的时候可以查一下也是挺方便的。

* [史上最全Vim快捷键键位图 -- 入门到进阶](http://cenalulu.github.io/linux/all-vim-cheatsheat/)     

那么，为什么 Vim 使用 HJKL 键作为方向键呢？

* [为什么 Vim 使用 HJKL 键作为方向键](http://blog.jobbole.com/18650/)    

*** 

## <a id="buffer">vim 的 buffer、window 和 tab</a>
查看帮助文件，是这样描述的：

     缓冲区是内存中的文件文本。
     窗口是缓冲区的视窗。
     标签页是窗口的集合

在 vim 中，可以将 buffer 看成是打开文件的实例。一个文件只有一个 buffer。
查看 buffer 的命令：

     :ls
       1 %a   ".vimrc"                       line 20
       2   =  ".viminfo"                     line 30
       3 # =  "/etc/vimrc"                   line 71
左侧是buffer的编号，有%的表示是当前激活的window中打开的buffer，a表示这个buffer是active的，双引号中的字符串表示了buffer对应的文件名字，line n表示当前cursor处于该buffer的哪一行，# 代表的是编辑前一次编辑的文档。

使用:buffer(:b)命令切换buffer

     :b 2


window 可以看成是 buffer 的 viewport。一个 buffer 可以有多个 window。在不同的window中编辑同一个文件的buffer，并且在一个window中对文件进行编辑，修改会同步体现在另外的window中。

分割窗口的命令：

     :sp（水平分割）
     :vsp（垂直分割）

在window之间切换可以使用Ctrl + w + h/j/k/l（向左、下、上、右切换）或者Ctrl + w + w（在窗口间切换）。    
如果要调整window的大小，分窗口是水平分隔还是垂直分隔两种情况： 
     * 如果是水平分隔可以使用:nwinc +/-把当前激活窗口高度增加、减少n个字符高度，比如:10winc + 
     * 如果是垂直分隔可以使用:nwinc >/<把当前激活窗口宽度增加、减少n个字符宽度，比如:5winc >

tab 是 window 的集合，tab的标题栏会显示该tab当前激活的window中文件的名字，及tab中一共有多少个window。。在新的 tab 中打开文件:

     :tabe app.js
     
查看 tab 列表：

     ：tabs
     Tab page 1
         react01.html
         circle.js
         app.js
     Tab page 2
     >   app.js     
'>' 表示cursor当前在tab 2的app.js上，使用1gt即可快速切换到tab 1。   
在 tab 间切换命令：

     :tabnext
     :tabpre
     gt
     gT
可以使用:tabc命令关闭当前tab。

* [Buffers, windows, and tabs](https://sanctum.geek.nz/arabesque/buffers-windows-tabs/)   

****

## <a id="config">vim 配置</a>
vim 的全局配置文件是： /etc/vimrc，用户的配置文件为 ~/.vimrc， 如果不存在，就手动创建一个，平常我们只需配置这个文件就可以了。 配置完成后想要立刻生效，执行以下命令：
    
    :source ~/.vimrc
> 注意命令前面的冒号，是在vim的命令模式下执行的，不是在linux命令行下执行。
  
vim 常用设置参数

    "显示行号
    set nu

    "启动时隐去援助提示
    set shortmess=atI

    "语法高亮
    syntax on

    "使用vim的键盘模式
    "set nocompatible

    "不需要备份
    set nobackup

    "没有保存或文件只读时弹出确认
    set confirm

    "鼠标可用
    set mouse=a

shiftwidth:指定在进行缩进格式化源码时制表符占据的空格数。     
tabstop:指定我们在插入模式下输入一个制表符占据的空格数量，linux 内核编码规范建议是 8。       
softtabstop:如何处理连续多个空格。      
expandtab: 是否将tab转换为空格。         
autoindent：自动缩进。     
     
    "tab缩进
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab

    "文件自动检测外部更改
    set autoread

    "c文件自动缩进
    set cindent

    "自动对齐
    set autoindent

    "智能缩进
    set smartindent

    "高亮查找匹配
    set hlsearch

    "背景色
    set background=dark

    "显示匹配
    set showmatch

    "显示标尺，就是在右下角显示光标位置
    set ruler

    "去除vi的一致性
    set nocompatible

    "允许折叠
    set foldenable
    """""""""""""""""设置折叠"""""""""""""""""""""
    "
    "根据语法折叠
    set fdm=syntax

    "手动折叠
    "set fdm=manual

    "设置键盘映射，通过空格设置折叠
    nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
    """"""""""""""""""""""""""""""""""""""""""""""
    "不要闪烁
    set novisualbell

    "启动显示状态行
    set laststatus=2

    "浅色显示当前行
    autocmd InsertLeave * se nocul

    "用浅色高亮当前行
    autocmd InsertEnter * se cul

    "显示输入的命令
    set showcmd

    "被分割窗口之间显示空白
    set fillchars=vert:/

    set fillchars=stl:/

    set fillchars=stlnc:/

paste：粘贴模式，会取消所有上述选项的影响来保证后面的操作。通常是从剪贴板粘贴代码——保持原有代码的风格，使用 nopaste 取消设置。

     :set paste
     :set nopaste


**代码折叠**     
vim 自身支持多种折叠：
* 手动建立折叠（manual）
* 基于缩进进行折叠（indent）
* 基于语法进行折叠（syntax）
* 未更改文本构成折叠（diff）

配置

     " 启动 vim 时关闭折叠代码
     set nofoldenable
     " 基于缩进进行代码折叠
     set foldmethod=indent
     " 基于语法进行代码折叠
     set foldmethod=syntax
     
在 .vimrc 文件中配置好后，用以下命令操作：
     * za 打开或关闭当前折叠
     * zM 关闭所有折叠
     * zR 打开所有折叠

***

## <a id="vimcmd"><font color="red">vim 命令</font></a>
我们常说的命令通常是指在正常模式下的操作。

技术链接：  
[Vim命令合集](http://www.cnblogs.com/softwaretesting/archive/2011/07/12/2104435.html)     
[一些不起眼但非常有用的 Vim 命令](http://blog.jobbole.com/84683/)   


以:和/开头的命令都有历史纪录，可以首先键入:或/然后按上下箭头来选择某个历史命令。

### 文件命令
打开文件

    vim file 打开单个文件
    vim file1 file2 file3 ... 同时打开多个文件
    vim file +10 打开文件并跳转到指定行
    :open file 在vim窗口中打开一个新文件
    :split file 在水平分割的窗口中打开文件
    :vsplit file 在垂直分割的窗口中打开文件
    :bn 切换到下一个文件
    :bp 切换到上一个文件
    
在进入 vim 里打开另一个文件

     ：e file
   
插入另一个文件的全部内容

    打开文件b.txt，将光标定位到要复制插入的位置，然后进入命令模式中输入：
    :r!cat a.txt
插入另一个文件的部分内容

    打开一个文件a.txt,复制n+1行:
        "ayn+1
    然后敲命令转到文件b.txt:
        :ex b.txt
    敲命令:
        "ap


### 插入命令

    i 在当前位置生前插入
    a 在当前位置后插入
    I 在当前行首插入
    A 在当前行尾插入
    o 在当前行之后插入一行
    O 在当前行之前插入一行

查看当前打开的文件列表，当前正在编辑的文件会用[]括起来。

:args

### 移动命令
> 在Vim中，很多命令都可以配合数字使用，比如删除10个字符10x，在当前位置后插入3个！，3a！<Esc>，这里的Esc是必须的，否则命令不生效。

    h 左移一个字符
    l 右移一个字符
    k 上移一个字符
    j 下移一个字符
> 以上四个命令可以配合数字使用，比如20j就是向下移动20行，5h就是向左移动5个字符。

    w 向前移动一个单词, 光标停在单词首部
    b 向后移动一个单词, 光标停在单词首部
    e 向前移动一个单词，光标停在单词尾部
    ge 向后移动一个单词，光标停在单词尾部
    
    ^ 移动到本行第一个非空白字符上。
    0 移动到本行第一个字符上，
    <HOME> 移动到本行第一个字符。同0健。
    $ 移动到行尾 
    3$ 移动到下面3行的行尾
    
    gg 移动到文件头。([[)
    G 移动到文件尾。 (]])
> f（find）命令也可以用于移动，fx将找到光标后第一个为x的字符，3fd将找到第三个为d的字符。F 同f，反向查找。

    :n 跳到指定行
    nG 跳到指定行

    Ctrl + e 向下滚动一行
    Ctrl + y 向上滚动一行
    Ctrl + d 向下滚动半屏
    Ctrl + u 向上滚动半屏
    Ctrl + f 向下滚动一屏
    Ctrl + b 向上滚动一屏

### 删除命令

        x： 删除当前字符
        nx： 删除当前光标开始向后 n 个字符
        X： 删除当前字符的前一个字符    
        D： 删除当前字符至行尾。

        dl： 删除当前字符 (dl=x)
        dh： 删除前一个字符 (dh=X)
        d$：删除当前字符至行尾(d$=D)

        dd： 删除当前行
        dj： 删除本行及下一行
        dk： 删除本行及上一行

        10d： 删除当前行及下面的10行。

        kdgg： 删除当前行之前所有行（不包括当前行）
        jdG：删除当前行之后所有行（不包括当前行）

        :1,10d 删除1-10行
        :11,$d 删除11行及以后所有的行
        :1,$d 删除所有行

        J: 删除两行之间的空行，实际上是合并两行。


### 拷贝和粘贴

        yy(Y) 拷贝当前行
        nyy 拷贝当前后开始的n行，比如2yy拷贝当前行及其下一行。
        y^ 复制至行首，或y0。不含游标所在处字元。 
        y$ 复制至行尾。含游标所在处字元。 
        yw 复制一个word。 
        y2w 复制两个字（单词）。 
        yG 复制至档尾。 
        y1G 复制至档首。   
        "14yl 从光标处开始复制光标后的 4 个字符。（"110yl 后面10个字符，指定粘贴板为"1 引号不能少）
        "14yh 从光标处开始复制光标前的 4 个字符。
        "1v 进入visual方式，然后就可以移动方向键选中文本，然后按y，就拷贝完成至指定粘贴板
        p  在当前光标后粘贴,如果之前使用了yy命令来复制一行，那么就在当前行的下一行粘贴。
        shift+p 在当前行前粘贴

        :1,10 co 20 将1-10行拷贝到第20行之后。
        :1,$ co $ 将整个文件复制一份并添加到文件尾部。

        ddp交换当前行和其下一行
        xp交换当前字符和其后一个字符

> 正常模式下按v（逐字）或V（逐行）进入可视模式，然后用jklh命令移动即可选择某些行或字符，再按y即可复制

小技巧

     %（跳转到与之匹配的括号处）
     .（重复上次的修改命令）
     `.（跳转到最近修改过的位置）
     ZQ（无条件退出）
     ZZ（存盘退出）
     ga（显示光标下的字符在当前使用的 encoding 下的内码）
     guw（光标下的单词变为小写）
     gUw（光标下的单词变为大写）
     :TOhtml（根据 Vim 的语法加亮的方式生成 HTML 代码；在图形界面中也可以使用菜单“Syntax—Convert to HTML”达到同样效果


## 撤销和重做

    u 撤销（Undo）
    U 撤销对整行的操作
    Ctrl + r 重做（Redo），即撤销的撤销。
    

## 退出命令

    :wq 保存并退出
    :x 同wq
    ZZ 保存并退出
    :q! 强制退出并忽略所有更改
    :e! 放弃所有修改，并打开原来文件。


## 其他
#### 基本计算器
插入模式下，按 Ctrl+r 键然后输入 =，再输入一个简单的算式(如：=2+3)，再按 Enter 键计算结果会被插入到文件中。

#### 缩写
:ab [缩写] [要替换的文字]

    ab asap as soon as possible

#### 忘记用 root 方式打开文件时的文件保存

    :w !sudo tee %
    
#### 实时加密文本

    ggVGg?
撤销命令：u

#### 自动补全

    Ctrl+n

#### set 命令

    set autoindent  在插入模式下，对每行按与上行同样的标准进行缩进，与shiftwidth选项结合使用
    set list  把制表符显示为^I ,用$标示行尾（使用list分辨尾部的字符是tab还是空格）
    set number  显示行号
    set readonly  文件只读，除非使用！可写
    set shiftwidth  反向制表符中的空格数目
    set showmatch  在vi中输入），}时，光标会暂时的回到相匹配的（，{   （如果没有相匹配的就发出错误信息的铃声），编程时很有用
    set tabstop  指定tab缩进的字符数目
    set wrapscan  授索在文件的两端绕回
    set 显示设置的所有选项
    set all 显示所有可以设置的选项


> set 设置可以在命令行输入，也可以写在$HOME下的.exrc (如果是vi)或者.vimrc(如果是vim)中。写进去很方便的。

cit 命令    
在用vim编辑html和xml时经常使用 cit 操作来删除一对标签内的文字    


## 替换
vi/vim 中可以使用 :s 命令来替换字符串

    :s/vivian/sky/ 替换当前行第一个 vivian 为 sky
    :s/vivian/sky/g 替换当前行所有 vivian 为 sky
    :n,$s/vivian/sky/ 替换第 n 行开始到最后一行中每一行的第一个 vivian 为 sky
    :n,$s/vivian/sky/g 替换第 n 行开始到最后一行中每一行所有 vivian 为 sky(n 为数字，若 n 为 .，表示从当前行开始到最后一行)
    :%s/vivian/sky/（等同于 :g/vivian/s//sky/） 替换每一行的第一个 vivian 为 sky
    :%s/vivian/sky/g（等同于 :g/vivian/s//sky/g） 替换每一行中所有 vivian 为 sky

可以使用 # 作为分隔符，此时中间出现的 / 不会作为分隔符

    :s#vivian/#sky/# 替换当前行第一个 vivian/ 为 sky/
    :%s+/oradata/apras/+/user01/apras1+ （使用+ 来 替换 / ）： /oradata/apras/替换成/user01/apras1/

#### 替换单个字符

    将光标移到要替换的字符上：
    rx x为要替换后的字符
    
## 注释

    3,5 s/^/#/g 注释第3-5行
    3,5 s/^#//g 解除3-5行的注释
    1,$ s/^/#/g 注释整个文档。
    :%s/^/#/g 注释整个文档，此法更快。



#### 常用命令
     %	跳转到配对的括号去
     [[	跳转到代码块的开头去(但要求代码块中'{'必须单独占一行)
     gD	跳转到局部变量的定义处
     ''	跳转到光标上次停靠的地方, 是两个', 而不是一个"
     mx	设置书签,x只能是a-z的26个字母
     `x	跳转到书签处("`"是1左边的键)
     >	增加缩进,"x>"表示增加以下x行的缩进
     <	减少缩进,"x<"表示减少以下x行的缩进

#### 批量缩进

* 按下 v 键进入可视模式，选中要缩进的代码：       

          按下 n< 向前缩进
          按下 n> 向后缩进

* 在正常模式下：

          n << 键向前缩进从当前起及之后的n-1行
          n >> 键向后缩进从当前起及之后的n-1行
> n 表示要缩进的次数，缩进一次可以省略。

* 命令行模式下：

          m,n> m 到 n 行缩进
          m>n m行开始的n 行缩进一次

***

## 模式行（modeline）
vim 的 modeline 可以让你针对每个文件进行文件级别的设置，这些设置是覆盖当前用户的 vimrc 中的设置的。当 vim 打开一个包含了vim modeline 注释行的文件时，会自动读取这一行的参数配置并调整自己的设置到这个配置。vim 默认关闭modeline，开启的话需要在你的home下的.vimrc文件中增加一行：

     set modeline

在文件的首行/尾行（必须），写一行当前这个文件里面语言所支持的注释，例如写shell就是#，写Python就是#，写php就//或/\*\*/，然后在里面加上 modeline 识别的固定格式，举例：

     # vim: set expandtab ts=4 sts=4 sw=4 : 

上面的注释中，'#'后面、"vim:"前面的空格是必须的，结尾的':'也是必须的，这些是modeline所识别的。中间就是熟悉的vimrc中的设置了。在不同的语言中，注释的语法也不一样，所有在其他语言中可能有不同写法。

在文件里面，可以用该文件标准的注解形式向 vim 下指令。譬如一个 reStructuredText 格式的文字档，你可以加上以下的 modeline，让 vim 在读它的时候自动把档案解释为 rst (以取得正确的语法高亮)：

     .. vim: set ft=rst:
modeline 里可以放的指令不限一个，所以我.py 档案在档尾都有这麽一行的 modeline

     # vim: set ai et nu sw=4 ts=4 tw=79:

### 执行外部命令
执行外部命令的方法

     :!命令
把外部命令执行的结果插入到当前编辑的缓冲区中

     :r!命令
对所有的非空行进行编号，只需要

     :%!nl

对包含空行的所有行进行编号

     :%!nl -ba



***

## vim 寄存器
通过下面命令显示所有寄存器内容：

:reg
其中注意两个特殊的寄存器：”* 和 “+。这两个寄存器是和系统相通的，前者关联系统选择缓冲区，后者关联系统剪切板。通过它们可以和其他程序进行数据交换。
若寄存器列表里无”* 或 “+ 寄存器，则可能是由于没有安装vim的图形界面所致。Debian/Ubuntu下可以通过安装vim-gnome解决。

    $ sudo apt-get install vim-gnome

**晋级**         
[Vim 使用进阶：10 种寄存器剖析](http://www.codebelief.com/article/2017/03/vim-advanced-usage-10-registers-analysis/)    
[Vim 复制粘贴探秘](http://www.cnblogs.com/jianyungsun/archive/2011/03/19/1988855.html)   

### [vim 复制](http://www.cnblogs.com/hustcat/articles/1791371.html)        
* vim 常用的粘贴板有"、0、1、2、3、4、5、6、7、8、9、-、.、:、%、/，用 :reg 命令可以查看各个粘贴板里的内容；
* 在vim中简单用y只是复制到“（双引号)和0粘贴板里，同样用p粘贴的也是这个粘贴板里的内容；
* 要将vim的内容复制到某个粘贴板，需要退出编辑模式，进入正常模式后，选择要复制的内容，然后按"Ny（注意带引号）完成复制，其中N为粘贴板号(注意是按一下双引号然后按粘贴板号最后按y)，例如要把内容复制到粘贴板2，选中内容后按"2y就可以了。
> 有两点需要说明一下：    
    1， “号粘贴板（临时粘贴板）比较特殊，直接按y就复制到这个粘贴板中了，直接按p就粘贴这个粘贴板中的内容；      
    2， +号粘贴板是系统粘贴板，用"+y将内容复制到该粘贴板后可以使用Ctrl＋V将其粘贴到其他文档（如firefox、gedit）中，同理，要把在其他地方用Ctrl＋C或右键复制的内容复制到vim中，需要在正常模式下按"+p；

***

## 映射
map是一个映射命令,将常用的很长的命令映射到一个新的功能键上。

map的格式：

    map <要映射键> <被映射的按键序列>
比如 map T :q!后，则在命令模式下按T并按回车，就会退出vim
vmap 和 map类似，二者的区别在于前者用于所谓的Visual模式，后者用于通常的命令模式。 

    映射:map <F2> ggvG
    解除映射:unmap <F2>
    清除所有映射:mapclear
    在光标后面插入当前日期和时间:map <F2> a<C-R>=strftime("%c")<CR><Esc>
    
[vim的几种模式和按键映射](http://www.cnblogs.com/my_life/articles/3261873.html) 

每一个*map系列的命令都有个对应的*noremap命令，包括：noremap/nnoremap、 vnoremap和inoremap。这些命令将不递归解释映射的内容。

各类 vim 插件帮助文档中经常出现 <leader>，即前缀键，缓解了快捷键引起冲突的问题。
     
     " 定义快捷键的前缀，即<Leader>
     let mapleader=";"
     
常用操作设定成快捷键，提升效率：

     " 定义快捷键到行首和行尾
     nmap LB 0
     nmap LE $
     " 设置快捷键将选中文本块复制至系统剪贴板
     vnoremap <Leader>y "+y
     " 设置快捷键将系统剪贴板内容粘贴至 vim
     nmap <Leader>p "+p
     " 定义快捷键关闭当前分割窗口
     nmap <Leader>q :q<CR>
     " 定义快捷键保存当前窗口内容
     nmap <Leader>w :w<CR>
     " 定义快捷键保存所有窗口内容并退出 vim
     nmap <Leader>WQ :wa<CR>:q<CR>
     " 不做任何保存，直接退出 vim
     nmap <Leader>Q :qa!<CR>
     " 依次遍历子窗口
     nnoremap nw <C-W><C-W>
     " 跳转至右方的窗口
     nnoremap <Leader>lw <C-W>l
     " 跳转至左方的窗口
     nnoremap <Leader>hw <C-W>h
     " 跳转至上方的子窗口
     nnoremap <Leader>kw <C-W>k
     " 跳转至下方的子窗口
     nnoremap <Leader>jw <C-W>j
     " 定义快捷键在结对符之间跳转
     nmap <Leader>M %

vimrc 修改后立即生效

     " 让配置变更立即生效
     autocmd BufWritePost $MYVIMRC source $MYVIMRC

***

工欲善其事，必先利其器。
VIM 插件一般安装在 5 个地方， 存放插件的路径都列在“runtimepath”选项中， 我们可以使用 set 命令查看它：

     :set runtimepath?

## vim 插件
相比sublime text2等现代编辑器，Vim缺乏默认的插件管理器，所有插件的文件都散布在~/.vim下的几个文件夹中。不过可以通过安装插件管理工具来管理插件，用户需要做的只是去Github上找到自己想要的插件的名字，安装，更新就可以用了。

相关链接：    
[Setting up Vim for React.js](https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015)    

常用的 vim 插件管理工具：

* pathogen       

pathogen 插件的安装：       
[Vim下的插件管理工具pathogen简介](https://www.cnblogs.com/litifeng/p/5597565.html) 


* vunble       

安装：     

     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

常用命令：    

      :PluginList       - lists configured plugins
      :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
      :PluginSearch foo - searches for foo; append `!` to refresh local cache
      :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


### 常用插件
* [NERD Tree](https://github.com/scrooloose/nerdtree)是一个树形目录插件，方便浏览当前目录有哪些目录和文件。   

常用快捷键来操作目录：

    通过hjkl来移动光标
    o打开关闭文件或目录，如果想打开文件，必须光标移动到文件名
    t在标签页中打开
    s和i可以水平或纵向分割窗口打开文件
    p到上层目录
    P到根目录
    K到同目录第一个节点
    P到同目录最后一个节点??

* [Vim Powerline](https://github.com/powerline/powerline/tree/master)是一个显示vim状态栏插件，它能够显示vim模式、操作环境、编码格式、行数/列数等信息。使用时注意切换分支。     

* [Indent Guides](https://github.com/nathanaelkane/vim-indent-guides) 多层缩进    
安装好后作以下配置

     " 随 vim 自启动
     let g:indent_guides_enable_on_vim_startup=1
     " 从第二层开始可视化显示缩进
     let g:indent_guides_start_level=2
     " 色块宽度
     let g:indent_guides_guide_size=1
     " 快捷键 i 开/关缩进可视化
     :nmap <silent> <Leader>i <Plug>IndentGuidesToggle

* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)注释插件
默认配置了一些快捷键

     <leader>cc，注释当前选中文本，如果选中的是整行则在每行首添加 //，如果选中一行的部分内容则在选中部分前后添加分别 /、/；
     <leader>cu，取消选中文本块的注释

***

在 .vimrc 文件中，使用的语言就是 Vim 脚本语言(vim script)。vim 脚本相当于可直接在命令模式下执行的命令，只是不需要输入前面的冒号（如果用了冒号也不会出错）。因此，像设置选项、创建键盘映射这样的命令是直接可用的。当然，作为一种脚本语言，除了普通键盘上会输入的命令外，我们还需要一些更复杂的功能，特别是：变量，表达式，条件和循环语句，函数。

## vimscript
Vim的脚本语言被称为Vimscript，是典型的动态式命令语言，提供一些常用的语言特征：变量、表达式、控制结构、内置函数、用户自定义函数、一级字符串、列表、字典、终端、文件IO、正则表达式模式匹配、异常和集成调试器等。

#### vimscript 命令
* :echo命令 会打印输出，但是一旦你的脚本运行完毕，那些输出信息就会消失。使用:echom打印的信息 会保存下来，你可以执行:messages命令再次查看那些信息。

          :echo $MYVIMRC  查询 vimrc 文件的位置

* 添加一个!（感叹号）至布尔选项后面就会切换对于选项的值。

          :set number!

* 使用一个?符号向Vim获取一个选项的当前值。

          :set number
          :set number?
          :set nonumber
          :set number?

* numberwidth 选项改变行号的列宽。
* viw 将高亮选中整个单词。

**vimscript 语法速览**         
[Five Minute Vimscript](http://andrewscala.com/vimscript/)    
[Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)    
[Learn Vimscript the Hard Way中文版](http://learnvimscriptthehardway.onefloweroneworld.com/)    

**Vim’s internal documentation**      
[Vim documentation: usr_41](http://vimdoc.sourceforge.net/htmldoc/usr_41.html)    

**IBM Scripting the Vim editor series**      
[Part 1: Variables, values, and expressions](https://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html)    
[Part 2: User-defined functions](https://www.ibm.com/developerworks/linux/library/l-vim-script-2/index.html?ca=drs-)    
[Part 3: Built-in lists](https://www.ibm.com/developerworks/linux/library/l-vim-script-3/index.html?ca=drs-)    
[Part 4: Dictionaries](https://www.ibm.com/developerworks/linux/library/l-vim-script-4/index.html?ca=drs-)    
[Part 5: Event-driven scripting and automation](https://www.ibm.com/developerworks/linux/library/l-vim-script-5/index.html?ca=drs-)    

***

环境变量 $VIMRUNTIME 用来找出各种支持文件。colors,plugins,docs都是在 VIMRUNTIME 目录下的。可以使用以下命令查看：

     :echo $VIMRUNTIME


## vim 主题
vim 的颜色主题在 $VIMRUNTIME/colors 文件夹里。在正常模式下输入

     : colorscheme
查看当前的配色方案。
修改主题使用命令

     ：colorscheme mycolor
其中 mycolor 是你 $VIMRUNTIME/colors 文件夹包含的文件名。也可以把这个命令写入~/.vimrc配置文件中，这样每次打开Vim都是你设定的主题。

或者也可以在.vimrc中添加一句：

     set runtimepath+=~/.vim
将用户目录加入到运行时路径中。

**常用的主题插件**
收藏了几个不同的主题插件。

* [vim-airline](https://github.com/vim-airline/vim-airline)    
Lean & mean status/tabline for vim that's light as air.

          Plug 'vim-airline/vim-airline'
          Plug 'vim-airline/vim-airline-themes'

* [gruvbox](https://github.com/morhetz/gruvbox)     
[安装](https://github.com/morhetz/gruvbox/wiki/Installation)及配置：    

          Plug 'morhetz/gruvbox'
          colorscheme gruvbox
          set background=dark    " Setting dark mode
          set background=light   " Setting light mode

注： 安装插件管理工具是 vim-plug。

还有一些其他不错的主题插件值得关注：

  [收集漂亮的 Vim 主题](https://zhuanlan.zhihu.com/p/34699085)     
  
  
  
 
## vim7 升级 vim8

安装依赖

     yum install libXt-devel gtk2-devel
     yum -y install python-devel ruby ruby-devel perl perl-devel perl-ExtUtils-Embed
     yum install ncurses-devel
     yum install ctags

下载源码并编译安装

     ./configure --disable-selinux --enable-perlinterp=yes --enable-python3interp=yes --enable-rubyinterp=yes --enable-cscope --enable-gui=auto --with-features=huge --enable-multibyte --enable-xim --with-x --with-gnome --with-compiledby="tang" --prefix=/usr/local/vim8
     make
     make install
