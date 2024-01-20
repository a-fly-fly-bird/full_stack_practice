#!/bin/bash

docker run -p 3306:3306 --name mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-v ~/Docker/MySQL/log:/var/log/mysql \
-v ~/Docker/MySQL/data:/var/lib/mysql  \
-itd mysql
