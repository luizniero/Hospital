#!/bin/bash
origem_dados="/home/samba/shares/"
destino_dados="/mnt/storage/semanal/quintas"
diretorio_base="/mnt/storage/semanal"
nao_copiar="(FTP|BACKUPS)"

clear
echo Executando script de backup
echo ...

#Verifica se o diretorio base existe
if [ ! -d  $diretorio_base ]
 	then
		echo Criando o diretorio $diretorio_base
		echo ...
		mkdir $diretorio_base
fi;
#Verifica se o diretorio do dia existe
if [ ! -d $destino_dados ]
	 then
		echo Criando o diretorio $destino_dados
		echo ...
		mkdir $destino_dados
fi;

#Verifica se o storage esta montado
if mount | grep -q /mnt/storage; then
	#Copia, por rsync todos os diretorios, exceto os diretorios mapeados na variavel nao_copiar
	rsync -Cravzpt --exclude 'BACKUPS' --exclude 'FTP'  --progress $origem_dados $destino_dados >>$destino_dados/log.txt
	sh /home/scripts/backup_bancos.sh
else
	echo A unidade nao esta montada 
fi
