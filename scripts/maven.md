
## maven 命令

#### 创建项目
mvn archetype:create -DgroupId=com.zang.maven  -DartifactId=system-parent -DarchetypeArtifactId=maven-archetype-quickstart 
-DinteractiveMode=false 
> maven3.0.5以上版本舍弃了create，使用generate生成项目


maven项目 关于Eclipse报:" cannot be read or is not a valid ZIP file"的解决方案
这中情况 说明依赖的jar包没有完全下好。到repository 中删去相应的jar目录 让maven重新去下载。
如果还报错，删除maven报错，eclipse中打开pom.xml 编辑状态 重新保存。看看最新的报错信息，进入对应的目录，删除即可


## maven 错误
Remove all your failed downloads      
Linux

        find ~/.m2  -name "*.lastUpdated" -exec grep -q "Could not transfer" {} \; -print -exec rm {} \;

Windows

        cd %userprofile%\.m2\repository
        for /r %i in (*.lastUpdated) do del %i
