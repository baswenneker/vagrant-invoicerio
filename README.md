# vagrant-invoicerio

`vagrant-invoicerio` creates and configures a portable, reproducible and lightweight virtual development environment for [invoicerio](https://github.com/asm-products/invoicerio).

This project uses [rwbox](https://github.com/le0pard/rwbox) as basebox (Ubuntu 14.04).

>RWBox contains:
> - RVM with compiled Ruby 1.9.3-p547, 2.0.0-p481, 2.1.2, jruby-1.7.12
> - MySQL, PostgreSQL, Redis and Memcached
> - Dev libs for pg, mysql2, rmagick, curb and another gems

## Installation
First, make sure you have the latest version of [Vagrant](http://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed.

Then, do: 
```bash
$ git clone https://github.com/baswenneker/vagrant-invoicerio.git
$ cd vagrant-invoicerio
$ vagrant up
```

This will download a virtual machine image and start a bootstrap process that installs rails, postgresql and clone invoicerio. Running `vagrant up` for the first time will take a while so go grab a coffee.

## Usage
Note that Vagrant syncs the `vagrant-invoicerio` folder (on the host machine) with `/vagrant` (on the guest machine) so you can use your IDE from the host machine to develop code.

To launch invoicerio, execute the folowing (from the `vagrant-invoicerio` folder):

```bash
# If not done already, initialize the virtual guest box.
$ cd vagrant-invoicerio
$ vagrant up 

# The following command sshs into the vagrant virtual machine.
$ vagrant ssh

# Go to the invoicerio folder and start the rails server:
$ cd /vagrant/invoicerio
$ bin/rails server
```

Then point your browser on the host machine to [http://localhost:3000](http://localhost:3000) for the web-interface. Please keep in mind that the `Vagrantfile` contains a rule that maps port 3000 from the guest machine to port 3000 on the host machine. Edit the line if you get port mapping conflicts during `vagrant up`.

### Reset the box
In order to reset the box, execute the following from the vagrant-invoicerio folder on the host:

```bash
# Remote the git clone, make sure all changes are pushed to the remote repo.
$ rm -rf vagrant-invoicerio
# Reset the box, this will take a while.
$ vagrant destroy --force && vagrant up
```

## Tips
Please read the [rwbox](https://github.com/le0pard/rwbox) README for more information or if you have trouble starting the virtual machine.

### Credentials

* MySQL:
  * root/vagrant
  * vagrant/vagrant
* PostgreSQL:
  * postgres/vagrant
  * vagrant/vagrant


### Port forwarding
Ports form this list are forwarded by default:

```
3000 => 3100
1080 => 1180
```

**NOTICE**: if you'll start mailcatcher gem and want to see mailcatcher inbox from outside – don't forget to use --ip option.