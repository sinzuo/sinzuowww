## openvpn 用户说明
文件名 | 是否必须 | 用途
-----|----------|-----
jiang       192.168.255.2
jiangyibo   192.168.255.18
bobo        192.168.255.14
CLIENTNAME  192.168.255.10


##rtty 一键编译 openwrt安装过程
主要参考  https://github.com/zhaojh329/

rttys 服务端查看
http://sinzuo.cn:5912  登陆用户名 sinzuo  密码 sinzuo

下载固件 编译  测试
https://github.com/sinzuo/lede-openwrt
编译方法

newifi D1   http://images.sinzuo.cn/openwrt/newifid1-2018-12-29-v2.0.2.bin
newifi D2   http://images.sinzuo.cn/openwrt/newifid2-2018-12-29-v2.0.2.bin



##rtty 一键编译 ubuntu执行过程
编译过程
rtty -h sinzuo.cn -p 5912 -a -i br-lan -d ubuntu


ubuntu 17.04 vm 安装下载文件
http://images.sinzuo.com:9091/VMware-Workstation-Full-12.5.5-5234757.x86_64.bundle

创建 17.04的img 文件
nohup dd if=/dev/sda of=16G-ubuntu17.04-all.img bs=512 count=31277232 &

qemu-img convert -f  raw -O vmdk  16G-ubuntu17.04-all.img 16G-ubuntu17.04-all.vmdk


下载 16G vmWare 自带docker文件
http://images.sinzuo.cn/vmWare/16g-ssd-ubuntu-17.04.bin
用户名:root 密码:sinzuo

下载 16G Image 文件
http://images.sinzuo.cn/vmWare/16g-ssd-ubuntu-17.04.bin
用户名:root 密码:sinzuo


##rttys  服务端 一键安装 测试
https://github.com/sinzuo/myDocker
进入 myDocker 目录




// ge shui xin xi


## 练习题

尝试为“超级开发者”做一个网页配置界面，实现修改端口的功能。

<!-- 多说评论框 start -->
<div class="ds-thread" data-thread-key="docs-create-gee-app" data-title="开发极路由云插件" data-url="http://openwrt.io/docs/create-gee-app/"></div>
<!-- 多说评论框 end -->
