# Increase file descriptor limits for the holberton user
exec { 'change-os-configuration-for-holberton-user':
  command => "/usr/bin/env sed -i '/^# End of file/i\\holberton soft nofile 4096\\nholberton hard nofile 8192' /etc/security/limits.conf",
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
  unless  => "/bin/grep -q 'holberton .* nofile' /etc/security/limits.conf",
}
