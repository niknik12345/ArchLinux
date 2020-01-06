# ArchLinux
Скрипт_инстал

curl -i https://git.io -F "url=https://raw.githubusercontent.com/niknik12345/ArchLinux/master/arch_off.sh" -F "code=arch_off.sh"

git.io/install_arch1.sh 

git.io/install_arch2.sh

git.io/install_arch3.sh

Востановление загрузчика  
Чтобы вывести список текущих загрузочных записей -  
Shell> bcfg boot dump -v

Чтобы добавить пункт меню загрузки для grubx64.efi (например, grub2) в качестве 4-й опции (нумерация начинается с нуля) в меню загрузки  
Shell> bcfg boot add 3 fs0:\EFI\arch\grubx64.efi "Arch Linux (GRUB2)"  
где fs0: отображение, соответствующее системному разделу UEFI, а \ EFI \ arch \ grubx64.efi - файл для запуска.
