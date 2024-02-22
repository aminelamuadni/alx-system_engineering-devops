# This Puppet manifest increases Nginx's capacity to handle more concurrent connections
# by adjusting worker_processes and worker_connections.

class nginx_config {
  file { '/etc/nginx/nginx.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nginx/nginx.conf.erb'),
  }

  exec { 'reload-nginx':
    command     => '/usr/sbin/service nginx reload',
    refreshonly => true,
    subscribe   => File['/etc/nginx/nginx.conf'],
  }
}

include nginx_config
