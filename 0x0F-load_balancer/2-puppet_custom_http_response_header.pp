#!/usr/bin/env bash
#install nginx add header, 404 page and redirect
exec {'Update':
  command  => 'sudo apt-get update',
  provider => present,
}
package {'nginx':
  ensure => present,
}
file_line {'file':
  ensure => present,
  path }
