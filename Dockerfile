FROM my-temp-python-image:latest

RUN apt -y update
RUN apt -y install apt-utils

# MySQL
RUN apt -y install net-tools default-mysql-client default-libmysqlclient-dev

#MariaDB
RUN apt -y install default-libmysqlclient-dev libssl-dev
