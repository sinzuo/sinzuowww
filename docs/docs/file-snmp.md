#webshell
```
root@jiang-desktop:~/myDocker/jybseconddocker/snmp# cat Dockerfile 
# install snmp
# version 1.0  
  
FROM jyb-ubuntu-tools:16.04
MAINTAINER jyb "jiang_yi_bo@gmail.com"  
 
RUN apt-get update &&\
 mkdir -p /data/golang && \
 apt-get install gcc vim wget make libperl-dev libxml-libxml-perl -y
 
ADD ./hello.go /data/golang/hello.go
 
WORKDIR /data/golang
RUN  wget https://nchc.dl.sourceforge.net/project/net-snmp/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz
RUN  tar -zxvf net-snmp-5.7.3.tar.gz
EXPOSE 22 162 
```

```
root@jiang-desktop:~/myDocker/jybseconddocker/snmp# ls
Dockerfile  hello.go  Makefile  STEVE-TEST-MIB.txt
root@jiang-desktop:~/myDocker/jybseconddocker/snmp# 
root@jiang-desktop:~/myDocker/jybseconddocker/snmp# cat Makefile 
.PHONY: build run kill enter push pull

build:
	sudo docker build -t snmp:3.0 .

run: kill
	sudo docker run -d --name beego -p 8080:8080 beego:1.0

kill:
	-sudo docker kill beego
	-sudo docker rm beego

enter:
	sudo docker exec -it ftpd_server sh -c "export TERM=xterm && bash"

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
root@jiang-desktop:~/myDocker/jybseconddocker/snmp# ls
Dockerfile  hello.go  Makefile  STEVE-TEST-MIB.txt
root@jiang-desktop:~/myDocker/jybseconddocker/snmp# cat STEVE-TEST-MIB.txt 
STEVE-TEST-MIB DEFINITIONS ::= BEGIN

IMPORTS
        enterprises
                FROM RFC1155-SMI
        DisplayString
                FROM RFC-1213
        OBJECT-TYPE, Integer32
                FROM SNMPv2-SMI
        InetAddressType, InetAddress
                FROM INET-ADDRESS-MIB;

company         OBJECT IDENTIFIER ::= {enterprises 12345}
products        OBJECT IDENTIFIER ::= {company 1}

demoIpTable OBJECT-TYPE
        SYNTAX          SEQUENCE OF DemoIpEntry
        MAX-ACCESS      not-accessible
        STATUS          current
        DESCRIPTION
                "Demo IP Table"
        ::= { products 1 }

demoIpEntry      OBJECT-TYPE
        SYNTAX          DemoIpEntry
        MAX-ACCESS      not-accessible
        STATUS          current
        DESCRIPTION
                "Demo IP entry"
        INDEX   { demoIpIndex }
        ::= { demoIpTable 1 }

DemoIpEntry ::= SEQUENCE {
        demoIpIndex      Integer32,
        demoIpAddress    OCTET STRING
}

demoIpIndex OBJECT-TYPE
        SYNTAX          Integer32
        MAX-ACCESS      not-accessible
        STATUS          current
        DESCRIPTION
                "Demo IP entry index"
        ::= { demoIpEntry 1 }

demoIpAddress OBJECT-TYPE
    SYNTAX      OCTET STRING
    MAX-ACCESS  read-only
    STATUS      current
    DESCRIPTION
        "Demo IP Address"
    ::= { demoIpEntry 2 }

END

```