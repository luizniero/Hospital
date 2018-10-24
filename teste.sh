#!/bin/bash

if mount | grep -q /mnt/storage ; then
	echo Diretorio Montado
else
	echo Diretorio nao Montado
fi

