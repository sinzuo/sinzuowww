#webshell
```
shellinabox# cat Dockerfile 
FROM hub.c.163.com/public/ubuntu:16.04-tools
MAINTAINER izuolan <i@zuolan.me>

RUN apt-get update && apt-get install shellinabox

# a new user is needed to get access to the container
RUN useradd username
RUN echo "username:userpassword" | chpasswd

#this is needed to gain root access
RUN echo "root:rootpassword" | chpasswd

EXPOSE 4200

CMD ["shellinaboxd", "-s", "/:LOGIN", "--disable-ssl"]
```