echo "------------- Welcome to my Archlinux-Privacy install script -------------------"

sleep 2

echo "Source : https://github.com/TheCyberArcher/Archlinux-Privacy/"

sleep 2

sudo pacman -Syu

#DNS configuration

nmcli con mod "Connexion filaire 1" ipv4.ignore-auto-dns yes
nmcli con mod "Connexion filaire 1" ipv4.dns "45.90.28.250 45.90.30.250 9.9.9.9 149.112.112.112 1.1.1.1"

ping aur.archlinux.org -c 5

#Firewall configuration

yay -S firewalld

sudo systemctl enable firewalld
sudo systemctl start firewalld

sudo firewall-cmd --state

sudo firewall-cmd --set-default-zone=work

#VPN configuration

yay -S mullvad-vpn-bin

mullvad lan set allow
mullvad dns set default --block-ads --block-trackers --block-malware --block-gambling --block-adult-content

#Desktop environment installation

yay -S gnome-shell gnome-control-center gnome-tweaks gnome-terminal xdg-user-dirs networkmanager nautilus gnome-keyring xdg-desktop-portal xdg-desktop-portal-gnome gdm eog gdm-settings 

mkdir ~/.local/share/gnome-shell/extensions/

yay -S gnome-shell-extension-appindicator-git 
yay -S gnome-shell-extension-vitals-git 
yay -S gnome-shell-extension-display-brightness-ddcutil-git 
yay -S gnome-shell-extension-quick-settings-tweaks-git 
yay -S gnome-shell-extension-dash-to-dock 
yay -S gnome-shell-extension-gsconnect 
yay -S gnome-shell-extension-blur-my-shell 
yay -S gnome-shell-extension-forge


git clone https://github.com/d-go/quick-settings-avatar.git ~/.local/share/gnome-shell/extensions/"quick-settings-avatar@d-go"
git clone https://github.com/RaphaelRochet/arch-update.git ~/.local/share/gnome-shell/extensions/"arch-update@RaphaelRochet"
git clone https://github.com/fthx/no-overview.git ~/.local/share/gnome-shell/extensions/"no-overview@fthx"
git clone https://github.com/Aryan20/Logomenu.git  ~/.local/share/gnome-shell/extensions/"logomenu@aryan_k"
git clone https://github.com/christopher-l/space-bar.git ~/.local/share/gnome-shell/extensions/"space-bar@luchrioh"

sudo systemctl enable gdm.service
gsettings set org.gnome.shell disable-user-extensions false

#paccache tool

yay -S pacman-contrib

#Tools installation

yay -S librewolf-bin torbrowser-launcher thunderbird protonmail-bridge-bin solaar keepassxc webapp-manager qbittorrent btop onlyoffice-bin visual-studio-code-bin virtualbox virtualbox-host-modules-arch openrgb-bin corectrl ddcutil vlc corectrl webcord-bin telegram-desktop-bin signal-desktop steam lutris proton-ge-custom-bin neofetch

sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader winetricks

#Drivers installation

yay –S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-tools

#virtualbox user configuration

sudo usermod -a -G vboxusers $USER

#END

echo "--- Installation terminée"
echo "--- Reboot dans 10 secondes"

sleep 10

reboot
