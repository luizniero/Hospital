#!/bin/bash
local_mapeado="/dev/sdc1"
local_montado="/mnt/storage"

echo "clear"
echo "local mapeado: $local_mapeado"
echo "local montado: $local_montado"

umount $local_mapeado $local_montado
rm -r $local_montado
