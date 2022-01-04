# Kill process:

exec { 'killmenow':
  pkill => 'killmenow',
}

