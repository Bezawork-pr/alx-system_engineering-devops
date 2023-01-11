# Use puppet to configure SSH client to use our private key
file_line { 'Disable authentication':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    BatchMode yes',
}

file_line { 'Use private key provided':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    IdentityFile ~/.ssh/school',
}
