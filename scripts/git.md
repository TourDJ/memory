

在现有目录中初始化仓库

  如果你打算使用 Git 来对现有的项目进行管理，你只需要进入该项目目录并输入

    $ git init

  这个时候，我们仅仅是做了一个初始化的操作，你的项目里的文件还没有被跟踪。


  通过 git add 命令来实现对指定文件的跟踪，然后执行 git commit 提交
    $ git add *.c
    $ git add LICENSE
    $ git commit -m 'initial project version'


克隆现有的仓库

  Git 克隆的是该 Git 仓库服务器上的几乎所有数据，而不是仅仅复制完成你的工作所需要文件。
  
    $ git clone https://github.com/libgit2/libgit2
    $ git clone https://github.com/libgit2/libgit2 mylibgit


状态简览
  git status 命令的输出十分详细，但其用语有些繁琐。 如果你使用 git status -s 命令或 git status --short 命令，你将得到一种更为紧凑的格式输出。
  
    $ git status -s
    M README
    MM Rakefile
    A  lib/git.rb
    M  lib/simplegit.rb
    ?? LICENSE.txt


忽略文件
  一般我们总会有些文件无需纳入 Git 的管理，也不希望它们总出现在未跟踪文件列表。 通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件
  等。 在这种情况下，我们可以创建一个名为 .gitignore 的文件，列出要忽略的文件模式。

    $ cat .gitignore
    *.[oa]
    *~

  文件 .gitignore 的格式规范如下：

    所有空行或者以 ＃ 开头的行都会被 Git 忽略。
    可以使用标准的 glob 模式匹配。
    匹配模式可以以（/）开头防止递归。
    匹配模式可以以（/）结尾指定目录。

  要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（!）取反。


移除文件
移动文件

添加远程仓库

  在本地的git仓库"添加一个远程仓库",当然这个远程仓库还是你自己的这个目录。

    $ git remote add origin ssh://你的IP/~/testgit/.git

更新获取地址方式
git remote set-url origin http://git.qingtime.cn:3000/gGroup/gPro.git



储藏你的工作
为了演示这一功能，你可以进入你的项目，在一些文件上进行工作，有可能还暂存其中一个变更。如果你运行 git status，你可以看到你的中间状态：


$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#      modified:   index.html
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#
#      modified:   lib/simplegit.rb
#

现在你想切换分支，但是你还不想提交你正在进行中的工作；所以你储藏这些变更。为了往堆栈推送一个新的储藏，只要运行 git stash：

$ git stash
Saved working directory and index state \
  "WIP on master: 049d078 added the index file"
HEAD is now at 049d078 added the index file
(To restore them type "git stash apply")
你的工作目录就干净了：

$ git status
# On branch master
nothing to commit, working directory clean

取消已经暂存的文件

有两个修改过的文件，我们想要分开提交，但不小心用 git add . 全加到了暂存区域。该如何撤消暂存其中的一个文件呢？
其实，git status 的命令输出已经告诉了我们该怎么做：

    $ git add .
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

            modified:   README.txt
            modified:   benchmarks.rb

可以使用 git reset HEAD <file>... 的方式取消暂存。

    $ git reset HEAD benchmarks.rb
    Unstaged changes after reset:
    M       benchmarks.rb
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

            modified:   README.txt

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   benchmarks.rb
            
            
取消对文件的修改

如果觉得刚才对 benchmarks.rb 的修改完全没有必要，该如何取消修改，回到之前的状态（也就是修改之前的版本）呢？
git status 同样提示了具体的撤消方法，接着上面的例子，现在未暂存区域看起来像这样：

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   benchmarks.rb
    
    
在第二个括号中，我们看到了抛弃文件修改的命令

    $ git checkout -- benchmarks.rb
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

            modified:   README.txt
            

可以看到，该文件已经恢复到修改前的版本。

记住，任何已经提交到 Git 的都可以被恢复。即便在已经删除的分支中的提交，或者用 --amend 重新改写的提交，都可以被恢复。

取消上一次 commit
  
    git reset --hard HEAD~1
    
取消上一次 commit(保证你修改)

    git reset --soft HEAD~1
    
    
