#Debugging mode by changing WP_DEBUG to true run curl -4 to find error-> typo error
exec { 'Find500errorresponse':
  command => 'sed -i 's/define( "WP_DEBUG", false )/define( "WP_DEBUG", true )/g' /var/www/html/wp-config.php',
  path    =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
exec { 'Fixemptyresponse':
  command => 'sed -i 's//var/www/html/wp-includes/class-wp-locale.phpp//var/www/html/wp-includes/class-wp-locale.php/g' /var/www/html/wp-settings.php',
  path    =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
