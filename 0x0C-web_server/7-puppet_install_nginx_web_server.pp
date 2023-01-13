#  Install Nginx web server (w/ Puppet)
exec {'/usr/bin/env sudo apt-get -y update': }
exec {'/usr/bin/env sudo apt-get -y install nginx': }
exec {'/usr/bin/env sudo ufw allow "Nginx HTTP"': }
exec {'/usr/bin/env sudo echo "Hello World!" |  /var/www/html/index.nginx-debian.html': }
exec {'/usr/bin/env sed -i "/server_name _;/ a\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default': }
exec {'/usr/bin/env sudo vim /var/www/html/error-404.html': }
exec {'/usr/bin/env  echo "Ceci n\'est pas une page" > /var/www/html/error-404.html': }
exec {'/usr/bin/env sed -i "/http {/ a\\\terror_page 404 /error-404.html;" /etc/nginx/nginx.conf': }
exec {'/usr/bin/env sudo service nginx restart': }
