# Use puppet to configure SSH client to use our private key
# And refuse password authentication
file_line {'Disable password authentication':
  path  => '/etc/ssh/ssh_config',
  match => 'BatchMode*.',
  line  => 'BatchMode yes',
}
file_line {'Find ssh private key':
  path  =>'/etc/ssh/ssh_config',
  match => 'IdentityFile*.',
  line  => 'IdentityFile ~/.ssh/school',
}
