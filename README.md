# Archlinux-Privacy

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
