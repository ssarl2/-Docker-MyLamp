|Component|Ubuntu18.04|
|:----------------|:------------------|
|Apache|2.4.29|
|MySQL|5.7.29|
|PHP|7.2.24|
|phpMyAdmin|4.6.6|



### Easy install
docker run -d -p 80:80 --name lamp -v /opt/html/:/var/www/html/ ssarl2/mylamp

### If you want to bash env
docker exec -it lamp bash

### phpmyAdmin
URL : (Your IP)/phpmyadmin
ID : root
password : (Just enter)

Dockerhub : https://hub.docker.com/repository/docker/ssarl2/mylamp
