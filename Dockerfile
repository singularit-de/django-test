FROM my-temp-python-image:latest

LABEL org.opencontainers.image.source=https://github.com/singularit-de/django-test
LABEL maintainer="singularIT GmbH <robin.kehl@singular-it.de>"
LABEL org.opencontainers.image.documentation=https://github.com/singularit-de/django-test#readme

ENV MYSQL_USER test
ENV MYSQL_ROOT_USERNAME root
ENV MYSQL_ROOT_PASSWORD secret
ENV MYSQL_HOST localhost

RUN apt -y update
RUN apt -y install apt-utils

# MySQL
RUN apt -y install net-tools default-mysql-client default-libmysqlclient-dev

#MariaDB
RUN apt -y install libmariadbclient-dev libssl-dev

#CMD ["echo", "\"GRANT", "ALL", "on", "*.*", "to",  "'${MYSQL_USER}';\"","|", "mysql", "-u", "'${MYSQL_ROOT_USERNAME}'", "--password='${MYSQL_ROOT_PASSWORD}'", "-h", "${MYSQL_HOST}"]

CMD "$(if [ $MYSQL_ALLOW_EMPTY_PASSWORD = 'yes' ] ; then echo \"GRANT ALL on *.* to ${MYSQL_USER};\"| mysql -u ${MYSQL_ROOT_USERNAME} --password=\"\" -h ${MYSQL_HOST} ; else echo 'echo \"GRANT ALL on *.* to ${MYSQL_USER};\"| mysql -u ${MYSQL_ROOT_USERNAME} --password=${MARIADB_ROOT_PASSWORD} -h ${MYSQL_HOST}; fi)"