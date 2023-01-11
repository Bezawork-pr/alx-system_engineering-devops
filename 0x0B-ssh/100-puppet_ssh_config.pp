# configure ssh_config to use the private key ~/.ssh/school using puppet
# configure ssh_config to refuse to authenticate using a password using puppet
file_line { 'Disable_password_authentication':
  path => '/etc/ssh/ssh_config',
  line => 'BatchMode yes',
}
file_line { 'Use_private_key':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
}
