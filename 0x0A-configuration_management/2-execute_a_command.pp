# Kills a process named 'killmenow' using the pkill command
exec { 'killmenow':
  command   => 'pkill -f killmenow',
  path      => ['/usr/bin', '/usr/sbin'],
  returns   => ['0', '1'],
  logoutput => true,
}
