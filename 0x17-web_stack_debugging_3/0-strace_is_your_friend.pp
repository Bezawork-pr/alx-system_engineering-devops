#Debugging mode by changing WP_DEBUG to true run curl -4 to find error-> typo error
exec { 'Fixemptyresponse':
  command => 'sed -i 's/class-wp-locale.phpp/class-wp-locale.php/g' /var/www/html/wp-settings.php',
  path    =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
