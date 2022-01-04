# Puppet

include stdlib

file_line { 'file':
  path    => '/etc/ssh/ssh_config',
  line    => '	IdentityFile ~/.ssh/school',
  replace => 'true',
}

file_line { 'skip password':
4   path    => '/etc/ssh/ssh_config',
5   line    => '     PasswordAuthentication no',
6   replace => 'true',
7 }

