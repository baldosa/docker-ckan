#!/bin/bash
cd /home/admin-mds/datos-abiertos/docker-ckan
/usr/local/bin/docker-compose -f /home/admin-mds/datos-abiertos/docker-ckan/docker-compose.yml stop
/usr/local/bin/docker-compose -f /home/admin-mds/datos-abiertos/docker-ckan/docker-compose.yml up -d