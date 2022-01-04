# Puppet

exec { 'Config':
  command  => 'ssh -i ~/.ssh/school ubuntu@35.237.25.66; PasswordAuthentication no',
  provider => 'shell',
}

