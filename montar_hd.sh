#!/bin/bash
caminho_mapeado=/dev/sdb1
caminho_montagem=/mnt/storage

mkdir $caminho_montagem

mount -wt ext4 $caminho_mapeado $caminho_montagem
