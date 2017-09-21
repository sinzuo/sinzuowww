# 七牛使用指南

git clone https://github.com/qiniu/qshell.git  七牛云
下载qshell
wget http://devtools.qiniu.com/2.0.8/qshell-linux-x64 -O /usr/sbin/qshell && chmod 777 /usr/sbin/qshell

qshell account xIbruH0wyRKRbCk2rDdRq7TgRetaXEbyKNWQuVbA 6lAilWtW5lTpV-N-0ftK6riHOn2qqOncT8TVnARY

qshell domains docment
o6zvblq1c.bkt.clouddn.com

qshell listbucket docment jiang.txt



##删除 
qshell delete docment vmntfsdisk.vmdk

##上传                             上传后文件名    需要上传文件名
qshell fput docment vmext4.vmdk       vmext4.vmdk

##下载文件
wget http://o6zvblq1c.bkt.clouddn.com/vmext4.vmdk

wget http://o6zvblq1c.bkt.clouddn.com/qshell_setup.sh


每行行首添加 http://o6zvblq1c.bkt.clouddn.com/
 sed 's/^/http:\/\/o6zvblq1c.bkt.clouddn.com\//' qshell_list.txt

vim qshell_setup.sh
#!/bin/sh
if [ -f "/usr/sbin/qshell" ]; then
        echo "qshell is exist"
else
        wget http://devtools.qiniu.com/2.0.8/qshell-linux-x64 -O /usr/sbin/qshell && chmod 777 /usr/sbin/qshell
        qshell account xIbruH0wyRKRbCk2rDdRq7TgRetaXEbyKNWQuVbA 6lAilWtW5lTpV-N-0ftK6riHOn2qqOncT8TVnARY
fi
alias qshell_list="qshell listbucket docment qshell_list.txt&&sed 's/^/http:\/\/o6zvblq1c.bkt.clouddn.com\//' qshell_list.txt"
alias qshell_put="qshell fput docment"
alias qshell_del="qshell delete docment"
alias qshell_get='function __zhouchun() { echo "http://o6zvblq1c.bkt.clouddn.com/$*";wget "http://o6zvblq1c.bkt.clouddn.com/$*"; unset -f __zhouchun; }; __zhouchun'

qshell_list 
qshell_get 
qshell_put 文件名  文件名
qshell_del 

更新cdn 文件
qshell cdnrefresh refresh.txt 

Docker 使用工具
docker save -o qshell_13.0.tar.gz jyb-qshell:13.0 
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_put qshell_13.0.tar.gz qshell_13.0.tar.gz
docker load < qshell_13.0.tar.gz 



 docker run -it -v $(pwd):/mnt jyb-qshell:13.0 qshell account

docker run -it -v $(pwd):/mnt jyb-qshell:13.0 /bin/bash

docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_get 
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_put 
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_del
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_list


alias qshell_list="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0"
alias qshell_get="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_get" 
alias qshell_put="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_put"
alias qshell_del="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_del"



#!/bin/sh
qshell listbucket docment /tmp/qshell_list.txt&&sed 's/^/http://o6zvblq1c.bkt.clouddn.com//' /tmp/qshell_list.txt

安装需要文件   
http://o6zvblq1c.bkt.clouddn.com/qshell_13.0.tar.gz  //docker 虚拟机
http://o6zvblq1c.bkt.clouddn.com/qshell_alias.txt    //快捷方式  cat qshell_alias.txt >> /root/.bashrc
http://o6zvblq1c.bkt.clouddn.com/qshell_setup.sh    //安装脚本


https://item.taobao.com/item.htm?id=548686588100&  

Dockerhub   下载地址
https://hub.docker.com/r/stilliard/pure-ftpd/

git clone https://github.com/qiniu/qshell.git  七牛云
下载qshell
wget http://devtools.qiniu.com/2.0.8/qshell-linux-x64 -O /usr/sbin/qshell && chmod 777 /usr/sbin/qshell

qshell account xIbruH0wyRKRbCk2rDdRq7TgRetaXEbyKNWQuVbA 6lAilWtW5lTpV-N-0ftK6riHOn2qqOncT8TVnARY

qshell domains docment
o6zvblq1c.bkt.clouddn.com

qshell listbucket docment jiang.txt



删除 
qshell delete docment vmntfsdisk.vmdk

上传                             上传后文件名    需要上传文件名
qshell fput docment vmext4.vmdk       vmext4.vmdk

下载文件
wget http://o6zvblq1c.bkt.clouddn.com/vmext4.vmdk

wget http://o6zvblq1c.bkt.clouddn.com/qshell_setup.sh


每行行首添加 http://o6zvblq1c.bkt.clouddn.com/
 sed 's/^/http:\/\/o6zvblq1c.bkt.clouddn.com\//' qshell_list.txt

vim qshell_setup.sh
#!/bin/sh
if [ -f "/usr/sbin/qshell" ]; then
        echo "qshell is exist"
else
        wget http://devtools.qiniu.com/2.0.8/qshell-linux-x64 -O /usr/sbin/qshell && chmod 777 /usr/sbin/qshell
        qshell account xIbruH0wyRKRbCk2rDdRq7TgRetaXEbyKNWQuVbA 6lAilWtW5lTpV-N-0ftK6riHOn2qqOncT8TVnARY
fi
alias qshell_list="qshell listbucket docment qshell_list.txt&&sed 's/^/http:\/\/o6zvblq1c.bkt.clouddn.com\//' qshell_list.txt"
alias qshell_put="qshell fput docment"
alias qshell_del="qshell delete docment"
alias qshell_get='function __zhouchun() { echo "http://o6zvblq1c.bkt.clouddn.com/$*";wget "http://o6zvblq1c.bkt.clouddn.com/$*"; unset -f __zhouchun; }; __zhouchun'

qshell_list 
qshell_get 
qshell_put 文件名  文件名
qshell_del 

更新cdn 文件
qshell cdnrefresh refresh.txt 

Docker 使用工具
docker save -o qshell_13.0.tar.gz jyb-qshell:13.0 
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_put qshell_13.0.tar.gz qshell_13.0.tar.gz
docker load < qshell_13.0.tar.gz 



 docker run -it -v $(pwd):/mnt jyb-qshell:13.0 qshell account

docker run -it -v $(pwd):/mnt jyb-qshell:13.0 /bin/bash

docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_get 
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_put 
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_del
docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_list


alias qshell_list="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0"
alias qshell_get="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_get" 
alias qshell_put="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_put"
alias qshell_del="docker run --rm -it -v $(pwd):/mnt jyb-qshell:13.0 qshell_del"



#!/bin/sh
qshell listbucket docment /tmp/qshell_list.txt&&sed 's/^/http://o6zvblq1c.bkt.clouddn.com//' /tmp/qshell_list.txt

安装需要文件   
http://o6zvblq1c.bkt.clouddn.com/qshell_13.0.tar.gz  //docker 虚拟机
http://o6zvblq1c.bkt.clouddn.com/qshell_alias.txt    //快捷方式  cat qshell_alias.txt >> /root/.bashrc
http://o6zvblq1c.bkt.clouddn.com/qshell_setup.sh    //安装脚本


https://item.taobao.com/item.htm?id=548686588100&  联想服务器 3350

Dockerhub   下载地址
https://hub.docker.com/r/stilliard/pure-ftpd/


<!-- 多说评论框 start -->
<div class="ds-thread" data-thread-key="docs-beginners-guide" data-title="新手指南" data-url="http://openwrt.io/docs/beginners-guide/"></div>
<!-- 多说评论框 end -->
