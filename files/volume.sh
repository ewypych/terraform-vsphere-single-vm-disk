#!/bin/bash

vgchange -ay

pvcreate $1
vgcreate data $1
lvcreate --name data1 -l 100%FREE data
mkfs.ext4 /dev/data/data1

mkdir -p /data

echo '/dev/data/data1 /data ext4 defaults 0 0' >> /etc/fstab
mount /data
