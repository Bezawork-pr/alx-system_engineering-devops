#!/usr/bin/env bash
# install nginx add header, 404 page and redirect
exec {'Installation':
  command => 'sudo apt-get update -y;
    sudo apt-get install nginx -y;
    sudo sed -i "/server_name _/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-availble/default;
    sudo service nginx restart',
}
