#!/usr/bin/env bash

# @author Bas Wenneker
# @email: <b.wenneker@gmail.com>
# @website: https://github.com/baswenneker

sudo apt-get update
sudo apt-get install -y git nodejs

# Prevent some error messages, make /tmp writable
# see http://stackoverflow.com/questions/23822491/ruby-on-rails-permission-denied-when-using-rails-generate-controller-welcome
sudo chmod -R 1777 /tmp

# Fix a permission issue with leopard/rwtrusty vagrant box:
sudo -u postgres dropdb vagrant
sudo -u postgres dropuser vagrant
sudo -u postgres createuser --superuser vagrant

# Create a backup of the /vagrant/invoicerio folder if it exists.
if [ -d "/vagrant/invoicerio" ]
then
	mv -f /vagrant/invoicerio /vagrant/invoicerio_old_$(date +%F_%T)
fi

# Clone invoicerio to /vagrant/invoicerio. This directory is synced with the 
# host OS so it's accessible for use with your favourite IDE.

#######################################################
####### REPLACE WITH YOUR OWN FORK IF YOU WANT ########
#######################################################
git clone https://github.com/asm-products/invoicerio.git /vagrant/invoicerio
#######################################################
####### REPLACE WITH YOUR OWN FORK IF YOU WANT ########
#######################################################

# Now cd into /vagrant/invoicerio and install all dependencies:
cd /vagrant/invoicerio
bundle install