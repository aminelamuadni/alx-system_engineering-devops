# Kills a process named 'killmenow' using the pkill command
exec { 'killmenow':
  command     => 'pkill -f killmenow',
  path        => ['/bin', '/usr/bin', '/usr/local/bin'],
}
