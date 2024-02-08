# Archlinux-Privacy

<br />

>This script is a variation of the original script dedicated to EndeavourOS for more details and the full tutorial, go [here](https://github.com/TheCyberArcher/EndeavourOS-Privacy). 

<br />

[![image.png](https://i.postimg.cc/cLCDrmmq/image.png)](https://postimg.cc/YvcNPQZ8)

>This page aims to list the configuration of my Archlinux install. Its rolling release system allows this platform to be permanently up to date and benefit from the latest technologies. Here, I detail step by step how I configure my system to obtain both an OS that protects my privacy extensively, while obtaining ergonomics adapted to my productivity tasks. Also included are some additional features to cover gaming uses.

---

### Install Archlinux : 

<br />

- Create an usb key with [usbdiskimager](https://bztsrc.gitlab.io/usbimager/)

>You can install archlinux manually, I let you refer to the documentation present on the official [archlinux website](https://wiki.archlinux.org/title/Installation_guide) \
An installer script is also available : [archinstall](https://wiki.archlinux.org/title/Archinstall)

- Launch archlinux installer and type "set loadkeys fr" (or any other country depending on your case)

- Select Systemd-boot for the bootloader choice

*__Important : encrypt your drive with luks to avoid any data disclosure !__*

---

### Verify the connectivity

<br />

Open a shell and paste this command :

ping aur.archlinux.org

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

### Desktop Environment Installation

<br />

We will install gnome with extensions, in a minimal version

- Minimal Gnome and GDM login manager
- Just perfect extension to remove the top bar
- Forge extension to have tilling management for window management
- The dash to dock extension to pin a dock to the desktop

```yay -S gnome-shell gnome-control-center gnome-tweaks gnome-terminal xdg-user-dirs networkmanager nautilus gnome-keyring xdg-desktop-portal xdg-desktop-portal-gnome gdm eog gdm-settings```

```yay -S gnome-shell-extension-dash-to-dock gnome-shell-extension-blur-my-shell gnome-shell-extension-forge gnome-shell-extension-just-perfection-desktop```

---

### List of packets : 

<br />

__Gnome light desktop environment :__

- [gnome-shell](https://archlinux.org/packages/extra/x86_64/gnome-shell/) (Next generation desktop shell)
- [gnome-control-center](https://archlinux.org/packages/extra/x86_64/gnome-control-center/) (main interface for gnome configuration)
- [gnome-tweaks](https://archlinux.org/packages/extra/any/gnome-tweaks/) (utility for configuring multiples functionalities of gnome)
- [gnome-terminal](https://archlinux.org/packages/extra/x86_64/gnome-terminal/) (powerful and customizable tool for running commands)
- [xdg-user-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/) (Manage user directories)
- [networkmanager](https://archlinux.org/packages/extra/x86_64/networkmanager/) (Network connection manager and user applications)
- [nautilus](https://archlinux.org/packages/extra/x86_64/nautilus/) (default file manager for gnome)
- [gnome-keyring](https://archlinux.org/packages/extra/x86_64/gnome-keyring/) (stores passwords and encryption keys)
- [xdg-desktop-portal](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal/) (desktop integration portals for sandboxed apps)
- [xdg-desktop-portal-gnome](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal-gnome/) (A backend implementation for xdg-desktop-portal for gnome)
- [gdm](https://archlinux.org/packages/extra/x86_64/gdm/) (gnome manager and login screen)
- [eog](https://archlinux.org/packages/extra/x86_64/eog/) (default gnome image viewer)

__Gnome extensions :__ 

- [gnome-shell-extension-dash-to-dock](https://github.com/micheleg/dash-to-dock) (Pin the dock to your desktop like OSX style)
- [gnome-shell-extension-blur-my-shell](https://github.com/aunetx/blur-my-shell) (Add blur decoration to overview)
- [Forge](https://github.com/forge-ext/forge) (Tilling Windows Management)
- [Just Perfection](https://gitlab.gnome.org/jrahmatzadeh/just-perfection) (Remove the top bar, overview at startup and other feature)

__Firewall and VPN :__ 

- [firewalld](https://firewalld.org/) (Best firewall solution for Linux)
- [Mullvad-vpn](https://mullvad.net/fr) (VPN no logs for privacy)

__Softwares :__ 

- [librewolf-bin](https://librewolf.net/) (Privacy focused web browser)
- [torbrowser-launcher](https://www.torproject.org/fr/download/) (Privacy focused web browser with tor routing)
- [thunderbird](https://www.thunderbird.net/fr/) (Mozilla mail client)
- [keepassxc](https://keepassxc.org/) (Encrypt your password database)
- [webapp-manager](https://aur.archlinux.org/packages/webapp-manager) (Create application desktop with web based website)
- [qbittorrent](https://www.qbittorrent.org/) (Torrent Client)
- [btop](https://github.com/aristocratos/btop) (Hardware and process monitoring)
- [onlyoffice-bin](https://www.onlyoffice.com/fr/) (Office Suite alternative)
- [visual-studio-code-bin](https://code.visualstudio.com/) (The best code editor)
- [virtualbox](https://www.virtualbox.org/) (Oracle virtualisation tool)
- [openrgb-bin](https://openrgb.org/) (Control the computer RGB)
- [corectrl](https://gitlab.com/corectrl/corectrl) (Radeon GPU control and monitoring)
- [ddcutil](https://www.ddcutil.com/) (Control the screen brightness)
- [vlc](https://www.videolan.org/vlc/) (Best open source media player)
- [webcord](https://discord.com/) (Open-source discord client)
- [signal-desktop](https://signal.org/download/) (Encrypted messaging)
- [telegram-desktop](https://telegram.org/) (Secure messaging client)
- [steam](https://store.steampowered.com/) (Steam game client)
- [lutris](https://lutris.net/) (Gaming on Linux)
- [neofetch](https://github.com/dylanaraps/neofetch) (Display software and hardware configuration)
- [proton-bridge](https://proton.me/mail/bridge) (Gateway for proton email integration in thunderbird)

__Drivers :__ 

- [mesa](https://archlinux.org/packages/extra/x86_64/mesa/) (Radeon gpu driver)
- [lib32-mesa](https://archlinux.org/packages/multilib/x86_64/lib32-mesa/) (32 bits gpu driver)
- [vulkan-radeon](https://archlinux.org/packages/extra/x86_64/vulkan-radeon/) (Vulkan for radeon)
- [lib32-vulkan-radeon](https://archlinux.org/packages/multilib/x86_64/lib32-vulkan-radeon/) (32 bits vulkan for radeon)
- [vulkan-tools](https://archlinux.org/packages/extra/x86_64/vulkan-tools/) (Vulkan tools)


<br />

---

__Gaming dependencies :__ 

```proton-ge-custom wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader```
