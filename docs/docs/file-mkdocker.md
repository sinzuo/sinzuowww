#mkdocker
```
root@jiang-desktop:~/myDocker/jybseconddocker/mkdocker# cat build.sh 
#!/bin/sh
cd /mnt/mkdocker
mkdocs build
rm -rf /usr/share/nginx/html/portal/site
cp /mnt/mkdocker/site /usr/share/nginx/html/portal/ -a
```
```
root@jiang-desktop:~/myDocker/jybseconddocker/mkdocker# cat Dockerfile 
FROM markdown:1.0
MAINTAINER jiang_yi_bo <jiang_yi_bo@hotmail.com>

ADD ./mkdocker/. /usr/share/nginx/html/portal
ADD build.sh /usr/sbin/
WORKDIR /usr/share/nginx/html/portal
RUN rm -rf /usr/share/nginx/html/portal/site && mkdocs build && \
  grep -lr googleapis site/css/ | xargs sed -i "s|//fonts.googleapis.com/|http://fonts.gmirror.org/|g"
 ```

root@jiang-desktop:~/myDocker/jybseconddocker/mkdocker# cat Makefile 
.PHONY: build run kill enter push pull

build:
	git clone https://github.com/visint/mkdocker
	sudo docker build --rm -t mkdocker:1.0 .

run:
	sudo docker run -d --restart=always  --name mkdocker -v /home/jiang:/mnt -p 9093:80 mkdocker:1.0
#	sudo docker run -d --name business -v /home/jiang:/mnt -p 9091:80 business:1.0

kill:
	-sudo docker kill ftpd_server
	-sudo docker rm ftpd_server

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"




## Build libev
git clone https://github.com/enki/libev.git
cd libev
./configure --host=mipsel-openwrt-linux-musl
DESTDIR=/tmp/rtty_install make install
##Build libuwsc
git clone https://github.com/zhaojh329/libuwsc.git
cd libuwsc
cmake . -DCMAKE_C_COMPILER=mipsel-openwrt-linux-musl-gcc -DCMAKE_FIND_ROOT_PATH=/tmp/rtty_install -DUWSC_SSL_SUPPORT=OFF
DESTDIR=/tmp/rtty_install make install
##Build rtty
git clone https://github.com/zhaojh329/rtty.git
cd rtty
cmake . -DCMAKE_C_COMPILER=mipsel-openwrt-linux-musl-gcc -DCMAKE_FIND_ROOT_PATH=/tmp/rtty_install
DESTDIR=/tmp/rtty_install make install

uci add rtty rtty
uci set rtty.@rtty[0].host='sinzuo.cn'
uci set rtty.@rtty[0].port='5912'
uci commit rtty

git clone https://github.com/enki/libev.git
git clone https://github.com/zhaojh329/libuwsc.git
git clone https://github.com/zhaojh329/rtty.git


```