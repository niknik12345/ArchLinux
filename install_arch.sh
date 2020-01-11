#!/bin/bash

# Arch Linux Install - Быстрая установка Arch Linux

loadkeys ru
setfont cyr-sun16
echo 'Скрипт по Установке ArchLinux'

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

echo 'Создайте 3-и раздела'
echo '1-й efi 200-500M'
echo '2-й swap 4-8G'
echo '3-й root для Linux'

cfdisk /dev/sda

echo 'Ваша разметка диска'
fdisk -l

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2 -L swap
mkfs.ext4  /dev/sda3

echo '2.4.3 Монтирование дисков'
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
swapon /dev/sda2

echo '3.1 Выбор зеркал для загрузки.'
rm -rf /etc/pacman.d/mirrorlist
wget https://git.io/mirrorlist
mv -f ~/mirrorlist /etc/pacman.d/mirrorlist

echo '3.2 Установка основных пакетов'
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl

echo '3.3 Настройка системы'
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/install_arch2.sh)"
