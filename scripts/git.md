
## git 命令

### git init 在现有目录中初始化仓库

如果你打算使用 Git 来对现有的项目进行管理，你只需要进入该项目目录并输入：

    $ git init

该命令将创建一个名为 .git 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必须文件，这些文件是 Git 仓库的骨干。 但是，在这个时候，我们仅仅是做了一个初始化的操作，你的项目里的文件还没有被跟踪。通过 git add 命令来实现对指定文件的跟踪，然后执行 git commit 提交：

    $ git add *.c
    $ git add LICENSE
    $ git commit -m 'initial project version'
***

### git clone 克隆现有的仓库

Git 克隆的是该 Git 仓库服务器上的几乎所有数据，而不是仅仅复制完成你的工作所需要文件。
命令格式：

    git clone [url]
  
例如：

    $ git clone https://github.com/libgit2/libgit2
    
    //克隆远程仓库的时候，自定义本地仓库的名字
    $ git clone https://github.com/libgit2/libgit2 mylibgit
***

### git status 检查当前文件状态

git status 命令的输出十分详细，但其用语有些繁琐。 

    $ git status
    On branch master
    nothing to commit, working directory clean

如果你使用 git status -s 命令或 git status --short 命令，你将得到一种更为紧凑的格式输出。
  
    $ git status -s
    M README
    MM Rakefile
    A  lib/git.rb
    M  lib/simplegit.rb
    ?? LICENSE.txt

> 新添加的未跟踪文件前面有 ?? 标记
  新添加到暂存区中的文件前面有 A 标记
  修改过的文件前面有 M 标记。 
  
  你可能注意到了 M 有两个可以出现的位置，出现在右边的 M 表示该文件被修改了但是还没放入暂存区，出现在靠左边的 M 表示该文件被修改了并放入了暂存区。
***

### git add 跟踪新文件

使用命令 git add 开始跟踪一个文件。 

    $ git add README

跟踪多个文件

    $ git add .
    
此时再运行 git status 命令，会看到 README 文件已被跟踪，并处于暂存状态：

    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

        new file:   README

只要在 Changes to be committed 这行下面的，就说明是已暂存状态。
***

### 忽略文件
一般我们总会有些文件无需纳入 Git 的管理，也不希望它们总出现在未跟踪文件列表。 通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件
等。 在这种情况下，我们可以创建一个名为 .gitignore 的文件，列出要忽略的文件模式。

    $ cat .gitignore
    *.[oa]
    *~

文件 .gitignore 的格式规范如下：

    * 所有空行或者以 ＃ 开头的行都会被 Git 忽略。
    * 可以使用标准的 glob 模式匹配。
    * 匹配模式可以以（/）开头防止递归。
    * 匹配模式可以以（/）结尾指定目录。
    * 要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（!）取反。
***

### git commit 提交更新

在的暂存区域已经准备妥当可以提交了。 在此之前，请一定要确认还有什么修改过的或新建的文件还没有 git add 过，否则提交的时候不会记录这些还没暂存起来的变化。 这些修改过的文件只保留在本地磁盘。 所以，每次准备提交前，先用 git status 看下，是不是都已暂存起来了， 然后再运行提交命令 git commit：

    $ git commit

这种方式会启动文本编辑器以便输入本次提交的说明。
另外，你也可以在 commit 命令后添加 -m 选项，将提交信息与命令放在同一行：

    $ git commit -m "Story 182: Fix benchmarks for speed"

跳过使用暂存区域
git commit 加上 -a 选项，Git 就会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 git add 步骤。
  
    $ git commit -a -m 'added new benchmarks'
    [master 83e38c7] added new benchmarks
     1 file changed, 5 insertions(+), 0 deletions(-)
***

### git rm 移除文件

