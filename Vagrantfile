# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise32"

  # Execute bootstrap.sh after initializing the vagrant box.
  config.vm.provision :shell, path: "bootstrap.sh"
  
  
  config.vm.network :forwarded_port, guest: 3000, host: 3000
end