#!/bin/bash

function print_and_run {
	echo "$ "$1
	$1
}
Off="\033[0m"
Info="\033[1;34m"
Action="\033[0;31m"

# gitlab
echo -e $Info"Installing gitlab"$Off
print_and_run 'sudo apt-get install openssh-server'
echo -e $Action"Select 'internet site' for postfix setup:"$Off
read =p "Press [ENTER] to proceed"
print_and_run 'sudo apt-get install postfix'
print_and_run 'wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb'
print_and_run 'sudo dpkg -i gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb'
print_and_run 'sudo gitlab-ctl reconfigure'

# LDAP integration
echo -e $Action"Activate and setup LDAP by editing /etc/gitlab/gitlab.rb:"$Off
echo "gitlab_rails['ldap_enabled'] = true"
echo "    host: 'ildap.inria.fr'"
echo "    uid: 'inriaLogin'"
echo "    bind_dn: ''"
echo "    password: ''"
echo "    base: 'ou=people,dc=inria,dc=fr'"
read -p "Press [ENTER] when it's done"
print_and_run 'sudo gitlab-ctl reconfigure'

# redirection
echo -e $Action"Change ssh port by editing /etc/gitlab/gitlab.rb:"$Off
echo "external_url 'http://sancho:8080'"
echo "..."
echo "gitlab_rails['gitlab_shell_ssh_port'] = 2222"
echo "..."
echo "unicorn['port'] = 8888"
read -p "Press [ENTER] when it's done"
print_and_run 'sudo gitlab-ctl reconfigure'
echo -e $Action"Configure port forwarding on NAT interface of virtual machine:"$Off
echo "gitlab; TCP; ; 8080; 192.168.56.102; 8080"
echo "ssh; TCP; ; 2222; 192.168.56.102; 22"
read -p "Press [ENTER] when it's done"
