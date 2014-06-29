FROM debian:wheezy
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get update
RUN apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q nginx
RUN apt-get clean

VOLUME ["/data"]
ADD nginx.conf /data/nginx.conf
EXPOSE 80

CMD nginx -c /data/nginx.conf
