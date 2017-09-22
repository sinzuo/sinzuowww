#Dockerfile
```
FROM hub.c.163.com/public/ubuntu:14.04
MAINTAINER jybyun <jyb@jybyun.top>

RUN apt-get update && \
apt-get -y install \
    nginx \
    ca-certificates \
    php5 php5-fpm php5-cli php5-json php5-curl

RUN mkdir /www
WORKDIR /www
ADD script /www
VOLUME /www/uploads

ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 80

ENTRYPOINT ["sh", "-c", "chown -R www-data: /www && service php5-fpm start && nginx"]

```

```
uploads# cat nginx.conf 
user www-data;
worker_processes 4;
pid /run/nginx.pid;
daemon off;

events {
  worker_connections 768;
  # multi_accept on;
}

http {

  ##
  # Basic Settings
  ##

  sendfile on;
  tcp_nopush on;
  tcp_nodelay on;
  keepalive_timeout 65;
  types_hash_max_size 2048;
  # server_tokens off;

  # server_names_hash_bucket_size 64;
  # server_name_in_redirect off;

  include /etc/nginx/mime.types;
  default_type application/octet-stream;

  ##
  # Logging Settings
  ##

  access_log /var/log/nginx/access.log;
  error_log /var/log/nginx/error.log;

  ##
  # Gzip Settings
  ##

  gzip on;
  gzip_disable "msie6";

  gzip_vary on;
  gzip_proxied any;
  gzip_comp_level 6;
  gzip_buffers 16 8k;
  gzip_http_version 1.1;
  gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

  server {
    root /www;
    location / {
      try_files $uri $uri/ /index.php?$args;
      index index.html index.htm index.php;
    }
    location ~ \.php$ {
      try_files $uri $uri/ /index.php?$args;
      index index.html index.htm index.php;
      include fastcgi_params;
      fastcgi_index index.php;
      fastcgi_param PATH_INFO $fastcgi_path_info;
      fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      fastcgi_param HTTP_MOD_REWRITE On;
      fastcgi_pass unix:/var/run/php5-fpm.sock;
      fastcgi_split_path_info ^(.+\.php)(/.+)$;
    }
  }
}


```