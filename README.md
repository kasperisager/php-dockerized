# Vagrant LNPP

[![Release](http://img.shields.io/github/release/kasperisager/vagrant-lnpp.svg?style=flat)](https://github.com/kasperisager/vagrant-lnpp/releases)

Vagrant LNPP gives you everything you need for developing PHP applications locally. The idea came from the need of having an OS-agnostic and virtualized alternative to the great [MNPP](http://getmnpp.org/) stack as regular LAMP stacks quite simply can't keep up with the Nginx + PHP-FPM/HHVM combo in terms of performance. I hope you'll find it as useful an addition to your dev-arsenal as I've found it!

## What's inside

* [CoreOS](https://coreos.com/) (optional)
* [Nginx](http://nginx.org/)
* [~~Percona~~](http://www.percona.com/) ([MySQL](http://www.mysql.com/) for now)
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

```sh
# Clone the repository (using hub)
$ git clone kasperisager/vagrant-lnpp
$ cd vagrant-lnpp

# (Optional) Boot up a Docker-compatible box
$ vagrant up

# Boot up the Docker containers
$ fig up
```

> If using Vagrant, make sure to set your `DOCKER_HOST` so Fig knows where to boot up the Docker containers.

---
Copyright &copy; 2014 [Kasper Kronborg Isager](http://github.com/kasperisager). Licensed under the terms of the [MIT License](LICENSE.md)
