#!/bin/bash

usermod -d /var/lib/mysql/ mysql

sed -i "103c\    \$cfg['Servers'][\$i]['AllowNoPassword'] = TRUE;" /etc/phpmyadmin/config.inc.php
sed -i "117c\    \$cfg['Servers'][\$i]['AllowNoPassword'] = TRUE;" /etc/phpmyadmin/config.inc.php

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "skip-grant-tables" >> /etc/mysql/my.cnf
echo "innodb_buffer_pool_size=64M" >> /etc/mysql/my.cnf
