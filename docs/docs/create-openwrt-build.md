##编译openwrt 
参考 

1. 下载潘多拉源码 
```
Lean's OpenWrt source，作者在官方源码基础上做了很多修改，用起来很方便

git clone https://github.com/coolsnowwolf/lede.git
源码克隆到本地后更新额外的软件包

./scripts/feeds update -a
./scripts/feeds install -a
进入配置菜单页面

make menuconfig
其中 Target System 选择平台，Subtarget 选择处理器型号，Target Profile 选择路由器型号，其他选项自定义，然后就可以开始编译了

make V=s
```

2. sinzuo 固件源码 
https://github.com/sinzuo/lede-openwrt.git newfifi 7621带修改默认配置的

3. openwrt 开源地址
```
git clone https://github.com/openwrt/openwrt

1. Run "./scripts/feeds update -a" to obtain all the latest package definitions
defined in feeds.conf / feeds.conf.default

2. Run "./scripts/feeds install -a" to install symlinks for all obtained
packages into package/feeds/

3. Run "make menuconfig" to select your preferred configuration for the
toolchain, target system & firmware packages.

4. Run "make" to build your firmware. This will download all sources, build
the cross-compile toolchain and then cross-compile the Linux kernel & all
chosen applications for your target system.

./scripts/feeds update packages
./scripts/feeds install -a -p packages
```

4. 编译 一个包方法 
make ./package/feeds/management/freecwmp/clean

make ./package/feeds/management/freecwmp/compile V=99 

make package/feeds/packages/pptpd/clean

5. 保存patch文件到buildroot
    make package/feeds/packages/atftp/update V=s
6. 重新编译tftp-hpa包以测试修改
    make package/feeds/packages/atftp/{clean,compile} package/index V=s


##编译openwrt docker开发环境
```
git clone https://github.com/sinzuo/myDocker/

cd myDocker/jybthreedocker/openwrtbuild

make build 

make run

```
修改Makefile 文件 指定源码位置  和dl 目录
DLPATH:=/mnt/dShare/openwrtDir/dl 
VPATH:=/work/ 
-v $(VPATH):/mnt -v $(DLPATH):/root/dl  指定到docker-image里的位置 

##下载好的dl包
[openwrt dl 包下载](http://qq.sinzuo.com:9091/openwrt/openwrt-dl.vmdk)
