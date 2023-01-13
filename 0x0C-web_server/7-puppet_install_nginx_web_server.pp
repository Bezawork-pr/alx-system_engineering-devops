#  Install Nginx web server (w/ Puppet)
package { 'nginx':
  provider => 'apt',
}
exec {'modify_html_file':
  command => '/usr/bin/sudo /bin/echo Hello World! >  /var/www/html/index.nginx-debian.html',
}
exec {'redirect':
  command => '/usr/bin/sudo /bin/sed -i "/server_name _;/ a\\\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
}
exec {'reload':
  command => '/usr/bin/sudo /usr/sbin/service nginx start',
}
