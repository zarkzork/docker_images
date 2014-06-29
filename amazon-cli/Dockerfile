FROM debian:wheezy
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get install -y locales
RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -qy python-pip s3cmd
RUN pip install awscli
