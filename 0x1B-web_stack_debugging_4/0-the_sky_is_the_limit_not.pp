# Fixes an nginx site that can't handle multiple concurrent requests
# by increasing the file descriptor limit and restarting nginx

exec { 'increase-ulimit-for-nginx':
  command => "sed -i 's/worker_processes 4;/worker_processes 7;/g' /etc/nginx/nginx.conf; sudo service nginx restart",
  path    => ['/usr/bin', '/usr/sbin', '/bin'],
}
