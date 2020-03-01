FROM ubuntu:18.04

RUN apt update && \

apt install -y vim

RUN apt install -y apache2

RUN service apache2 restart && \

a2enmod headers

RUN apache2ctl -S && \

sed -i 's/#AddDefaultCharset/AddDefaultCharset/' /etc/apache2/conf-available/charset.conf && \
sed -i '8 s/\#//' /etc/apache2/conf-available/security.conf && \
sed -i '9 s/\#//' /etc/apache2/conf-available/security.conf && \
sed -i '10 s/\#//' /etc/apache2/conf-available/security.conf && \
sed -i '11 s/\#//' /etc/apache2/conf-available/security.conf && \
sed -i '25 s/OS/Prod/' /etc/apache2/conf-available/security.conf && \
sed -i '63 s/\#//' /etc/apache2/conf-available/security.conf && \
sed -i '70 s/\#//' /etc/apache2/conf-available/security.conf && \

RUN sed -i '10 i\ServerName localhost' /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default-ssl.conf && \
service apache2 reload

RUN apt install -y php
RUN apt install -y php-mbstring php-gd php-curl php-xml php-bcmath php-oauth php-mysql composer

RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Seoul/g' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/;date.timezone =/date.timezone = Asia\/Seoul/g' /etc/php/7.2/cli/php.ini

RUN apt install -y mysql-client mysql-server

#ADD 

RUN apt install -y phpmyadmin && \
echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

RUN sed -i '822 s/2/128/g' /etc/php/7.2/apache2/php.ini && \
sed -i '669 s/8/512/g' /etc/php/7.2/apache2/php.ini && \
sed -i '380 s/30/0/g' /etc/php/7.2/apache2/php.ini && \
sed -i '390 s/60/-1/g' /etc/php/7.2/apache2/php.ini && \
sed -i '401 s/128/512/g' /etc/php/7.2/apache2/php.ini && \

ENTRYPOINT ["/bin/bash"]
