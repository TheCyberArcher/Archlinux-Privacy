# Archlinux-Privacy

Create an usb key with usbdiskimager

Launch archlinux installer and type "set loadkeys fr"

type : archinstall 

Configure your system before installation

Post install : 

```sudo pacman -S --needed base-devel git```

```git clone https://aur.archlinux.org/yay.git``` \
```cd yay``` \
```makepkg -si```


```pacman -S reflector nano```

```sudo nano /etc/xdg/reflector/reflector.conf```

Modify : --country 'YOUR COUNTRY','OR COUNTRIES'

```sudo systemctl enable reflector.service reflector.timer``` \
```sudo systemctl start reflector.service reflector.timer``` \
```sudo systemctl start reflector.service```

```sudo pacman -Syu```

Modify /etc/pacman.conf

uncomment the line "multilib"

```yay -Syyuu```

Env install : 

```git clone https://github.com/TheCyberArcher/Archlinux-Privacy.git```

```bash Installation.sh```

<br />

List of packets installed : 

Gnome light desktop environment : 

- gnome-shell gnome-control-center 
- gnome-tweaks 
- gnome-terminal 
- xdg-user-dirs 
- networkmanager 
- nautilus 
- gnome-keyring 
- xdg-desktop-portal 
- xdg-desktop-portal-gnome 
- gdm 
- eog

Gnome extensions : 

- gnome-shell-extension-appindicator-git
- gnome-shell-extension-vitals-git 
- gnome-shell-extension-display-brightness-ddcutil-git 
- gnome-shell-extension-quick-settings-tweaks-git 
- gnome-shell-extension-dash-to-dock 
- gnome-shell-extension-gsconnect 
- gnome-shell-extension-blur-my-shell 
- gnome-shell-extension-pop-shell-git 
- quick-settings-avatar.git
- arch-update.git
- no-overview.git

Softwares : 

- librewolf-bin 
- torbrowser-launcher 
- thunderbird 
- keepassxc 
- webapp-manager 
- extension-manager 
- qbittorrent 
- btop 
- onlyoffice-bin 
- visual-studio-code-bin 
- virtualbox 
- openrgb-bin 
- corectrl 
- ddcutil 
- vlc 
- corectrl 
- discord 
- signal-desktop 
- steam 
- lutris 
- neofetch 
- virtualbox
- hidamari

Drivers : 

- mesa 
- lib32-mesa 
- vulkan-radeon 
- lib32-vulkan-radeon

Other softwares sources : 

- flatpack

<br />

---

Gaming dependencies : 

```proton-ge-custom wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader```
