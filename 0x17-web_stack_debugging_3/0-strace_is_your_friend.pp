# 0-strace_is_your_friend.pp
# Puppet manifest to correct a typo in WordPress files

exec { 'fix-wp-locale-typo':
  command => "find /var/www/html -type f -name '*.php' -exec sed -i 's/class-wp-locale.phpp/class-wp-locale.php/g' {} +",
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
  onlyif  => "find /var/www/html -type f -name '*.php' -exec grep -l 'class-wp-locale.phpp' {} +",
}
