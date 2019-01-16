# overlayroot  只读系统 恢复系统

apt-get install overlayroot

使用 cat /etc/overlayroot.conf 

\#     overlayroot=tmpfs
\#     overlayroot=tmpfs:swap=1
添加
overlayroot=tmpfs
重启

 * 已经带overlayroot 的虚拟机文件下载[http://qq.sinzuo.com:9091/vmWare/16G-ubuntu17.04-all.vmdk](http://qq.sinzuo.com:9091/vmWare/16G-ubuntu17.04-all.vmdk)
 * 已经带overlayroot 的IMAGE文件下载[http://qq.sinzuo.com:9091/vmWare/16G-ubuntu17.04-all.img](http://qq.sinzuo.com:9091/vmWare/16G-ubuntu17.04-all.img)
 
 用户名:root 密码:sinzuo




# overlayroot  不启用

overlayroot-chroot 修改/etc/overlayroot.conf
去掉  overlayroot=tmpfs 
\#overlayroot=tmpfs 
重启