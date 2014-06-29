FROM debian:wheezy
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get update
RUN apt-get upgrade -y

# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -s /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server mysql-client libmysqlclient-dev
RUN apt-get clean

# RUN rm /sbin/initctl
# RUN dpkg-divert --local --rename --remove /sbin/initctl

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
EXPOSE 3306

ADD ./mysql_flush_privelegies.sh /tmp/mysql_flush_privelegies.sh
RUN /bin/sh /tmp/mysql_flush_privelegies.sh

CMD ["mysqld"]
