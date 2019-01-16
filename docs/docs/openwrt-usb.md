USB功能定制
###1. 添加USB相关支持
Kernel modules —> USB Support —> <*> kmod-usb-core.  
Kernel modules —> USB Support —> <*> kmod-usb-ohci.    
Kernel modules —> USB Support —> <*> kmod-usb-uhci.    
Kernel modules —> USB Support —> <*> kmod-usb-storage. #安装usb存储设备驱动  
Kernel modules —> USB Support —> <*> kmod-usb-storage-extras.  
Kernel modules —> USB Support —> <*> kmod-usb2.  ##usb2.0

###2. 添加SCSI支持
Kernel modules —> Block Devices —> <*>kmod-scsi-core

###3. 添加文件系统支持
Kernel modules —> Filesystems —> <*> kmod-fs-ext4 (移动硬盘EXT4格式选择)  
Kernel modules —> Filesystems —> <*> kmod-fs-vfat(FAT16 / FAT32 格式 选择)  
Kernel modules —> Filesystems —> <*> kmod-fs-ntfs (NTFS 格式 选择)  
Kernel modules —> Filesystems —> <*> kmod-fuse  

###4. 添加UTF8编码,CP437编码，ISO8859-1编码
Kernel modules —> Native Language Support —> <*> kmod-nls-cp437  
Kernel modules —> Native Language Support —> <*> kmod-nls-iso8859-1  
Kernel modules —> Native Language Support —> <*> kmod-nls-utf8  
Utilities  ---> disc ---> <*> fdisk.................................... manipulate disk partition table   
Utilities  ---> <*> usbutils................................... USB devices listing utilities  

###5. 挂载NTFS
Utilities —> Filesystem —> <*> ntfs-3g  

保存退出

###6. 支持nls-cp936
make kernel_menuconfig

File systems  ---> <*> Native language support  --->   
  <*>   Codepage 437 (United States, Canada)   
  <*>   Simplified Chinese charset (CP936, GB2312)  
1
2
3
4
硬盘自动挂载
在source/package/base-files/files/etc/hotplug.d/block目录下添加脚本40-mount，如果没有直接创建

脚本内容如下：

#!/bin/sh

case "$ACTION" in 
    add)
        /etc/init.d/samba start
        for i in $(ls /dev/ | grep 'sd[a-z][1-9]')
            do
                mkdir -p /mnt/usbstorage
                isntfs=`fdisk -l | grep $i | grep NTFS`
                if ["$isntfs" = ""];then
                    mount  -o iocharset=utf8,rw /dev/$i /mnt/usbstorage
                    if [ "$?" -ne 0 ];then
                        mount -o rw /dev/$i /mnt/usbstorage
                    fi
                else
                    ntfs-3g  -o iocharset=utf8,rw /dev/$i /mnt/usbstorage
                    if [ "$?" -ne 0 ];then
                        ntfs-3g -o rw /dev/$i /mnt/usbstorage
                    fi
                fi

            done 
        ;;
    remove) 
        /etc/init.d/samba stop
        MOUNT=`mount | grep -o '/mnt/usbstorage'`

        for i in $MOUNT

            do
                umount /mnt/usbstorage
            done 
        ;;
esac
