#business
```
root@jiang-desktop:~/myDocker/jybseconddocker/business# cat build.sh 
#!/bin/sh
cd /mnt/markdown
mkdocs build
rm -rf /usr/share/nginx/html/portal/site
cp /mnt/markdown/site /usr/share/nginx/html/portal/ -a
```
```
root@jiang-desktop:~/myDocker/jybseconddocker/business# cat Dockerfile 
FROM markdown:1.0
MAINTAINER jiang_yi_bo <jiang_yi_bo@hotmail.com>

ADD ./markdown/. /usr/share/nginx/html/portal
ADD build.sh /usr/sbin/
WORKDIR /usr/share/nginx/html/portal
RUN rm -rf /usr/share/nginx/html/portal/site && mkdocs build && \
  grep -lr googleapis site/css/ | xargs sed -i "s|//fonts.googleapis.com/|http://fonts.gmirror.org/|g"
```

```
root@jiang-desktop:~/myDocker/jybseconddocker/business# cat Makefile 
.PHONY: build run kill enter push pull

build:
	git clone https://github.com/visint/markdown
	sudo docker build --rm -t business:1.0 .

run:
	sudo docker run -d --restart=always  --name business -v /home/jiang:/mnt -p 9091:80 business:1.0
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

kill:
	-sudo docker kill ftpd_server
	-sudo docker rm ftpd_server

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"


```