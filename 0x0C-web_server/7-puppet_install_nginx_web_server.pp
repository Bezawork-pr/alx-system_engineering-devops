#  Install Nginx web server (w/ Puppet)
package { 'nginx':
  provider => 'apt',
}
exec {'/usr/bin/sudo echo "Hello World!" |  /var/www/html/index.nginx-debian.html': }
exec {'/usr/bin/sudo sed -i "/server_name _;/ a\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default': }
exec {'/usr/bin/sudo service nginx start': }