要从 Git 中移除某个文件，就必须要从已跟踪文件清单中移除（确切地说，是从暂存区域移除），然后提交。
如果只是简单地从工作目录中手工删除文件，运行 git status 时就会在 “Changes not staged for commit” 部分（也就是 未暂存清单）看到：

    $ rm PROJECTS.md
    $ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.
    Changes not staged for commit:
      (use "git add/rm <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

            deleted:    PROJECTS.md

    no changes added to commit (use "git add" and/or "git commit -a")
然后再运行 git rm 记录此次移除文件的操作：

    $ git rm PROJECTS.md
    rm 'PROJECTS.md'
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

        deleted:    PROJECTS.md
下一次提交时，该文件就不再纳入版本管理了。 如果删除之前修改过并且已经放到暂存区域的话，则必须要用强制删除选项 -f。 这是一种安全特性，用于防止误删还没有添加到快照的数据，这样的数据不能被 Git 恢复。

另外一种情况是，我们想把文件从 Git 仓库中删除（亦即从暂存区域移除），但仍然希望保留在当前工作目录中。 换句话说，你想让文件保留在磁盘，但是并不想让 Git 继续跟踪。 当你忘记添加 .gitignore 文件，不小心把一个很大的日志文件或一堆 .a 这样的编译生成文件添加到暂存区时，这一做法尤其有用。 为达到这一目的，使用 --cached 选项：

    $ git rm --cached README
git rm 命令后面可以列出文件或者目录的名字，也可以使用 glob 模式。 比方说：

    $ git rm log/\*.log
注意到星号 * 之前的反斜杠 \， 因为 Git 有它自己的文件模式扩展匹配方式，所以我们不用 shell 来帮忙展开。 此命令删除 log/ 目录下扩展名为 .log 的所有文件。 类似的比如：

    $ git rm \*~
该命令为删除以 ~ 结尾的所有文件。
***

### git mv 移动文件

    $ git mv file_from file_to
它会恰如预期般正常工作。 
其实，运行 git mv 就相当于运行了下面三条命令：

    $ mv README.md README
    $ git rm README.md
    $ git add README
***

### git log 查看提交历史

    $ git log
    commit ca82a6dff817ec66f44342007202690a93763949
    Author: Scott Chacon <schacon@gee-mail.com>
    Date:   Mon Mar 17 21:52:11 2008 -0700

        changed the version number
    ......

一个常用的选项是 -p，用来显示每次提交的内容差异。 你也可以加上 -2 来仅显示最近两次提交：

    $ git log -p -2
    ......
***

### 撤消操作

    $ git commit --amend
这个命令会将暂存区中的文件提交。 如果自上次提交以来你还未做任何修改（例如，在上次提交后马上执行了此命令），那么快照会保持不变，而你所修改的只是提交信息。

文本编辑器启动后，可以看到之前的提交信息。 编辑后保存会覆盖原来的提交信息。

例如，你提交后发现忘记了暂存某些需要的修改，可以像下面这样操作：

    $ git commit -m 'initial commit'
    $ git add forgotten_file
    $ git commit --amend
最终你只会有一个提交 - 第二次提交将代替第一次提交的结果。
***

### git reset 取消暂存的文件

git reset HEAD <file>...
例如，你已经修改了两个文件并且想要将它们作为两次独立的修改提交，但是却意外地输入了 git add * 暂存了它们两个。 如何只取消暂存两个中的一个呢？

    $ git reset HEAD CONTRIBUTING.md
    Unstaged changes after reset:
    M	CONTRIBUTING.md
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

        renamed:    README.md -> README

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   CONTRIBUTING.md
多个文件需要加上 --

    git reset HEAD -- public/libs/*
    
记住，任何已经提交到 Git 的都可以被恢复。即便在已经删除的分支中的提交，或者用 --amend 重新改写的提交，都可以被恢复。

取消上一次 commit
  
    git reset --hard HEAD~1
    
取消上一次 commit(保证你修改)

    git reset --soft HEAD~1   
***

### git checkout 撤消对文件的修改
你该如何方便地撤消修改 - 将它还原成上次提交时的样子（或者刚克隆完的样子，或者刚把它放入工作目录时的样子）？

    $ git checkout -- CONTRIBUTING.md
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

        renamed:    README.md -> README
可以看到那些修改已经被撤消了。
***

### git remote 查看远程仓库

    $ git remote
    origin
你也可以指定选项 -v，会显示需要读写远程仓库使用的 Git 保存的简写与其对应的 URL。

    $ git remote -v
    origin	https://github.com/schacon/ticgit (fetch)
    origin	https://github.com/schacon/ticgit (push)
***

### git remote add 添加远程仓库
在本地的git仓库"添加一个远程仓库",当然这个远程仓库还是你自己的这个目录。
$ git remote add origin ssh://你的IP/~/testgit/.git
    
    $ git remote
    origin
    $ git remote add pb https://github.com/paulboone/ticgit
    $ git remote -v
    origin	https://github.com/schacon/ticgit (fetch)
    origin	https://github.com/schacon/ticgit (push)
    pb	https://github.com/paulboone/ticgit (fetch)
    pb	https://github.com/paulboone/ticgit (push)
添加一个新的远程 Git 仓库，同时指定一个你可以轻松引用的简写。
***

### git fetch 从远程仓库中拉取
这个命令会访问远程仓库，从中拉取所有你还没有的数据。 执行完成后，你将会拥有那个远程仓库中所有分支的引用，可以随时合并或查看。

    $ git fetch [remote-name]
git fetch origin 会抓取克隆（或上一次抓取）后新推送的所有工作。 必须注意 git fetch 命令会将数据拉取到你的本地仓库 - 它并不会自动合并或修改你当前的工作。 当准备好时你必须手动将其合并入你的工作。
***

### git pull 从远程仓库中抓取与拉取
自动的抓取然后合并远程分支到当前分支。 

    $ git pull [remote-name]
***

### git push 推送到远程仓库

    $ git push origin master
当你和其他人在同一时间克隆，他们先推送到上游然后你再推送到上游，你的推送就会毫无疑问地被拒绝。 你必须先将他们的工作拉取下来并将其合并进你的工作后才能推送。
***

### git remote show 查看远程仓库详细信息

$ git remote show origin
* remote origin
  Fetch URL: https://github.com/schacon/ticgit
  Push  URL: https://github.com/schacon/ticgit
  HEAD branch: master
  Remote branches:
    master                               tracked
    dev-branch                           tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up to date)
***

### git remote rename 远程仓库的重命名

    $ git remote rename pb paul
    $ git remote
    origin
    paul
***

### git remote rm 远程仓库的移除

    $ git remote rm paul
    $ git remote
    origin
***

### git remote set-url 更新获取地址方式
> set-url 有两个参数：当前远程库名字、为远程库新设置的地址

    git remote set-url origin http://git.example.cn:3000/project/ptest.git
***

### git stash 储藏你的工作
为了演示这一功能，你可以进入你的项目，在一些文件上进行工作，有可能还暂存其中一个变更。如果你运行 git status，你可以看到你的中间状态：

    $ git status
     On branch master
     Changes to be committed:
       (use "git reset HEAD <file>..." to unstage)

          modified:   index.html

     Changes not staged for commit:
       (use "git add <file>..." to update what will be committed)

          modified:   lib/simplegit.rb


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
***

### git reflog 显示整个本地仓储的 commit
显示整个本地仓储的commit, 包括所有branch的commit, 甚至包括已经撤销的commit, 只要HEAD发生了变化, 就会在reflog里面看得到. git log只包括当前分支的commit。
例如：

    $ git reflog
    b7057a9 HEAD@{0}: reset: moving to b7057a9
    98abc5a HEAD@{1}: commit: more stuff added to foo
    b7057a9 HEAD@{2}: commit (initial): initial commit

所以，我们要找回我们第二commit，只需要做如下操作：
    
    $ git reset --hard 98abc5a

再来看一下 git 记录：

    $ git log
    * 98abc5a (HEAD, master) more stuff added to foo
    * b7057a9 initial commit

所以，如果你因为reset等操作丢失一个提交的时候，你总是可以把它找回来。除非你的操作已经被git当做垃圾处理掉了，一般是30天以后。
***

## git blame 
命令模式会显示所有行的信息。我们可以利用"<开始>，<结束>"表示，<开始>和<结束>参数可以是数字。

    $ git blame -L 12,13 hello.html 
将显示第12、13行代码的信息
<结束>这个参数不必非得指定一个数字，可以使用+N或者-N指定范围。
    
    $ git blame -L 12,-3 hello.html
也可以使用正则表达式进行匹配行内容，和已经查询以往某个版本中的内容。如：

    $ git blame -L "/<\/body>/",-2 4333289e^ -- index.html
注意上面有--，这是通知Git查询指定文件。

## git 使用技巧

1 在本地仓库执行 pull 时报以下错误：

    sign_and_send_pubkey: signing failed: agent refused operation
执行以下命令：

    eval "$(ssh-agent -s)"
    ssh-add
***

2 当在本地执行 push 推送到远程仓库中时，发现代码有重大问题，想要删除该条提交记录时，可以按以下步骤执行：

    git reset --hard SHA 
这句命令可以回退到指定版本。再次提交时如果保存，加上 -f 参数：

    git push -u master origin -f
此时，SHA 对应的版本之后所有的版本就被覆盖了，所以需要谨慎处理，最好做个备份。
***

3 HEAD 的含义
在git中，用HEAD表示当前版本，也就是最新的提交，比如：3628164...882e1e0，上一个版本就是HEAD^，上上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100。

 * HEAD指向的版本就是当前版本，因此，Git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id。
 * 穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本。
 * 要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。
***


git rev-parse --show-toplevel
git rev-parse --show-toplevel
git rev-parse --show-toplevel
git fetch
git status -z -u
git config --get commit.template
git show :routes/gorganization.js
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git show :routes/gorganization.js
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git show :utils/commUtils.js
git show :routes/gorganization.js
git show :utils/commUtils.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git show :routes/gorganization.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git show :routes/gorganization.js
git show :utils/commUtils.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :utils/commUtils.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :routes/gorganization.js
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git show :index.js
git show :routes/gorganization.js
git fetch
git status -z -u
git symbolic-ref --short HEAD
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
git status -z -u
git symbolic-ref --short HEAD
git show :routes/gorganization.js
git rev-parse master
git rev-parse --symbolic-full-name --abbrev-ref master@{u}
git rev-list --left-right master...origin/master
git for-each-ref --format %(refname) %(objectname)
git remote --verbose
