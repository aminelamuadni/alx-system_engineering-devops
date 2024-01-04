# Puppet script to install Nginx, serve a custom HTML page, and configure a 301 redirect

# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

# Create a simple Hello World HTML file
file { '/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
}

# Configure redirection
exec { 'insert_nginx_301_redirect':
  command => "sed -i '/server_name _;/a \    location /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }' /etc/nginx/sites-available/default",
  path    => ['/usr/bin', '/usr/sbin'],
  onlyif  => "grep -q 'server_name _;' /etc/nginx/sites-available/default",
  unless  => "grep -q 'location /redirect_me' /etc/nginx/sites-available/default",
  require => Package['nginx'],
  notify  => Service['nginx'],
}
