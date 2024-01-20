#!/bin/bash

docker run -itd -e POSTGRES_USER=terry \
-e POSTGRES_PASSWORD=123456 \
-p 5432:5432 \
-v  ~/Docker/PostgreSQL/data:/var/lib/postgresql/data \
--name postgresql \
-itd postgres