FROM debian:wheezy
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get update
RUN apt-get upgrade -y

# Installing ruby

RUN apt-get install -y calendarserver supervisor

RUN useradd memcached
ADD supervisord.conf /supervisord/supervisord.conf
VOLUME /var/spool/caldavd

EXPOSE 9001:9001
EXPOSE 8008:8008

WORKDIR /supervisord
CMD /usr/bin/supervisord -n