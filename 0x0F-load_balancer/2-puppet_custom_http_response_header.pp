# Add a custom HTTP header with Puppet

$hname="add_header X-Served-By ${hostname};"

exec { 'update' :
  command => '/usr/bin/apt-get update',
}
-> package { 'nginx' :
  ensure  => installed,
  require => Exec['update']
}
-> file_line { 'Add redirection, 301' :
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 defatul_server;',
  line   => 'rewrite ^/redirect_me https://www.linkedin.com/in/manuel-alejandro-gomez-883951120/ permanent;',
}
-> file_line { 'Add custom HTTP server' :
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 defatul_server;',
  line   => $hname,
}
-> file { '/var/www/html/index.html' :
  content => 'Hello World',
}
-> service { 'nginx' :
  ensure  => running,
  require => Package['nginx'],
}
