FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --assume-yes apt-utils

RUN apt-get install -y vim

RUN mkdir -p /app

RUN apt-get install -y apache2

RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod ssl
RUN a2dismod -f autoindex

ADD set-apache.sh /app/set-apache.sh
RUN /app/set-apache.sh

RUN a2ensite 000-default-ssl.conf

RUN apt-get install -y php
RUN apt-get install -y php-mbstring php-gd php-curl php-xml php-bcmath php-oauth php-mysql composer

RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Seoul/g' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Seoul/g' /etc/php/7.2/cli/php.ini

RUN apt-get install -y mysql-client mysql-server

COPY override.cnf /etc/mysql/mysql.conf.d/override.cnf

RUN apt-get install -y phpmyadmin
RUN echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

ENV PHP_UPLOAD_MAX_FILESIZE 128M
ENV PHP_POST_MAX_SIZE 512M
ENV PHP_MAX_EXECUTION_TIME 0
ENV PHP_MAX_INPUT_TIME -1
ENV PHP_MEMORY_LIMIT 128M

ADD set-php-size.sh /app/set-php-size.sh
RUN /app/set-php-size.sh

ADD run.sh /app/run.sh

VOLUME ["/opt/html", "/var/www/html"]

EXPOSE 80

CMD ["/app/run.sh", "run"]
