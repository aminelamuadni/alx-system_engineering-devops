# 0-strace_is_your_friend.pp
# Fixes a typo in the wp-settings.php file for a WordPress installation

class wordpress_typo_fix {

  exec { 'fix-wp-settings-typo':
    command => "sudo sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
    path    => ['/usr/bin', '/usr/sbin'],
    onlyif  => "sudo grep -q 'phpp' /var/www/html/wp-settings.php",
  }

}

include wordpress_typo_fix
