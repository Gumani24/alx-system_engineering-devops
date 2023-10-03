#!/usr/bin/env bash
# use puppet to connect without password

file { '/etc/ssh/ssh_config':
	ensure => present,

content =>"

	#SSH Client configuration
	host*
	IdentityFile ~/alx-system_engineering-devops/0x0B-ssh/school
	PasswordAuthentication no
}
