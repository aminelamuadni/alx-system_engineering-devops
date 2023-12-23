# This manifest kills a process named 'killmenow' using the pkill command

# Exec resource type is used to execute commands
exec { 'killmenow':
  command     => 'pkill -f killmenow',    # Command to kill the 'killmenow' process
  path        => ['/bin', '/usr/bin', '/usr/local/bin'], # Path where the command is executed
  refreshonly => true,                    # Only execute this command when notified by another resource
}
