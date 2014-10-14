# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "leopard/rwtrusty64"

  # Execute bootstrap.sh after initializing the vagrant box.
  config.vm.provision :shell, path: "bootstrap.sh"
  
  # Edit the line below if you get port mapping conflicts. This rule
  # maps the rails server port on guest to port 3000 on the host. On
  # the host use localhost:3000 to access the rails server.
  # config.vm.network :forwarded_port, guest: 3000, host: 3000

  #config.vm.provider :virtualbox do |vb|
  #	vb.gui = true
  #end
end
