## docker 安装
在终端中运行下面的命令安装 Docker。
curl -sSL https://get.daocloud.io/docker | sh

Docker Compose
Docker Compose 是 Docker 官方编排（Orchestration）项目之一，负责快速在集群中部署分布式应用。 你可以也通过执行下面的命令，高速安装Docker Compose。  
curl -L https://get.daocloud.io/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose  
chmod +x /usr/local/bin/docker-compose

## docker 卸载


## docker 使用规则
1. build.sh
        #!/bin/sh
        cd /mnt/mkdocker
        mkdocs build
        rm -rf /usr/share/nginx/html/portal/site
        cp /mnt/markdown/site /usr/share/nginx/html/portal/ -a

2. Makefile 文件，make build 可以形成统一的images文件，make run
```
build:
        git clone https://github.com/visint/mkdocker
        sudo docker build --rm -t mkdocker:1.0 .

run:
        sudo docker run -d --restart=always  --name mkdocker -v /home/jiang:/mnt -p 9091:80 mkdocker:1.0
``` 

3. docker 运行后运行  docker exec -it mkdocker /mnt/mkdocker/build.sh
4. wget http://o6zvblq1c.bkt.clouddn.com/bash_aliases_1

### docker 运行参数标记说明
 *  --restart=always
 *  {$pwd}

### Dockerfile 使用说明
 *  ENV





