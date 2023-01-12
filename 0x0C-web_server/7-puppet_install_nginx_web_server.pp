#  Install Nginx web server (w/ Puppet)
exec {'sudo apt-get -y update': }
exec {'sudo apt-get -y install nginx': }
exec {'sudo ufw allow "Nginx HTTP"': }
exec {'echo "Hello World!" > /var/www/html/index.html': }
exec {'sed -i '/listen 80 default_server;/a rewrite ˆ/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent' /etc/nginx/sites-available/default': }
exec {'sudo nano /usr/share/nginx/html/custom_404.html': }
exec {'echo "Ceci n'est pas une page" > /usr/share/nginx/html/custom_404.html': }
