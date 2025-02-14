#!/bin/bash
# Fix permission to run connect script
chmod u+x connect.sh

# Load schema and then insert into schema
mariadb --skip-ssl -h mariadb-server -u root --password="${MARIADB_ROOT_PASSWORD}" < create-tables.sql
mariadb --skip-ssl -h mariadb-server -u root --password="${MARIADB_ROOT_PASSWORD}" < insert-tables.sql
mariadb --skip-ssl -h mariadb-server -u root --password="${MARIADB_ROOT_PASSWORD}" < create-log.sql
