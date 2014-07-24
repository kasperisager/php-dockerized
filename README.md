# Fig PHPStack

Fig PHPStack gives you everything you need for developing PHP applications locally. The idea came from the need of having an OS-agnostic and virtualized alternative to the great [MNPP](http://getmnpp.org/) stack as regular LAMP stacks quite simply can't keep up with the Nginx + PHP-FPM/HHVM combo in terms of performance. I hope you'll find it as useful an addition to your dev-arsenal as I've found it!

## What's inside

* [CoreOS](https://coreos.com/) (optional)
* [Nginx](http://nginx.org/)
* [MySQL](http://www.mysql.com/)
* [PHP-FPM](http://php-fpm.org/)
* [HHVM](http://www.hhvm.com/)
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/)

## Getting started

### Requirements

* [Docker](https://docker.com/)
* [Fig](http://orchardup.github.io/fig/)
* [Vagrant](http://www.vagrantup.com/) (optional)
* [VirtualBox](https://www.virtualbox.org/) (optional)

### Instructions

```sh
# Clone the repository (using hub)
$ git clone kasperisager/vagrant-lnpp
$ cd vagrant-lnpp

# (Optional) Boot up a CoreOS box
$ vagrant up

# Boot up the Docker containers
$ fig up
```

> If you're using the CoreOS box, make sure to set your `DOCKER_HOST` so Fig knows where to boot up the Docker containers.

---
Copyright &copy; 2014 [Kasper Kronborg Isager](http://github.com/kasperisager). Licensed under the terms of the [MIT License](LICENSE.md)
