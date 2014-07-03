# Vagrant LNPP

[![Release](http://img.shields.io/github/release/kasperisager/vagrant-lnpp.svg?style=flat)](https://github.com/kasperisager/vagrant-lnpp/releases)

Vagrant LNPP gives you everything you need for developing PHP applications locally. It consists of a CoreOS box with Nginx, ~~Percona~~ MySQL, Memcached, PHP, and HHVM containers. The idea came from the need of having an OS-agnostic and virtualized alternative to the great [MNPP](http://getmnpp.org/) stack as regular LAMP stacks quite simply can't keep up with the Nginx + PHP-FPM/HHVM combo in terms of performance. I hope you'll find it as useful an addition to your dev-arsenal as I've found it!

## What's inside

* [CoreOS](https://coreos.com/)
* [Nginx](http://nginx.org/)
* [~~Percona~~](http://www.percona.com/) ([MySQL](http://www.mysql.com/) for now)
* [Memcached](http://memcached.org/)
* [PHP-FPM](http://php-fpm.org/)
* [HHVM](http://www.hhvm.com/)

## Getting started

To install Vagrant LNPP, simply download or clone the repo and do a `vagrant up`. You might want to grab a coffee while the Docker containers are built.

---
Copyright &copy; 2014 [Kasper Kronborg Isager](http://kasperisager.github.io). Licensed under the terms of the [MIT License](LICENSE.md)
