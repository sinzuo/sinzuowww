# OPENWRT netifd procd ubus 之间的关系

1.端口up、down了，内核会通知 netifd ，netifd 去执行相应过程
2.ubus 调用 ubus 命令，调用了 netifd 的相应的过程
3.procd 管理 /etc/init.d/*  下面的各种进程
4.rpcd  远程过程调用进程，给uhttp 提供接口 ，http://192.168.2.1/ubus
5.


修改  git clone http://github.com/sinzuo/sinzuorom
查看 
解析固件脚本
```
cat sinzuo-dec.sh 
    #!/bin/sh
    EXTPATH=/home/jiang//work/lede-openwrt7621/
    sudo echo "Starting..."
    MKSQSHFS4='./bin/mksquashfs4'
    PADJFFS2='./bin/padjffs2'
    offset1=`grep -oba hsqs $1 | grep -oP '[0-9]*(?=:hsqs)'`
    offset2=`wc -c $1 | grep -oP '[0-9]*(?= )'`
    size2=`expr $offset2 - $offset1`
    #echo $offset1 " " $offset2 " " $size2
    dd if=$1 of=kernel.bin bs=1 ibs=1 count=$offset1
    dd if=$1 of=secondchunk.bin bs=1 ibs=1 count=$size2 skip=$offset1
    sudo  $EXTPATH/staging_dir/host/bin/unsquashfs4 secondchunk.bin
```    
执行方法 

生成固件
```
 cat sinzuo-rom.sh 
    #!/bin/sh
    EXTPATH=/home/jiang//work/lede-openwrt7621/
    sudo $EXTPATH/staging_dir/host/bin/mksquashfs4 squashfs-root root.squashfs -nopad -noappend -root-owned -comp xz -Xpreset 9 -Xe -Xlc 0 -Xlp 2 -Xpb 2  -b 256k -p '/dev d 755 0 0' -p '/dev/console c 600 0 0 5 1' -processors 1
    test -f sinzuo-rom.bin && rm -rf sinzuo-rom.bin
    cat kernel.bin root.squashfs > sinzuo-rom.bin
    $EXTPATH/staging_dir/host/bin/padjffs2 sinzuo-rom.bin
```

只需要修改 EXTPATH 到 安装目录
1.修改ip地址  
2.修改能无线桥接配置
3.

##下载 潘多拉固件
cd /tmp/

wget http://qq.sinzuo.com:9091/newifid2/PandoraBox-ralink-mt7621-R8.1.12-newifi-3-squashfs-sysupgrade.bin

mtd write PandoraBox-ralink-mt7621-R8.1.12-newifi-3-squashfs-sysupgrade.bin firmware

##刷高格固件
cd /tmp/

wget      http://qq.sinzuo.com:9091/newifid2/gocloud_newifi3/GOCLOUD-S2ALLLLW%E5%B8%83%E5%B1%80%E7%9A%847621%E5%88%B7%E6%9C%BA%E4%B8%93%E7%94%A8%E5%8C%85-4.0.1.12651.bin

mtd write GOCLOUD-S2ALLLLW%E5%B8%83%E5%B1%80%E7%9A%847621%E5%88%B7%E6%9C%BA%E4%B8%93%E7%94%A8%E5%8C%85-4.0.1.12651.bin firmware



然后在页面升级

##下载 华硕固件 老毛子固件
cd /tmp/

wget http://qq.sinzuo.com:9091/newifid2/huashuo/RT-N56UB1-newif3D2-512M_3.4.3.9-099.trx

mtd write RT-N56UB1-newif3D2-512M_3.4.3.9-099.trx firmware

##刷自己编译带ssr 带openvpn 固件
cd /tmp/

wget http://qq.sinzuo.com:9091/newifid2/7621-d2.bin

mtd write 7621-d2.bin firmware


