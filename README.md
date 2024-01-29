# Archlinux-Privacy

Create an usb key with usbdiskimager

Launch archlinux installer and type "set loadkeys fr"

type : archinstall 

Configure your system before installation

Post install : 

sudo pacman -S --needed base-devel git

pacman -S reflector

Modify : --country 'YOUR COUNTRY','OR COUNTRIES'

sudo systemctl enable reflector.service reflector.timer \
sudo systemctl start reflector.service reflector.timer \
sudo systemctl start reflector.service

sudo pacman -Syu

git clone https://aur.archlinux.org/yay.git \
cd yay \
makepkg -si

Modify /etc/pacman.conf

uncomment the line "multilib"

yay -Syyuu

Env install : 

git clone https://github.com/TheCyberArcher/Archlinux-Privacy.git

bash Installation.sh
