# Puppet manifest to increase nofile limit for Nginx and restart the service
exec { 'fix--for-nginx':
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/bin', '/usr/bin'],
  unless  => "grep -q '4096' /etc/default/nginx",
}
exec { 'restart-nginx':
  command     => '/etc/init.d/nginx restart',
  path        => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  refreshonly => true,
  subscribe   => Exec['fix--for-nginx'],
}
