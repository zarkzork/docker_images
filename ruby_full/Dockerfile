FROM base
MAINTAINER Vladimir Terekhov <zarkzork@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

# Installing ruby

RUN apt-get install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config  libpq-dev make wget unzip git vim  libffi-dev qt4-dev-tools libqt4-dev libqt4-core libqt4-gui mysql-client libmysqlclient-dev

RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN rbenv install 2.0.0-p247
RUN rbenv global 2.0.0-p247
ENV RBENV_VERSION 2.0.0-p247
RUN gem install bundler foreman rack

# Installing mysql

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q mysql-server mysql-client libmysqlclient-dev
RUN apt-get clean

RUN sed -i -e"s|^\(datadir\s*=\s*\)/var/lib/mysql|\1/mysql|" /etc/mysql/my.cnf
VOLUME ["/mysql"]

# install supervisor

RUN apt-get install -y supervisor

# install openssh

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# system defaults config

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN echo "RBENV_ROOT=/usr/local/rbenv" > /etc/environment
RUN echo "PATH=/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/environment
RUN echo "RBENV_VERSION=2.0.0-p247" >> /etc/environment

# creating app user
RUN useradd -U -m -b / -s /bin/bash app

ADD mysql_run.sh /bin/mysqld-wrap
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chown root:root /root/.ssh/authorized_keys
ADD supervisord.conf /supervisord/supervisord.conf
ADD config.ru /app/config.ru


# sshd
EXPOSE 22:4022
# supervisord
EXPOSE 9001:4001
# rack
EXPOSE 9292:4092

WORKDIR /supervisord
CMD /usr/bin/supervisord -n
