# Kill process:

exec { 'killmenow':
  command => 'pkill -f killmenow',
}

