# Found issue with command cat /proc/$(pidof nginx | awk '{print $1}')/limits | grep "Max open files"
exec { 'edit_file':
  command => 'sed -i s/15/4096/g /etc/default/nginx && service nginx restart',
  path    =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
}
