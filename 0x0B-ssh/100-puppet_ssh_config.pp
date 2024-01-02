# Puppet manifest to configure SSH client settings
# - Sets the SSH client to use the private key ~/.ssh/school
# - Disables password authentication for SSH

include stdlib

file_line { 'Set identity file':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
  ensure => present,
}

file_line { 'Disable password authentication':
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  ensure => present,
}
