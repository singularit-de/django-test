FROM my-temp-python-image:latest

LABEL org.opencontainers.image.source=https://github.com/singularit-de/django-test
LABEL maintainer="singularIT GmbH <robin.kehl@singular-it.de>"
LABEL org.opencontainers.image.documentation=https://github.com/singularit-de/django-test#readme

ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONUNBUFFERED=0

RUN apt-get update
RUN apt-get install lsb-release -y
RUN apt-get -y install apt-utils

RUN cd /tmp && curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb && dpkg -i mysql-apt-config* && rm -f /tmp/*.deb
RUN apt-get -y update
RUN apt-get install mysql-apt-config
RUN apt-get -y update

# MySQL
RUN apt-get -y install net-tools mysql-client default-libmysqlclient-dev

# MariaDB
RUN apt-get -y install libmariadb-dev libssl-dev
