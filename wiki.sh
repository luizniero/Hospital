#!/bin/bash
echo backup mediawiki
sleep 1


echo transferindo os arquivos
sshpass -p "SENHAPADRÃO" scp bitnami@192.168.0.247:/home/bitnami/apps/backups/*.* /home/samba/shares/BACKUPS/WIKI
