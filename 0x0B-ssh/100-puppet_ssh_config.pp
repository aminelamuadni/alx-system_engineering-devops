file_line { 'Declare identity file':
  path => '/home/vagrant/.ssh/config',
  line => 'IdentityFile ~/.ssh/school',
  ensure => present,
}

file_line { 'Turn off passwd auth':
  path => '/home/vagrant/.ssh/config',
  line => 'PasswordAuthentication no',
  ensure => present,
}
