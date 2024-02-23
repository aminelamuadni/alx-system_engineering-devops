# Puppet manifest to adjust file descriptor limits for the holberton user

exec { 'set-holberton-soft-nofile':
  command => "sed -i '/^holberton soft nofile/s/[[:digit:]]\\+/50000/' /etc/security/limits.conf",
  path    => ['/usr/local/bin/', '/bin/'],
}

exec { 'set-holberton-hard-nofile':
  command => "sed -i '/^holberton hard nofile/s/[[:digit:]]\\+/50000/' /etc/security/limits.conf",
  path    => ['/usr/local/bin/', '/bin/'],
}
