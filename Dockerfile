FROM my-temp-python-image:latest

LABEL org.opencontainers.image.source=https://github.com/singularit-de/django-test
LABEL maintainer="singularIT GmbH <robin.kehl@singular-it.de>"
LABEL org.opencontainers.image.documentation=https://github.com/singularit-de/django-test#readme

ENV MYSQL_USER test_user
ENV MYSQL_ROOT_USERNAME root
ENV MYSQL_HOST 127.0.0.1
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
RUN apt-get install lsb-release -y
RUN apt-get -y install apt-utils

RUN cd /tmp && curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb && dpkg -i mysql-apt-config* && rm -f /tmp/*.deb
RUN apt-get -y update
RUN apt-get install mysql-apt-config
RUN apt-get -y update

# MySQL
RUN apt-get -y install net-tools mysql-client default-libmysqlclient-dev

#MariaDB
RUN apt-get -y install libmariadb-dev libssl-dev

CMD "$(if [ $MYSQL_ALLOW_EMPTY_PASSWORD = 'yes' ] ; then echo \"GRANT ALL on *.* to ${MYSQL_USER};\"| mysql -u ${MYSQL_ROOT_USERNAME} --password=\"\" -h ${MYSQL_HOST}  --port=${MYSQL_PORT} ; else echo \"GRANT ALL on *.* to ${MYSQL_USER};\"| mysql -u ${MYSQL_ROOT_USERNAME} --password=${MYSQL_ROOT_PASSWORD} -h ${MYSQL_HOST} --port=${MYSQL_PORT}; fi)"