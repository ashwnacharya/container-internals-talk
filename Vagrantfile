# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-7"

  config.vm.provision "shell", privileged: true, inline: <<-SHELL

    echo "Setting max user namespaces"
    echo 640 > /proc/sys/user/max_user_namespaces

    pushd /tmp
    echo "Installing golang"
    curl -LO https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz

    tar -C /usr/local -xvzf go1.7.linux-amd64.tar.gz

    touch /etc/profile.d/go.sh
    chmod 0666 /etc/profile.d/go.sh
    echo export PATH=$PATH:/usr/local/go/bin >> /etc/profile.d/go.sh

    echo "Installing docker"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    systemctl daemon-reload
    service docker restart
    
  
    # echo "Installing perl"
    # yum groupinstall -y 'Development Tools'
    # yum install -y perl
    # yum install -y 'perl(ExtUtils::MakeMaker)'

    # echo "Downloading buildroot"
    # curl https://www.buildroot.org/downloads/buildroot-2019.02.tar.bz2 | tar jx

  SHELL
end
