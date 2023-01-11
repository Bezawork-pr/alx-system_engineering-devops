# Using Puppet, create a manifest that kills a process named killmenow
exec {'pkill -15 killmenow':
  command => 'pkill -15 killmenow',
  path =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
