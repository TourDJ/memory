
install arangodb
  docker pull arangodb
  
run arangodb
  docker run  -p 8529:8529 -e ARANGO_ROOT_PASSWORD=qingtime123 -d arangodb 

execute docker arangodb command
  docker exec ef66b8dab924 [command]

enter docker container directory and run command
  docker exec -i -t ef66b8dab924 /bin/bash


stop docker container
  docker stop ef66b8dab924
  
list docker running container
  docker ps

remove docker container
  docker rm 2ff11e8ca680 

run docker container mapper path

  docker run  -p 8529:8529 -e ARANGO_ROOT_PASSWORD=qingtime123 -d arangodb 
  
  or
  
  docker run  -p 8531:8529 -e ARANGO_ROOT_PASSWORD=qingtime123 \
  > -v /data/arangodb:/var/lib/arangodb3 \
  >  -d arangodb

list docker images
  docker images

docker arangodb import data
  first create file directory mapping,just see above
    for example: "/data/arangodb:/var/lib/arangodb3"
      /data/arangodb: the host directory
      /var/lib/arangodb3: the dockper image directory
    then cope the files to /data/arangodb sametime to /var/lib/arangodb3
  exec restore data command
    arangorestore --server.endpoint tcp://120.24.2.71:8529 --server.database arango_gpro --collection my_gpro_persons 
    --input-directory "/var/lib/arangodb3/arangodata"


## docker 常用命令  

#### 安装镜像

    docker pull arangodb
  
#### 启动镜像

    docker run  -p 8529:8529 -e ARANGO_ROOT_PASSWORD=123456 -d arangodb 

#### 停止镜像

    docker stop ef66b8dab924 镜像ID

#### 查看容器

    docker ps
    
#### 删除容器

    docker rm 2ff11e8ca680
    


## docker exec 命令
execute docker arangodb command

    docker exec ef66b8dab924 [command]

enter docker container directory and run command

      docker exec -i -t ef66b8dab924 /bin/bash


  


run docker container mapper path    

        docker run  -p 8529:8529 -e ARANGO_ROOT_PASSWORD=qingtime123 -d arangodb 
  
  or
  
        docker run  -p 8531:8529 -e ARANGO_ROOT_PASSWORD=qingtime123 -v /data/arangodb:/var/lib/arangodb3 -d arangodb
    
    
list docker images
  
    docker images

docker arangodb import data
  first create file directory mapping,just see above    
    for example: "/data/arangodb:/var/lib/arangodb3"    
      * /data/arangodb: the host directory  
      * /var/lib/arangodb3: the dockper image directory 
    then cope the files to /data/arangodb sametime to /var/lib/arangodb3    
  exec restore data command 
    arangorestore --server.endpoint tcp://120.24.2.71:8529 --server.database arango_gpro --collection my_gpro_persons 
    --input-directory "/var/lib/arangodb3/arangodata"   
    
    
## bind mounts
[官方文档](https://docs.docker.com/engine/admin/volumes/bind-mounts/#start-a-container-with-a-bind-mount)

##### When you use a bind mount, a file or directory on the host machine is mounted into a container. The file or directory is referenced by its full or relative path on the host machine.


> -v or --volume: Consists of three fields, separated by colon characters (:). The fields must be in the correct order, and the meaning > of each field is not immediately obvious.
> + In the case of bind mounts, the first field is the path to the file or directory on the host machine.
> + The second field is the path where the file or directory will be mounted in the container.
> + The third field is optional, and is a comma-separated list of options, such as ro, consistent, delegated, cached, z, and Z.

#### Start a container with a bind mount 
Consider a case where you have a directory source and that when you build the source code, the artifacts are saved into another directory source/target/. You want the artifacts to be available to the container at /app/, and you want the container to get access to a new build each time you build the source on your development host. Use the following command to bind-mount the target/ directory into your container at /app/. Run the command from within the source directory. The $(pwd) sub-command expands to the current working directory on Linux or macOS hosts. 

> The --mount and -v examples below produce the same result. You can’t run them both unless you remove the devtest container after running the first one.

    $ docker run -d \
    -it \
    --name devtest \
    -v "$(pwd)"/target:/app \
    nginx:latest

> Use docker inspect devtest to verify that the bind mount was created correctly. Look for the Mounts section: 

    docker inspect devtest
    
    "Mounts": [
    {
        "Type": "bind",
        "Source": "/tmp/source/target",
        "Destination": "/app",
        "Mode": "",
        "RW": true,
        "Propagation": "rprivate"
    }
    ]


docker load -i naodong-docker.tar
docker tag heineiuo/naodong:latest heineiuo/naodong:0.0.33
vi docker-compose.yml
docker-compose up -d


