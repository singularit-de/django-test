FROM my-temp-python-image:latest

RUN apt -y update
RUN apt -y install apt-utils

# MySQL
RUN apt -y install net-tools default-mysql-client default-libmysqlclient-dev

## MariaDB
#RUN apt -y install mariadb-server libmariadbclient-dev libssl-dev

#VERSION = $(docker run my-iame python --version)