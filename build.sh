#!/bin/sh
cd /mnt/mkdocker
mkdocs build
rm -rf /usr/share/nginx/html/portal/site
cp /mnt/markdown/site /usr/share/nginx/html/portal/ -a

