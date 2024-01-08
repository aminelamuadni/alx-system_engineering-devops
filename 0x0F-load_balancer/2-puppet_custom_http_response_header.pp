# Puppet script to install Nginx, and add a custom HTTP header

# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

# Add custom HTTP header
exec { 'insert_custom_http_header':
  command => "sed -i '/server_name _;/a \    add_header X-Served-By \$hostname;' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  onlyif  => "grep -q 'server_name _;' /etc/nginx/sites-available/default",
  unless  => "grep -q 'add_header X-Served-By' /etc/nginx/sites-available/default",
  require => Package['nginx'],
  notify  => Service['nginx'],
}
