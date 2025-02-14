#!/bin/bash
# Just makes it easier to connect

mariadb petshop -h mariadb-server -u root --password="${MARIADB_ROOT_PASSWORD}"
