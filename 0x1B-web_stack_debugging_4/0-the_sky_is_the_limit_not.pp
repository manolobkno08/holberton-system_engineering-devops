# Change requests limit
exec { 'sed -i s/15/2000/g /etc/default/nginx':
  path     => '/usr/bin:/usr/sbin:/bin',
  provider => shell,
}

exec { 'sudo service nginx restart':
  path     => '/usr/bin:/usr/sbin:/bin',
  provider => shell,
}