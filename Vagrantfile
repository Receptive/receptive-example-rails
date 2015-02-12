# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/fedora-20"  
  config.vm.network "forwarded_port", guest: 3000, host: 3001
  config.vm.synced_folder "./", "/home/vagrant/receptive-example-rails"
  config.vm.hostname = "receptive-example-rails"
  config.vm.provision :shell, path: "./bootstrap.sh"
end
