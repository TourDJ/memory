
# vim 使用
在 Linux 的系統中使用文字编辑器来编辑你的 Linux 参数配置文件，常常听到的就有： [emacs](http://www.gnu.org/software/emacs/), [pico](https://en.wikipedia.org/wiki/Pico_(text_editor)), [nano](http://sourceforge.net/projects/nano/), [joe](http://sourceforge.net/projects/joe-editor/), 与 [vim](http://www.vim.org) 等等。这些编辑器有什么区别呢？     

* [常见文件编辑器比较](http://encyclopedia.thefreedictionary.com/List+of+text+editors)   

* [维基百科的文本编辑器比较](http://en.wikipedia.org/wiki/Comparison_of_text_editors)    

vi 是古老的文本编辑器，vim是从 vi 发展出来的一个文本编辑器，和Emacs 并列成为类Unix系统 用户最喜欢的编辑器。作为开源世界最重要的编辑器之一，Vim 以其强大的功能和可定制能力被众多开发者所喜爱。因为太强大，所以要用好不容易。

**vim 历史**   

-- 摘自维基百科
> Vim的第一个版本由Bram Moolenaar 在1991年发布。最初的简称是Vi IMitation ，随着功能的不断增加，正式名称改成了Vi IMproved。现在是在开放源代码 方式下发行的自由软件 。

> Bram Moolenaar 在 80 年代末购入他的 Amiga 计算机时，Amiga 上还没有他最常用的编辑器 vi。Bram 从一个开源的 vi 复制 Stevie 开始，开发了 Vim 的 1.0 版本。最初的目标只是完全复制 vi 的功能，那个时候的 Vim 是Vi IMitation（模拟）的简称。1991 年 Vim 1.14 版被 "Fred Fish Disk #591" 这个 Amiga 用的免费软体集所收录了。1992 年 1.22 版本的 Vim 被移植到了 UNIX 和 MS-DOS 上。从那个时候开始，Vim 的全名就变成 Vi IMproved（改良）了。

> 在这之后，Vim 加入了不计其数的新功能。做为第一个里程碑的是 1994 年的 3.0 版本加入了多视窗编辑模式（分割视窗）。从那之后，同一萤幕可以显示的 Vim 编辑文件数可以不止一个了。1996 年发布的 Vim 4.0 是第一个利用图型介面（GUI ）的版本。1998 年 5.0 版本的 Vim 加入了 highlight（语法高亮 ）功能。2001 年的 Vim 6.0 版本加入了代码折叠 、插件 、 多国语言支持、垂直分割视窗等功能。2006 年 5 月发布的 Vim 7.0 版更加入了拼字检查、上下文相关补全，标签页编辑等新功能。现在最新的版本是 2008 年 8 月发布的 Vim 7.2，该版本合并了 vim 7.1 以来的所有修正补丁，并且加入了脚本的浮点数支持。


vim 相关文档
vim 的入门系统的学习，可以看看鸟哥的这篇介绍：

* [鳥哥的 Linux 私房菜 -- 第九章、vim 程式編輯器](http://linux.vbird.org/linux_basic/0310vi.php#tips_code)    

挺不错的，讲得还是比较详细，概念也解释的比较清楚。

比较深入一点的，看这篇介绍，包括中英文版。
* [Vim galore](https://github.com/mhinz/vim-galore)    

* [Vim galore 中文](https://github.com/wsdjeg/vim-galore-zh_cn)   

## vim 模式
 * 正常模式(normal-mode)        
     正常模式一般用于浏览文件，也包括一些复制、粘贴、删除等操作。这时通过[vim 命令](#vimcmd)操作时，一般的键/键组合会被当成功能键，而不会键入对应的字符。初始打开 vim 就是正常模式，在其他模式下，按 ESC 键(有时需要按两下）就可回到正常模式。
 
 * 命令模式(command-mode)    
     在正常模式中，按下:（冒号）键，会进入命令模式。
 
 * 插入模式(insert-mode)      
     在正常模式中按下i, I, a, A等键，会进入插入模式。插入模式下可以向文件中添加内容。
 
 * 可视模式(visual-mode)     
     在正常模式按下v(普通选中), V(按行选中), <Ctrl>+v(按列选中)，可以进入可视模式。
 
 * 插入模式(select mode)
     在可视模式下按 <Ctrl>+g 进入。
 
 * 替换模式(replace-mode)    
     在正常模式按下R(shift+r)开启，此时光标所在的内容会被新输入内容替换。
 
 * 终端模式(Ex mode)   
     在正常模式按下gQ开启 REPL。
     > REPL: 读取-求值-输出”循环（英语：Read-Eval-Print Loop，简称REPL）是一个简单的，交互式的编程环境。

## vim 配置
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

    "tab缩进
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
> shiftwidth:用于程序中自动缩进所使用的空白长度指示的。一般来说为了保持程序的美观，和下面的参数最好一致。同时它也是符号移位长度的制定者。
tabstop:定义tab所等同的空格长度，一般来说最好设置成8，因为如果是其它值的话，可能引起文件在打印之类的场合中看起来很别扭。除非你设置了expandtab模式，也就是把tabs转换成空格，这样的话就不会一起混淆，不过毕竟制表符为8是最常用最普遍的设置，所以一般还是不要改。
softtabstop:?
expandtab: 是否将tab转换为空格（主要是防止不同的用户不同的tab设置导致文档缩进格式发生变化)。

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
## <a id="vimcmd"><font color="red">Vim 命令</font></a>

技术链接：  
[Vim命令合集](http://www.cnblogs.com/softwaretesting/archive/2011/07/12/2104435.html)     
[一些不起眼但非常有用的 Vim 命令](http://blog.jobbole.com/84683/)  
[简明Vim练级攻略](http://blog.jobbole.com/18339/)     
[Vim 实用技术，第 1 部分: 实用技巧](http://blog.jobbole.com/20604/)     


以:和/开头的命令都有历史纪录，可以首先键入:或/然后按上下箭头来选择某个历史命令。

### 文件命令
#### 打开文件
    vim file 打开单个文件
    vim file1 file2 file3 ... 同时打开多个文件
    vim file +10 打开文件并跳转到指定行
    :open file 在vim窗口中打开一个新文件
    :split file 在新窗口中打开文件
    :bn 切换到下一个文件
    :bp 切换到上一个文件
   
#### 在文件中插入另一个文件中的内容
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


## 插入命令

    i 在当前位置生前插入
    a 在当前位置后插入
    I 在当前行首插入
    A 在当前行尾插入
    o 在当前行之后插入一行
    O 在当前行之前插入一行

查看当前打开的文件列表，当前正在编辑的文件会用[]括起来。

:args

## 移动命令
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

## 删除命令

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


## 拷贝和粘贴

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

## 执行外部命令
执行外部命令的方法

     :!命令
把外部命令执行的结果插入到当前编辑的缓冲区中

     :r!命令
对所有的非空行进行编号，只需要

     :%!nl

对包含空行的所有行进行编号

     :%!nl -ba


## [vim 复制](http://www.cnblogs.com/hustcat/articles/1791371.html)        
* vim 常用的粘贴板有"、0、1、2、3、4、5、6、7、8、9、-、.、:、%、/，用 :reg 命令可以查看各个粘贴板里的内容；
* 在vim中简单用y只是复制到“（双引号)和0粘贴板里，同样用p粘贴的也是这个粘贴板里的内容；
* 要将vim的内容复制到某个粘贴板，需要退出编辑模式，进入正常模式后，选择要复制的内容，然后按"Ny（注意带引号）完成复制，其中N为粘贴板号(注意是按一下双引号然后按粘贴板号最后按y)，例如要把内容复制到粘贴板2，选中内容后按"2y就可以了。
> 有两点需要说明一下：    
    1， “号粘贴板（临时粘贴板）比较特殊，直接按y就复制到这个粘贴板中了，直接按p就粘贴这个粘贴板中的内容；      
    2， +号粘贴板是系统粘贴板，用"+y将内容复制到该粘贴板后可以使用Ctrl＋V将其粘贴到其他文档（如firefox、gedit）中，同理，要把在其他地方用Ctrl＋C或右键复制的内容复制到vim中，需要在正常模式下按"+p；

## vim 寄存器
通过下面命令显示所有寄存器内容：

:reg
其中注意两个特殊的寄存器：”* 和 “+。这两个寄存器是和系统相通的，前者关联系统选择缓冲区，后者关联系统剪切板。通过它们可以和其他程序进行数据交换。
若寄存器列表里无”* 或 “+ 寄存器，则可能是由于没有安装vim的图形界面所致。Debian/Ubuntu下可以通过安装vim-gnome解决。

    $ sudo apt-get install vim-gnome

**晋级**         
[Vim 使用进阶：10 种寄存器剖析](http://www.codebelief.com/article/2017/03/vim-advanced-usage-10-registers-analysis/)    
[Vim 复制粘贴探秘](http://www.cnblogs.com/jianyungsun/archive/2011/03/19/1988855.html)   


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

在在结对符之间跳转： %

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

## vim 插件管理工具

相关链接：    
[Setting up Vim for React.js](https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015)    

### vim-plug
安装方法：

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


使用方法：
在 vim 配置文件中增加 vim-plug 配置：

    call plug#begin('~/.vim/plugged')   
    Plug 'pangloss/vim-javascript'      ## List the plugins with Plug commands
    call plug#end()
> 在 .vim 文件夹下创建 plugged 文件夹，如果不存在。

配置完成后，输入 vim 命令,启动文本编辑器：

    $ vim

查看状态类型类型：

    ：PlugStatus

安装 vim-javascript 插件：

    ：PlugInstall

#### 常用命令
在 vim 命令模式下使用。

    :PlugInstall     install                      安装插件
    :PlugUpdate      install or update            更新插件
    :PlugClean       remove plugin not in list    删除本地无用插件
    :PlugUpgrade     Upgrade vim-plug itself      升级本身
    :PlugStatus      Check the status of plugins  查看插件状态

示例：

    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')

    " Make sure you use single quotes

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    Plug 'junegunn/vim-easy-align'

    " Any valid git URL is allowed
    Plug 'https://github.com/junegunn/vim-github-dashboard.git'

    " Multiple Plug commands can be written in a single line using | separators
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

    " Using a non-master branch
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

    " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    Plug 'fatih/vim-go', { 'tag': '*' }

    " Plugin options
    Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Unmanaged plugin (manually installed and updated)
    Plug '~/my-prototype-plugin'

    " Initialize plugin system
    call plug#end()

### pathogen
...


### vunble


### 常用插件
[NERD Tree](https://github.com/scrooloose/nerdtree)是一个树形目录插件，方便浏览当前目录有哪些目录和文件。   
常用快捷键来操作目录：

    通过hjkl来移动光标
    o打开关闭文件或目录，如果想打开文件，必须光标移动到文件名
    t在标签页中打开
    s和i可以水平或纵向分割窗口打开文件
    p到上层目录
    P到根目录
    K到同目录第一个节点
    P到同目录最后一个节点??

[Vim Powerline](https://github.com/powerline/powerline/tree/master)是一个显示vim状态栏插件，它能够显示vim模式、操作环境、编码格式、行数/列数等信息。使用时注意切换分支。     


***
