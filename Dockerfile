LABEL org.opencontainers.image.source=https://github.com/singularit-de/django-test
LABEL maintainer="singularIT GmbH <robin.kehl@singular-it.de>"
LABEL org.opencontainers.image.documentation=https://github.com/singularit-de/django-test#readme

FROM my-temp-python-image:latest

RUN apt -y update
RUN apt -y install apt-utils

# MySQL
RUN apt -y install net-tools default-mysql-client default-libmysqlclient-dev

#MariaDB
RUN apt -y install libmariadbclient-dev libssl-dev

