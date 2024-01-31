# Archlinux-Privacy

<br />

>This script is a variation of the original script dedicated to EndeavourOS for more details and the full tutorial, go [here](https://github.com/TheCyberArcher/EndeavourOS-Privacy). 

<br />

[![image.png](https://i.postimg.cc/cLCDrmmq/image.png)](https://postimg.cc/YvcNPQZ8)

>This page aims to list the configuration of my Archlinux install. Its rolling release system allows this platform to be permanently up to date and benefit from the latest technologies. Here, I detail step by step how I configure my system to obtain both an OS that protects my privacy extensively, while obtaining ergonomics adapted to my productivity tasks. Also included are some additional features to cover gaming uses.

---

### Install Archlinux : 

<br />

Create an usb key with [usbdiskimager](https://bztsrc.gitlab.io/usbimager/)

>You can install archlinux manually, I let you refer to the documentation present on the official [archlinux website](https://wiki.archlinux.org/title/Installation_guide) \
An installer script is also available : [archinstall](https://wiki.archlinux.org/title/Archinstall)

Launch archlinux installer and type "set loadkeys fr" (or any other country depending on your case)

*__Important : encrypt your drive with luks to avoid any data disclosure !__*

---

### Preparation step : 

<br />

Unlike ready-to-use arch-based distribution installations, [Archlinux](https://fr.wikipedia.org/wiki/Arch_Linux) is considered vanilla, a "mother" system that only includes the bare minimum. The principle is simple, we invite you to build an OS brick by brick and have exactly what you want.

Essential preparation steps must be taken so that your system can be used on a daily basis.

First we will install [base-devel](https://archlinux.org/packages/core/any/base-devel/) and [git](https://wiki.archlinux.org/title/Git) packages : 

```sudo pacman -S --needed base-devel git```

---

### yay AUR Helper

<br />

We therefore install [yay](https://github.com/Jguer/yay) an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers) which will retrieve everything that is not found in the official arch repositories by searching the user repository : 

```git clone https://aur.archlinux.org/yay.git``` \
```cd yay``` \
```makepkg -si```

---

### Mirrors update

<br />

To update the [mirrors](https://wiki.archlinux.org/title/Mirrors), we add [reflector](https://wiki.archlinux.org/title/Reflector), this will allow the software to be up to date and the correct flow to install:

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

---

### Enable Multilib (AUR)

<br />

Now, we edit the pacman packet manager conf to enable the [AUR](https://aur.archlinux.org/)

```sudo nano /etc/pacman.conf```

- uncomment the line "multilib"


We update, but with yay now:

```yay -Syyuu```

We can move on to the next step, retrieving my script and installing everything we need to have a complete system.

---

### Script Installation

<br />

```git clone https://github.com/TheCyberArcher/Archlinux-Privacy.git ~/.local/script/archscript/``` \
```sudo chmod 777 -R ~/.local/script/``` \
```cd ~/.local/script/archscript/``` \
```bash Installation.sh```

We are there, the script is launched, we confirm or enter our password when requested, this will install a minimal gnome desktop environment and all the tools that I use on a daily basis but also configure the configuration files.

---

### List of packets : 

<br />

__Gnome light desktop environment :__

- [gnome-shell](https://archlinux.org/packages/extra/x86_64/gnome-shell/)
- [gnome-control-center](https://archlinux.org/packages/extra/x86_64/gnome-control-center/)
- [gnome-tweaks](https://archlinux.org/packages/extra/any/gnome-tweaks/)
- [gnome-terminal](https://archlinux.org/packages/extra/x86_64/gnome-terminal/)
- [xdg-user-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/)
- [networkmanager](https://archlinux.org/packages/extra/x86_64/networkmanager/)
- [nautilus](https://archlinux.org/packages/extra/x86_64/nautilus/) 
- [gnome-keyring](https://archlinux.org/packages/extra/x86_64/gnome-keyring/)
- [xdg-desktop-portal](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal/)
- [xdg-desktop-portal-gnome](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal-gnome/)
- [gdm](https://archlinux.org/packages/extra/x86_64/gdm/)
- [eog](https://archlinux.org/packages/extra/x86_64/eog/)

__Gnome extensions :__ 

- [gnome-shell-extension-appindicator-git](https://github.com/ubuntu/gnome-shell-extension-appindicator)
- [gnome-shell-extension-vitals-git](https://github.com/corecoding/Vitals)
- [gnome-shell-extension-display-brightness-ddcutil-git](https://github.com/daitj/gnome-display-brightness-ddcutil)
- [gnome-shell-extension-quick-settings-tweaks-git](https://github.com/qwreey/quick-settings-tweaks)
- [gnome-shell-extension-dash-to-dock](https://github.com/micheleg/dash-to-dock)
- [gnome-shell-extension-gsconnect](https://github.com/GSConnect/gnome-shell-extension-gsconnect)
- [gnome-shell-extension-blur-my-shell](https://github.com/aunetx/blur-my-shell)
- [gnome-shell-extension-pop-shell-git](https://github.com/pop-os/shell)
- [quick-settings-avatar.git](https://github.com/d-go/quick-settings-avatar)
- [arch-update.git](https://github.com/RaphaelRochet/arch-update)
- [no-overview.git](https://github.com/fthx/no-overview)

__Firewall and VPN :__ 

- [firewalld](https://firewalld.org/)
- [Mullvad-vpn](https://mullvad.net/fr)

__Softwares :__ 

- [librewolf-bin](https://librewolf.net/)
- [torbrowser-launcher](https://www.torproject.org/fr/download/)
- [thunderbird](https://www.thunderbird.net/fr/)
- [keepassxc](https://keepassxc.org/)
- [webapp-manager](https://aur.archlinux.org/packages/webapp-manager)
- [extension-manager](https://aur.archlinux.org/packages/extension-manager)
- [qbittorrent](https://www.qbittorrent.org/)
- [btop](https://github.com/aristocratos/btop)
- [onlyoffice-bin](https://www.onlyoffice.com/fr/)
- [visual-studio-code-bin](https://code.visualstudio.com/)
- [virtualbox](https://www.virtualbox.org/)
- [openrgb-bin](https://openrgb.org/)
- [corectrl](https://gitlab.com/corectrl/corectrl)
- [ddcutil](https://www.ddcutil.com/)
- [vlc](https://www.videolan.org/vlc/)
- [discord](https://discord.com/)
- [signal-desktop](https://signal.org/download/)
- [steam](https://store.steampowered.com/)
- [lutris](https://lutris.net/)
- [neofetch](https://github.com/dylanaraps/neofetch)

__Drivers :__ 

- [mesa](https://archlinux.org/packages/extra/x86_64/mesa/)
- [lib32-mesa](https://archlinux.org/packages/multilib/x86_64/lib32-mesa/)
- [vulkan-radeon](https://archlinux.org/packages/extra/x86_64/vulkan-radeon/)
- [lib32-vulkan-radeon](https://archlinux.org/packages/multilib/x86_64/lib32-vulkan-radeon/)
- [vulkan-tools](https://archlinux.org/packages/extra/x86_64/vulkan-tools/)

__Other softwares sources :__ 

- [flatpak](https://www.flatpak.org/)

<br />

---

__Gaming dependencies :__ 

```proton-ge-custom wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader```
