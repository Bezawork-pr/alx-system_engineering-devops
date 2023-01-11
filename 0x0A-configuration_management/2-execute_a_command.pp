# Using Puppet, create a manifest that kills a process named killmenow
exec {'pkill':
  command => 'pkill -15 killmenow',
  path =>  [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
