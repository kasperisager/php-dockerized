# PHP Dockerized (Cemsites edition)

> Dockerized PHP development stack: Nginx, MySQL, <s>MongoDB</s>, PHP-FPM, HHVM, Memcached, <s>Redis</s>, <s>Elasticsearch</s> and <s>RabbitMQ</s>

[![Build Status](https://travis-ci.org/kasperisager/php-dockerized.svg)](https://travis-ci.org/kasperisager/php-dockerized)

PHP Dockerized gives you everything you need for developing PHP applications locally. The idea came from the need of having an OS-agnostic and virtualized alternative to the great [MNPP](https://github.com/jyr/MNPP) stack as regular LAMP stacks quite simply can't keep up with the Nginx + PHP-FPM/HHVM combo in terms of performance. I hope you'll find it as useful an addition to your dev-arsenal as I've found it!

#### Additionally, for running local wordpress sites a couple of extra steps must be taken.
1. Your site should relocated to `php-dockerized/www/default` within the vm. This can be accomplished with SCP or mounting a VM shared folder
2. Inside the vm update your `wp-config.php` to point to the new database host at `mysql` (this is an alias to the mysql container us it like you would `localhost`)
3. Inside the vm update your db username and password in `wp-config.php` for this installation use the following defaults
  - username: `root`
  - password: `password`
4. On your host must update your hosts file by adding a line like this

  ```hosts
  <vm_ip> <domain_name from wp-config.php>
  ```
5. To obtain the ip of the running VM you can either run
  - `ifconfig` within the vm
  - `/Applications/VMware\ Fusion.app/Contents/Library/vmrun getGuestIPAddress` from your host (getGuestIPAddress requires the running VMs vmx file as info so the full command is something like this)
    
    ```sh
    $ /Applications/VMware\ Fusion.app/Contents/Library/vmrun getGuestIPAddress ~/Documents/Virtual\ Machines.localized/site.vmwarevm/site.vmx
    ```
    
Once that setup is complete you can visit the normal domain name from your host and your site will load. To verify the hosts is configured correctly you can disable your wifi and the site will still load.

## What's inside

* [Nginx](http://nginx.org/)
* [MySQL](http://www.mysql.com/)
* <s>[MongoDB](http://www.mongodb.org/)</s>
* [PHP-FPM](http://php-fpm.org/)
* [HHVM](http://www.hhvm.com/)
* [Memcached](http://memcached.org/)
* <s>[Redis](http://redis.io/)</s>
* <s>[Elasticsearch](http://www.elasticsearch.org/)</s>
* <s>[RabbitMQ](https://www.rabbitmq.com/)</s>

## Requirements

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows only)

## Running

Set up a Docker Machine and then run:

```sh
$ docker-compose build
$ docker-compose create
$ docker-compose start
```

From then on you can just run
```sh
docker-compose start
```
Or
```sh
$ docker-compose stop
```

### Notes
The vm doesn't seem to handle the combination of docker and suspend very well so just assume when you are not using this you are going to shut the vm down.

That's it! You can now access your configured sites via the IP address of the Docker Machine or locally if you're running a Linux flavour and using Docker natively.

## License

Copyright &copy; 2014-2016 [Kasper Kronborg Isager](http://github.com/kasperisager). Licensed under the terms of the [MIT license](LICENSE.md).
