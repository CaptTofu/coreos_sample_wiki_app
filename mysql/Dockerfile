FROM ubuntu

MAINTAINER Patrick Galbraith <patg@hp.com>

# avoid debconf and initrd
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN apt-get update
RUN apt-get install -y supervisor mysql-server mysql-client -y

# setup mysql
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
ADD mediawiki.sql /tmp/mediawiki.sql
ADD db_setup.sh /tmp/db_setup.sh
RUN /bin/sh /tmp/db_setup.sh

# clean packages
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# expose mysql port
EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ADD mysql.conf /etc/supervisor/conf.d/mysql.conf
ADD run.sh /run.sh

# start supervisor
CMD ["/run.sh"]
