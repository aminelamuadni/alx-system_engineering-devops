# Fixes an nginx site that can't handle multiple concurrent requests
# by increasing the file descriptor limit and restarting nginx

exec { 'increase-ulimit-for-nginx':
  command => "bash -c \"sed -iE 's/^ULIMIT=.*/ULIMIT=\"-n 8192\"/' /etc/default/nginx && service nginx restart\"",
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}
