# This manifest kills a process named 'killmenow' using the pkill command

# Exec resource type is used to execute commands
exec { 'killmenow':
  command     => 'pkill -f killmenow',
  path        => '/bin', '/usr/bin',
}
