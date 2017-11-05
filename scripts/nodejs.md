### node 脚本安装
> 注： 摘录自网络  

    #! /bin/bash
    # run it by: bash install-node.sh
    read -p " which version of Node do you need to install: enter 0.10.24, 0.12.9, or 4.2.2 (or any other valid version): " VERSIONNAME
    read -p " Are you using a 32-bit or 64-bit operating system ? Enter 64 or 32: " ARCHVALUE
    if [[ $ARCHVALUE = 32 ]]
        then
        printf "user put in 32 \n"
        ARCHVALUE=86
        URL=http://nodejs.org/dist/v${VERSIONNAME}/node-v${VERSIONNAME}-linux-x${ARCHVALUE}.tar.gz

    elif [[ $ARCHVALUE = 64 ]]
        then
        printf "user put in 64 \n"
        ARCHVALUE=64
        URL=http://nodejs.org/dist/v${VERSIONNAME}/node-v${VERSIONNAME}-linux-x${ARCHVALUE}.tar.gz

    else
        printf "invalid input expted either 32 or 64 as input, quitting ... \n"

        exit
    fi

    # setting up the folders and the the symbolic links
    printf $URL"\n"
    ME=$(whoami) ; 

    #adding yourself to the group to access /usr/local/bin
    sudo chown -R $ME /usr/local && cd /usr/local/bin 

    # downloads and unzips the content to _node
    mkdir _node && cd $_ && wget $URL -O - | tar zxf - --strip-components=1 

    # copy the node modules folder to the /lib/ folder
    cp -r ./lib/node_modules/ /usr/local/lib/ 

    # copy the /include/node folder to /usr/local/include folder
    cp -r ./include/node /usr/local/include/ 

    # create the man folder
    mkdir /usr/local/man/man1 

    # copy the man file
    cp ./share/man/man1/node.1 /usr/local/man/man1/ 

    # copy node to the bin folder
    cp bin/node /usr/local/bin/ 

    ## making the symbolic link to npm
    ln -s "/usr/local/lib/node_modules/npm/bin/npm-cli.js" ../npm 

    # print the version of node and npm
    node -v
    npm -v



### node 版本含义

版本格式：主版本号.次版本号.修订号，版本号递增规则如下：

* 主版本号：当你做了不兼容的 API 修改，
* 次版本号：当你做了向下兼容的功能性新增，
* 修订号：当你做了向下兼容的问题修正。    
先行版本号及版本编译信息可以加到“主版本号.次版本号.修订号”的后面，作为延伸。

  |表达式|版本范围|说明|
  |:-|:--|:-----|
  |1.1.1|1.1.1|匹配指定版本|
  |^1.0.0	|>=1.0.0 且 <2.0.0	|^表示与指定的版本兼容，左边第一个非0字段不可变，后面的可变，即1.X.X但不得到2.0.0|
  |^0.0.3	|>=0.0.3 且 <0.0.4 |同上|
  |^5.x	|>=5.0.0 且 <6.0.0	|同上|
  |~0.1.1	|>=0.1.1 且 <0.2.0	|~表示约等于版本，如果存在次版本号，则允许修订号为最高的，否则允许次版本为最高，如 ~1匹配>=1.0.0 且 <2.0.0|
  |*	|匹配 >=0.0.0	|通配符|
  |>=3.0.0	|>=3.0.0	|其他符号还有<,<=,>,>=,=.字面意思。可使用空格表示AND，双竖线表示OR，範例：1.2.7 双竖线 >=1.2.9 <2.0.0 表示可包含 1.2.7、    1.2.9 和 1.4.6，不可包含 1.2.8 或 2.0.0|
  |1.30.2 - 2.30.2	|>=1.30.2 且 <=2.30.2|	字面意思|



### npm 常用命令
#### 查看 npm 包安装根路径
> -g 选项是可选的，不加就是当前项目包的根路径，否则是全局包的根路径  

    npm root [-g]

#### 查看/设置 npm 包安装路径前缀

    npm config get prefix
    npm config set prefix path

