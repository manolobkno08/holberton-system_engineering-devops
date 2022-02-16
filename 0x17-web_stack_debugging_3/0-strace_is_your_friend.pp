# Puppet bug fixed
include stdlib
file_line { 'debug':
  ensure => present,
  path   => 'var/www/html/wp-settings.php',
  line   => 'require_once( ABSPATH . WPINC . '/class-wp-locale.php' );',
  match  => 'require_once( ABSPATH . WPINC . '/class-wp-locale.phpp' );',
}
