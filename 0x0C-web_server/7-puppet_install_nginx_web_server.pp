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

# Configure redirection and custom 404 error page
file_line { 'nginx_301_redirect':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  line   => '    location /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }',
  after  => '^server_name _;',
}
