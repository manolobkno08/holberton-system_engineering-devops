# Kill process:

exec { 'kill':
  command  => 'pkill -f killmenow',
  provider => 'shell',
}

