#!/usr/bin/env bash
#install nginx add header, 404 page and redirect
exec {'Header':
  command  => 'apt-get -y update && apt-get -y install nginx && echo "Hello World!" > /var/www/html/index.nginx-debian.html && sed -i  "/server {/a\\\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default && service nginx restart',
  provider => shell,
}
