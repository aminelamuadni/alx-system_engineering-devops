# 0-strace_is_your_friend.pp
# This Puppet manifest corrects a typo in the WordPress configuration file

exec { 'correct_wp_settings_typo':
  command => "sudo sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
  path    => ['/usr/bin', '/usr/sbin'],
  unless  => "sudo grep -qv 'phpp' /var/www/html/wp-settings.php",
}
