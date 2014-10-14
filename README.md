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
```

Now before you move on, decide if you would like to set up the environment with a clone of [asm-products/invoicerio](https://github.com/asm-products/invoicerio) or your own fork. On default, `asm-products/invoicerio` is cloned, but you can change the `bootstrap.sh` file and replace it with your fork repository.

Execute the following command to create the virtual development environment:

```bash
$ vagrant up
```

This will download a virtual machine image and start a bootstrap process that installs rails, postgresql and clone invoicerio. Running `vagrant up` for the first time will take a while so go grab a coffee.

## Usage
To launch invoicerio, execute the folowing (from the `vagrant-invoicerio` folder):

```bash
# The following command sshs into the vagrant virtual machine.
$ vagrant ssh

# Go to the invoicerio folder and start the rails server:
$ cd /vagrant/invoicerio

# Create the database etc, only execute this once.
$ bin/rake db:create db:migrate

# Start the server.
$ bin/rails server
```

Then point your browser on your host machine to [http://localhost:3100](http://localhost:3100) for the web-interface. Please keep in mind that the Vagrant box contains a rule that maps port 3000 from the guest machine to port 3100 on the host machine.

## Development
Note that Vagrant syncs the `vagrant-invoicerio` folder (on the host machine) with `/vagrant` (on the guest machine). Because we cloned `invoicerio` to the `/vagrant` directory, we can access invoicerio from the host machine and you can use your IDE from the host machine for development.

## Tips
Please read the [rwbox](https://github.com/le0pard/rwbox) README for more information or if you have trouble starting the virtual machine.

### Credentials

* MySQL:
  * root/vagrant
  * vagrant/vagrant
* PostgreSQL:
  * postgres/vagrant
  * vagrant/vagrant

### Reset the box
In order to reset the box, execute the following from the vagrant-invoicerio folder on the host:

```bash
# Reset the box, this will take a while.
$ vagrant destroy --force && vagrant up
```

**Note**: if the `/vagrant/invoicerio` directory exists it is backed up to `/vagrant/invoicerio_old_TIMESTAMP`.

### Port forwarding
Ports form this list are forwarded by default:

```
3000 => 3100
1080 => 1180
```

**NOTICE**: if you'll start mailcatcher gem and want to see mailcatcher inbox from outside – don't forget to use --ip option.

## Troubleshooting
If the `vagrant up` hangs at:

```bash
$        default: Warning: Remote connection disconnect. Retrying...
```

Just press `CTRL+c` and execute `vagrant up` again. I'm not sure what causes the hickup.