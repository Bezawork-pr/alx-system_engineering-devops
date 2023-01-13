# configure ssh_config to use the private key ~/.ssh/school using puppet
include stdlib

file_line { 'Disable_password_authentication':
  ensure  => 'present',
  path    => '/etc/ssh/ssh_config',
  line    => '    BatchMode yes',
  replace => true,
}

file_line { 'Use_private_key':
  ensure  => 'present',
  path    => '/etc/ssh/ssh_config',                                                                                             
  line    => '    IdentityFile ~/.ssh/school',                                                                                      
  replace => true,                                                                                                              
} 
