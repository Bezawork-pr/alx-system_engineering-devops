#  Install Nginx web server (w/ Puppet)
exec {'sudo apt-get -y update': }
exec {'sudo apt-get -y install nginx': }
exec {'sudo ufw allow "Nginx HTTP"': }
exec {'sudo echo "Hello World!" |  /var/www/html/index.nginx-debian.html': }
exec {'sed -i "/server_name _;/ a\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default': }
exec {'sudo vim /var/www/html/error-404.html': }
exec {'echo "Ceci n\'est pas une page" > /var/www/html/error-404.html': }
exec {'sed -i "/http {/ a\\\terror_page 404 /error-404.html;" /etc/nginx/nginx.conf': }
exec {'sudo service nginx restart': }
