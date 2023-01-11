# Use puppet to configure SSH client to use our private key
file_line { 'Disable password authentication':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthenticaion no',
}
file_line { 'Find ssh private key':
  ensure => 'present',
  path   =>'/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
}
