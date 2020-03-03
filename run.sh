#!/bin/bash

service apache2 start
service mysql restart

while true; do sleep 1000; done
