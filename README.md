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




---
