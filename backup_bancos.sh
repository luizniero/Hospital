#!/bin/bash
ORIGEM="/home/samba/shares/BACKUPS/TAR-GZ/bancos.tar.gz"
DESTINO="/mnt/storage/bancos/bancos.tar.gz"
DATA=`date +%d-%m-%Y`

clear
echo Comprimindo os bancos...
sleep 1
tar -czvf $ORIGEM /home/samba/shares/BACKUPS/bancos
echo Compressao concluida
sleep 1

echo Comparando os arquivos de backup:
echo $ORIGEM
echo $DESTINO
sleep 1

#Verifica se os arquivos sao iguais
if zdiff $ORIGEM $DESTINO>/dev/null;then
echo Arquivos iguais.  Nada sera copiado
sleep 1
else
echo Arquivos diferentes.  Copiando...
sleep 1
#RENOMEANDO O BACKUP ANTIGO
mkdir /mnt/storage/bancos/bancos_$DATA
mv  $DESTINO /mnt/storage/bancos/bancos_$DATA/
sleep 2
cp $ORIGEM /mnt/storage/bancos/
echo O antigo backup de bancos foi renomeado e o novo backup foi copiado
sleep 1
fi

sleep 1
echo Backup Concluido
