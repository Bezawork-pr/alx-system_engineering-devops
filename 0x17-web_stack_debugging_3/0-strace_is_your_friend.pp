#Debugging mode by changing WP_DEBUG to true run curl -4 to find error-> typo error
exec { 'Fixemptyresponse':
  command => '/bin/sed -i s/phpp/php/g /var/www/html/wp-settings.php',
}
