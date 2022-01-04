# Kill process:

exec { 'killmenow':
  command => 'pkill',
}

