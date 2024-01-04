# Ensure Nginx is installed
package { 'nginx':
    ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
}

# Create a simple Hello World HTML file
file { '/var/www/html/index.nginx-debian.html':
    ensure  => file,
    content => 'Hello World!',
    require => Package['nginx'],
    notify  => Service['nginx'],
}

# Create a custom 404 page
file { '/var/www/html/custom_404.html':
    ensure  => file,
    content => "Ceci n'est pas une page",
    require => Package['nginx'],
    notify  => Service['nginx'],
}

# Configure redirection and custom 404 error page
exec { 'configure_nginx':
    command => "sed -i '/server_name _;/a location /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }' /etc/nginx/sites-available/default && sed -i '/server_name _;/a error_page 404 /custom_404.html;' /etc/nginx/sites-available/default",
    require => Package['nginx'],
    notify  => Service['nginx'],
    unless  => "grep -q 'location /redirect_me' /etc/nginx/sites-available/default",
}
