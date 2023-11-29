# creates a manifest that kills a process called killmenow
exec { 'killmenow_process':
  command     => 'pkill killmenow',
  refreshonly => true,
}
