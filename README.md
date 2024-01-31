# Archlinux-Privacy

<br />

>This script is a variation of the original script dedicated to EndeavourOS for more details and the full tutorial, go here. 

[![image.png](https://i.postimg.cc/GhwB6JhJ/image.png)](https://postimg.cc/jCcd7ffL)

>This page aims to list the configuration of my Archlinux install. Its rolling release system allows this platform to be permanently up to date and benefit from the latest technologies. Here, I detail step by step how I configure my system to obtain both an OS that protects my privacy extensively, while obtaining ergonomics adapted to my productivity tasks. Also included are some additional features to cover gaming uses.

---

Create an usb key with usbdiskimager

Launch archlinux installer and type "set loadkeys fr"

>You can install archlinux manually, I let you refer to the documentation present on the official [archlinux website](https://wiki.archlinux.org/title/Installation_guide) \
An installer script is also available : [archinstall](https://wiki.archlinux.org/title/Archinstall)



### Preparation step : 


Unlike ready-to-use arch-based distribution installations, Archlinux is considered vanilla, a "mother" system that only includes the bare minimum. The principle is simple, we invite you to build an OS brick by brick and have exactly what you want.

Essential preparation steps must be taken so that your system can be used on a daily basis.

First we will install the base-devel packages : 

```sudo pacman -S --needed base-devel git```

We therefore install "yay" an AUR helper which will retrieve everything that is not found in the official arch repositories by searching the user repository : 

```git clone https://aur.archlinux.org/yay.git``` \
```cd yay``` \
```makepkg -si```

To update the mirrors, we add reflector, this will allow the software to be up to date and the correct flow to install:

```pacman -S reflector nano```

We edit the config file with nano (or another editor):

```sudo nano /etc/xdg/reflector/reflector.conf```

Modify this line with your information:

```--country 'YOUR COUNTRY','OR COUNTRIES'```

We activate and start the service:

```sudo systemctl enable reflector.service reflector.timer``` \
```sudo systemctl start reflector.service reflector.timer``` \
```sudo systemctl start reflector.service```

We take this opportunity to update:

```sudo pacman -Syu```

Now, we edit the pacman packet manager conf to enable the AUR

```sudo nano /etc/pacman.conf```

uncomment the line "multilib"

We update, but with yay now:

```yay -Syyuu```

We can move on to the next step, retrieving my script and installing everything we need to have a complete system.

---

### Script Installation

```git clone https://github.com/TheCyberArcher/Archlinux-Privacy.git ~/.local/script/archscript/``` \
```sudo chmod 777 -R ~/.local/script/``` \
```cd ~/.local/script/archscript/``` \
```bash Installation.sh```

We are there, the script is launched, we confirm or enter our password when requested, this will install a minimal gnome desktop environment and all the tools that I use on a daily basis but also configure the configuration files.

<br />

---

### List of packets installed : 

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
