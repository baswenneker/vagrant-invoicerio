#!/usr/bin/env bash

sudo apt-get update
#sudo apt-get install -y curl git
sudo apt-get install -y git nodejs

#cd /home/vagrant
#su -c "\curl -L https://get.rvm.io | bash -s stable" vagrant

#source /home/vagrant/.profile
#source /home/vagrant/.rvm/scripts/rvm

#rvm requirements
#rvm install ruby

# Install ruby-2.1.2 (required for invoicerio)
#rvm install ruby-2.1.2
#rvm use ruby-2.1.2 --default
#rvm rubygems current

# Install rails, might take a while so grab a coffee.
#gem install rails

# http://stackoverflow.com/questions/23822491/ruby-on-rails-permission-denied-when-using-rails-generate-controller-welcome
sudo chmod -R 1777 /tmp
sudo -u postgres dropdb vagrant
sudo -u postgres dropuser vagrant
sudo -u postgres createuser --superuser vagrant

if [ -d "/vagrant/invoicerio" ]
then
	mv -f /vagrant/invoicerio /vagrant/invoicerio_old_$(date +%F_%T)
fi

# Clone invoicerio to /vagrant/invoicerio. This directory is synced with the host OS
# so it's accessible for use with your favourite IDE.
git clone https://github.com/asm-products/invoicerio.git /vagrant/invoicerio
# Now cd into /vagrant/invoicerio and install all dependencies
cd /vagrant/invoicerio
#sudo apt-get install -y libpq-dev nodejs postgresql postgresql-contrib
bundle install

#sudo -u postgres createuser --superuser vagrant

#su -c "bin/rake db:create db:migrate" vagrant


#su -c "psql <<-SQL
#update pg_database set datistemplate=false where datname='template1';
#drop database Template1;
#create database template1 with owner=postgres encoding='UTF-8'
#	lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;
#update pg_database set datistemplate=true where datname='template1';
#SQL" postgres