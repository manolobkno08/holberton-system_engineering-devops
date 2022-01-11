# Add a custom HTTP header with Puppet

$hname="add_header X-Served-By ${hostname};";

exec { 'update' :
  command => '/user/bin/apt-get update',
}
-> package { 'nginx' :
  ensure  => installed,
  require => Exec['update'],
}
-> file_line { 'redirection' :
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 defatul_server;',
  line   => 'rewrite ^/redirect_me https://www.linkedin.com/in/manuel-alejandro-gomez-883951120/ permanent;',
}
-> file_line { 'custom http server' :
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 defatul_server;',
  line   => $hname,
}
-> file { '/var/www/html/index.html' :
  content => 'Hello World',
}
-> services { 'nginx' :
  ensure  => 'running',
  require => Package['nginx'],
}
