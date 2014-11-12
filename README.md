# Fig PHPStack

Fig PHPStack gives you everything you need for developing PHP applications locally. The idea came from the need of having an OS-agnostic and virtualized alternative to the great [MNPP](http://getmnpp.org/) stack as regular LAMP stacks quite simply can't keep up with the Nginx + PHP-FPM/HHVM combo in terms of performance. I hope you'll find it as useful an addition to your dev-arsenal as I've found it!

## What's inside

* [CoreOS](https://coreos.com/) (optional)
* [Shipyard](http://shipyard-project.com/)
* [Nginx](http://nginx.org/)
* [MySQL](http://www.mysql.com/)
* [MongoDB](http://www.mongodb.org/)
* [PHP-FPM](http://php-fpm.org/)
* [HHVM](http://www.hhvm.com/)
* [Memcached](http://memcached.org/)
* [Redis](http://redis.io/)
* [Elasticsearch](http://www.elasticsearch.org/)

## Getting started

### Requirements

* [Docker](https://docker.com/)
* [Fig](http://orchardup.github.io/fig/)
* [Vagrant](http://www.vagrantup.com/) (optional)
* [VirtualBox](https://www.virtualbox.org/) (optional)

### Instructions

```sh
# Clone the repository (using hub)
$ git clone kasperisager/fig-phpstack
$ cd fig-phpstack

# (Optional) Boot up a CoreOS box
$ vagrant up

# Boot up the Docker containers
$ fig up
```

> If you're using the CoreOS box, make sure to set your `DOCKER_HOST` so Fig knows where to boot up the Docker containers.

Once everything is up and running, you can access Shipyard at `http://<ip>:8080`. The default user credentials are `admin:shipyard`. Once logged in, you will need to add an engine with an address of `http://<ip>:2375` to see the local containers.

The IP is in both cases either `127.0.0.1` or your Vagrant IP (`192.168.33.10` by default).

---
Copyright &copy; 2014 [Kasper Kronborg Isager](http://github.com/kasperisager). Licensed under the terms of the [MIT License](LICENSE.md).
