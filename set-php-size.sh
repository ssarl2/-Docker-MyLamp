#!/bin/bash

if [ -e /etc/php/7.2/apache2/php.ini ]; then
	sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
		-e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php/7.2/apache2/php.ini \
		-e "s/^max_execution_time.*/max_execution_time = ${PHP_MAX_EXECUTION_TIME}/" /etc/php/7.2/apache2/php.ini \
		-e "s/^max_input_time.*/max_input_time = ${PHP_MAX_INPUT_TIME}/" /etc/php/7.2/apache2/php.ini \
		-e "s/^memory_limit.*/memory_limit = ${PHP_MEMORY_LIMIT}/" /etc/php/7.2/apache2/php.ini
else
	sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
		-e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php/5.6/apache2/php.ini \
		-e "s/^max_execution_time.*/max_execution_time = ${PHP_MAX_EXECUTION_TIME}/" /etc/php/5.6/apache2/php.ini \
		-e "s/^max_input_time.*/max_input_time = ${PHP_MAX_INPUT_TIME}/" /etc/php/5.6/apache2/php.ini \
		-e "s/^memory_limit.*/memory_limit = ${PHP_MEMORY_LIMIT}/" /etc/php/5.6/apache2/php.ini
fi
