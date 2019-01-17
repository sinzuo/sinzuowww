#dnsmasq 提供dhcp dns服务
1. 安装 
apt-get install dnsmasq

> 

2. 编辑 vim /etc/dnsmasq.conf 
```
listen-address=192.168.10.210      #网卡eth1的IP
interface=eth0  
#绑定了网卡之后会保证dnsmasq不去骚扰其他网卡，保证请求不乱发，一般跟interface一起使用             
bind-interfaces 
#这个是重要的东西，设置dhcp的ip发配range，就是你的dhcp服务器分配多少个ip出来，ip的范围从哪里到哪里，默认是c类网段，
#所以简略了掩码，后面增加一个租约时间，dhcp分配的ip是有租约的，租约过了是需要回收的。
dhcp-range=192.168.10.2,192.168.10.100,12h
dhcp-option=6,192.168.10.2,8.8.4.4   #6-->设置DNS服务器地址选项
#port=5353       #设置端口

```

3. 执行 
/etc/init.d/dnsmasq restart