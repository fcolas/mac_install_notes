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
read -p "Press [ENTER] to proceed"
print_and_run 'sudo apt-get install postfix'
print_and_run 'wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.8.0-omnibus-1_amd64.deb'
print_and_run 'sudo dpkg -i gitlab_7.8.0-omnibus-1_amd64.deb'
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
echo "external_url 'http://sancho.loria.fr:8080'"
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

# continuous integration
echo -e $Info"Setting up continuous integration..."$Off
echo -e $Action"Activate gitlab-ci by editing /etc/gitlab/gitlab.rb:"$Off
echo "ci_external_url 'http://sancho.loria.fr:8081"
read -p "Press [ENTER] when it's done"
print_and_run 'sudo gitlab-ctl reconfigure'
echo -e $Action"Follow instructions on http://sancho.loria.fr:8081 to generate app id and secret"$Off
read -p "Press [ENTER] when it's done"
echo -e $Action"Register gitlab_ci with secret by editing /etc/gitlab/gitlab.rb:"$Off
echo "gitlab_ci['gitlab_server'] = { 'url' => 'http://sancho.loria.fr:8080', 'app_id' => '<fill in>', 'app_secret' => '<fill it>' }"
read -p "Press [ENTER] when it's done"
print_and_run 'sudo gitlan-ctl reconfigure'

# gitlab runner
echo -e $Info"Setting up runner..."$Off
print_and_run 'wget https://s3-eu-west-1.amazonaws.com/downloads-packages/ubuntu-14.04/gitlab-runner_5.1.0~pre.omnibus.1-1_amd64.deb'
print_and_run 'sudo dpkg -i gitlab-runner_5.1.0~pre.omnibus.1-1_amd64.deb'
print_and_run 'sudo useradd -s /bin/false -m -r gitlab-runner'
echo -e $Info"Please fill in gitlab-ci url and token found on the gitlab-ci->runners page"$Off
print_and_run 'sudo /opt/gitlab-runner/bin/setup -C /home/gitlab-runner'
print_and_run 'sudo cp /opt/gitlab-runner/doc/install/upstart/gitlab-runner.conf /etc/init/'
print_and_run 'sudo service gitlab-runner start'

