#!/bin/bash

# Arch Linux Install - Быстрая установка Arch Linux

loadkeys ru
setfont cyr-sun16
echo 'Скрипт по Установке ArchLinux'

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

#echo 'Создайте 3-и раздела'
#echo '1-й efi 200-500M'
#echo '2-й swap 4-8G'
#echo '3-й root для Linux'

#cfdisk /dev/sda

#echo 'Ваша разметка диска'
#fdisk -l

#echo '2.4.2 Форматирование дисков'

#mkfs.fat -F32 /dev/sda1
#mkswap /dev/sda1 -L swap
#mkfs.ext4  /dev/sda2
echo 'создайте 3 раздела 1-boot/2-root/3-swap'

echo '2.4.2 Форматирование дисков'
#mkfs.ext2  /dev/sda1 -L boot
mkfs.ext4  /dev/sda3 -L root
mkfs.ext4  /dev/sda5 -L home
mkswap /dev/sda4 -L swap

echo '2.4.3 Монтирование дисков'
mount /dev/sda3 /mnt
mount /dev/sda5 /mnt/home
#mount /dev/sda1 /mnt/boot
swapon /dev/sda4

echo '3.1 Выбор зеркал для загрузки.'
rm -rf /etc/pacman.d/mirrorlist
wget https://git.io/mirrorlist
mv -f ~/mirrorlist /etc/pacman.d/mirrorlist

echo '3.2 Установка основных пакетов'
pacstrap /mnt base linux linux-firmware nano dhcpcd netctl

echo '3.3 Настройка системы'
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/install_arch2.sh)"
