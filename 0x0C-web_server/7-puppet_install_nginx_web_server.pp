#  Install Nginx web server (w/ Puppet)
exec {'sudo apt update': 
  command => 'sudo apt-get -y update',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
exec {'install nginx':
  command => 'sudo apt-get -y install nginx',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],  
}
exec {'sudo ufw allow "Nginx HTTP"':
  command => 'sudo ufw allow "Nginx HTTP"',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],  
}
exec {'update index.nginx-debian.html':
  command => 'sudo echo "Hello World!" |  /var/www/html/index.nginx-debian.html',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],  
}
exec {'Edit /etc/nginx/sites-available/default':
  command => 'sed -i "/server_name _;/ a\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
exec {'create /var/www/html/error-404.html':
  command => 'sudo vim /var/www/html/error-404.html',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
exec {'echo "Ceci n\'est pas une page" in error file':
  command => 'echo "Ceci n\'est pas une page" > /var/www/html/error-404.html',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
exec {'Edit /etc/nginx/nginx.conf':
  command => 'sed -i "/http {/ a\\\terror_page 404 /error-404.html;" /etc/nginx/nginx.conf',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
exec {'Restart':
  command => 'sudo service nginx restart',
  path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
