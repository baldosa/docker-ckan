#!/bin/bash
# backup container
# Exporto el path al almacenamiento del volumen
export CKAN_CONFIG=$(docker inspect --format '{{ range .Mounts }}{{ if eq .Destination "/var/lib/ckan" }}{{ .Source }}{{ end }}{{ end }}' ckan)
# Creo un tar.gz con la info.
tar -C "$(dirname "$CKAN_CONFIG")" -zcvf volume-backup-$(date +%d-%m-%y).tar.gz "$(basename "$CKAN_CONFIG")"
# backup db
docker-compose exec db pg_dump -U postgres ckan --no-owner | gzip -9  > db-backup-$(date +%d-%m-%y).sql.gz