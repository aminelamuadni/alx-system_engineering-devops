# This manifest kills a process named 'killmenow' using the pkill command

# Exec resource type is used to execute commands
exec { 'killmenow':
  command     => 'pkill -9 killmenow',
  path        => '/usr/bin',
}
