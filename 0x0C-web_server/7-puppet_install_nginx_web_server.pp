#!/usr/bin/env bash
# nginx_config.pp

class { 'nginx':
  ensure => 'installed',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Class['nginx'],
}

file { '/etc/nginx/sites-available/default':
  content => template('nginx/default.erb'),
  require => Class['nginx'],
}

file { '/var/www/html/404.html':
  content => 'Ceci n\'est pas une page',
  require => Class['nginx'],
}

nginx::resource::vhost { 'default':
  ensure       => present,
  www_root     => '/var/www/html',
  listen_port  => '80',
  server_name  => '_',
  error_page   => '404 /404.html',
}

nginx::resource::location { '/redirect_me':
  ensure       => present,
  location     => '/redirect_me',
  vhost        => 'default',
  rewrite      => '^/redirect_me$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent',
}
