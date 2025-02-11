#!/bin/bash
DATE=$(date +%Y%m)
FSLABEL="ARCOLINUX"

echo 'mkdir'
mkdir out

echo "save FSLABEL"
echo $FSLABEL > out/fslabel

echo 'sed'
sed -i -e "s/<FS-LABEL>/${FSLABEL}/g" grub.cfg

echo 'make'
grub-mkstandalone -d /usr/lib/grub/i386-efi/ -O i386-efi --modules="part_gpt part_msdos" --fonts="unicode" --locales="en@cyrillic" --themes="" -o "out/bootia32.efi" "boot/grub/grub.cfg=grub.cfg" -v
