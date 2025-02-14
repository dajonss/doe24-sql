#!/bin/bash
source ./.env

docker compose exec -e MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD} mariadb-client bash
