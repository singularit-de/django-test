FROM my-temp-python-image:latest

LABEL org.opencontainers.image.source=https://github.com/singularit-de/django-test
LABEL maintainer="singularIT GmbH <robin.kehl@singular-it.de>"
LABEL org.opencontainers.image.documentation=https://github.com/singularit-de/django-test#readme

ENV I_MYSQL_USER ${MYSQL_USER:-test_user}
ENV I_MYSQL_ROOT_USERNAME ${MYSQL_ROOT_USERNAME:-root}
ENV I_MYSQL_HOST ${MYSQL_HOST:-127.0.0.1}

RUN apt-get -y update
RUN apt-get -y install apt-utils

# MySQL
RUN apt-get -y install net-tools default-mysql-client libmariadb-dev

#MariaDB
RUN apt-get -y install libmariadbclient-dev libssl-dev

CMD "$(if [ $MYSQL_ALLOW_EMPTY_PASSWORD = 'yes' ] ; then echo \"GRANT ALL on *.* to ${I_MYSQL_USER};\"| mysql -u ${I_MYSQL_ROOT_USERNAME} --password=\"\" -h ${I_MYSQL_HOST}  --port=${MYSQL_PORT} ; else echo \"GRANT ALL on *.* to ${I_MYSQL_USER};\"| mysql -u ${I_MYSQL_ROOT_USERNAME} --password=${MYSQL_ROOT_PASSWORD} -h ${I_MYSQL_HOST} --port=${MYSQL_PORT}; fi)"