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

RUN apt-get install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config  libpq-dev make wget unzip git mysql-client libmysqlclient-dev imagemagick sendmail

RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN rbenv install 2.1.1
RUN rbenv global 2.1.1
ENV RBENV_VERSION 2.1.1
RUN gem install bundler foreman rack
RUN rbenv rehash

# cleaning up space
RUN rm -rf /usr/local/rbenv/versions/2.1.1/share/ri
RUN find /usr/share/locale/ -maxdepth "1" | grep -i -v "ru\|en" | xargs rm -rf

# system defaults config
RUN echo "RBENV_ROOT=/usr/local/rbenv" > /etc/environment
RUN echo "PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/environment
RUN echo "RBENV_VERSION=2.1.1" >> /etc/environment


WORKDIR /app
ENV RAILS_ENV production

EXPOSE 9292
