#!/bin/bash

sed -i 's/^#AddDefaultCharset/AddDefaultCharset/' /etc/apache2/conf-available/charset.conf
sed -i 's/^#<Directory \/>/<Directory \/>/' /etc/apache2/conf-available/security.conf
sed -i 's/^#.*AllowOverride None/   AllowOverride None/' /etc/apache2/conf-available/security.conf
sed -i '10s/^#.*Require all denied/   Require all denied/' /etc/apache2/conf-available/security.conf
sed -i 's/^#<\/Directory>/<\/Directory>/' /etc/apache2/conf-available/security.conf
sed -i 's/^ServerTokens.*/ServerTokens Prod/' /etc/apache2/conf-available/security.conf
sed -i 's/^#Header set X/Header set X/g' /etc/apache2/conf-available/security.conf

sed -i '10i \        ServerName localhost' /etc/apache2/sites-available/000-default.conf
mv /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/000-default-ssl.conf
sed -i '3i \                ServerName localhost' /etc/apache2/sites-available/000-default-ssl.conf
