FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y openssh-server

RUN mkdir -p /var/run/sshd

VOLUME ["/var/lib/mysql"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
