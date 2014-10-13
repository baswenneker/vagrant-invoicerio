#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y curl git

cd /home/vagrant
su -c "\curl -L https://get.rvm.io | bash -s stable" vagrant

source /home/vagrant/.profile
source /home/vagrant/.rvm/scripts/rvm

rvm requirements
rvm install ruby

# Install ruby-2.1.2 (required for invoicerio)
rvm install ruby-2.1.2
rvm use ruby-2.1.2 --default
rvm rubygems current

# Install rails, might take a while so grab a coffee.
gem install rails

# Clone invoicerio to /vagrant/invoicerio. This directory is synced with the host OS
# so it's accessible for use with your favourite IDE.
git clone https://github.com/asm-products/invoicerio.git /vagrant/invoicerio

# Now cd into /vagrant/invoicerio and install all dependencies
cd /vagrant/invoicerio
sudo apt-get install -y libpq-dev
bundle install