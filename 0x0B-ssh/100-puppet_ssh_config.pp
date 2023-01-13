# configure ssh_config to use the private key ~/.ssh/school using puppet
include stdlib

file_line { 'Disable_password_authentication':
  path    => '/etc/ssh/ssh_config',
  line    => 'BatchMode yes',
  replace => true,
}

