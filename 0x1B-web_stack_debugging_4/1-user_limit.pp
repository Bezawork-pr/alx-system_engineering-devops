# Change the OS configuration so that it is possible to login with the holberton user
exec {'modify_limits_config_1':
  command  => 'sed -i s/6/4096/g /etc/security/limits.conf && sed -i s/5/4096/g /etc/security/limits.conf',
  provider => shell,
}
