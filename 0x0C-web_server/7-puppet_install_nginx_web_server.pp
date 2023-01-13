#  Install Nginx web server (w/ Puppet)
exec {'/usr/bin/env sudo apt-get update -y': }
exec {'/usr/bin/env sudo apt-get install -y nginx': }
exec {'/usr/bin/env sudo echo "Hello World!" |  /var/www/html/index.nginx-debian.html': }
exec {'/usr/bin/env sed -i "/server_name _;/ a\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default': }
exec {'/usr/bin/env service nginx start': }
