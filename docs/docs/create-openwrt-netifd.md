# OPENWRT netifd procd ubus 之间的关系

>1.端口up、down了，内核会通知 netifd ，netifd 去执行相应过程
2.ubus 调用 ubus 命令，调用了 netifd 的相应的过程
3.procd 管理 /etc/init.d/*  下面的各种进程
4.rpcd  远程过程调用进程，给uhttp 提供接口 ，http://192.168.2.1/ubus
5.
