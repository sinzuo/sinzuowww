
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

###

sync_uci_with_dat(mt7612e,/etc/wireless/mt7612e/mt7612e.dat,,)
enable_ralink_wifi(mt7612e,mt76x2e,,)                         
rmmod mt76x2e                                                 
insmod mt76x2e                                                
ifconfig rai0 up

ifconfig rai0 down

rmmod mt76x2e

insmod mt76x2e

ifconfig rai0 up

uci2dat -d mt7612e -f /etc/wireless/mt7612e/mt7612e.dat -c 36

brctl addif br-lan rai0

iwpriv rai0 set AutoChannelSel=2 

VHT_BW
WirelessMode=14            
TxRate=0                   
Channel=0                  
AutoChannelSelect=2 


## 练习题


用putty连接路由器，用putty下载安装所需的软件包：(直接复制下面内容到提示符)

opkg update

opkg install kmod-usb-core

opkg install kmod-usb2                #安装usb2.0 

opkg install kmod-usb-ohci            #安装usb ohci控制器驱动

opkg install kmod-usb-storage         #安装usb存储设备驱动

opkg install kmod-fs-ext3             #安装ext3分区格式支持组件

opkg install kmod-fs-vfat             #挂载FAT

opkg install ntfs-3g                  #挂载NTFS

opkg install mount-utils              #挂载卸载工具

opkg install block-mount

opkg install luci-app-samba           #SAMBA网络共享服务

/etc/init.d/samba enable              #启用并开始SAMBA共享

/etc/init.d/samba restart

注意 在线安装软件包需保证路由器Wan口可以连接Internet

尝试为“超级开发者”做一个网页配置界面，实现修改端口的功能。

新增 usb 功能
https://blog.csdn.net/wynter_/article/details/78949502


<!-- 多说评论框 start -->
<div class="ds-thread" data-thread-key="docs-create-gee-app" data-title="开发极路由云插件" data-url="http://openwrt.io/docs/create-gee-app/"></div>
<!-- 多说评论框 end -->
