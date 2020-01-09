# ArchLinux
Скрипт_инстал  за основу взят https://github.com/ordanax

curl -i https://git.io -F "url=https://raw.githubusercontent.com/niknik12345/ArchLinux/master/arch_off.sh" -F "code=arch_off.sh"

git.io/install_arch1.sh 

git.io/install_arch2.sh

git.io/install_arch3.sh


https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)  
Востановление загрузчика  
Чтобы вывести список текущих загрузочных записей -  
Shell> bcfg boot dump -v

Чтобы добавить пункт меню загрузки для grubx64.efi (например, grub2) в качестве 4-й опции (нумерация начинается с нуля) в меню загрузки  
Shell> bcfg boot add 3 fs0:\EFI\arch\grubx64.efi "Arch Linux (GRUB2)"  
где fs0: отображение, соответствующее системному разделу UEFI, а \ EFI \ arch \ grubx64.efi - файл для запуска.

Команда EDIT предоставляет основной текстовый редактор с интерфейсом  
Shell> fs0:  
FS0:\> cd \efi\grub  
FS0:\efi\grub\> edit grub.cfg  

образец из https://docs.google.com/document/d/1IsTwkhYvYde9y3zTD1EscqockzdtdUYcItnAglYfZdU/edit#heading=h.dwb51nwq1lzd
