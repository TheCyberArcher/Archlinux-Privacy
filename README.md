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

```ping aur.archlinux.org```

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

After this, activate the environment : 

```sudo systemctl enable gdm.service``` \
```gsettings set org.gnome.shell disable-user-extensions false```

---

### Firewall configuration

<br />

Install firewalld : ```yay -S firewalld```

Enable the service : ```systemctl enable firewalld```
and start firewalld : ```systemctl start firewalld```

Verify the run : ```firewall-cmd --state```

Set the default zone : ```firewall-cmd --set-default-zone=work```

---

### DNS configuration

<br />

Open Gnome Settings and go to the network page.\
On your network media, open settings and go to IPV4.

The list of encrypted DNS is available on : [privacytools.io](https://www.privacytools.io/encrypted-dns)

At first, we set NextDNS, in secondary AdGuard and Cloudflare (if necessary) : 

``` 45.90.28.250, 45.90.30.250, 9.9.9.9, 149.112.112.112, 1.1.1.1 ```

<br />

[![Network.png](https://i.postimg.cc/tC6YGVp5/Network.png)](https://postimg.cc/4mJJzyK7)

<br />

>These DNS will integrate feeds of malicious sites, with large blocking lists and also prevent data collection.\
Useful when you are not using the VPN, it will always be safer than using the one from Google or your ISP.

<br />

Or in command lane : 

```nmcli con mod "Connexion filaire 1" ipv4.ignore-auto-dns yes``` \
```nmcli con mod "Connexion filaire 1" ipv4.dns "45.90.28.250 45.90.30.250 9.9.9.9 149.112.112.112 1.1.1.1"```

---

### Install a VPN

<br />

A VPN allows you to identify your IP and therefore remain anonymous. Add to this that most solutions also offer blocking of malicious sites, trackers and data collection by third parties.

<br />

>Several VPNs exist, here we offer you the choice of Mullvad-VPN or Proton-VPN.These two players are the most reliable on the market, preference to Mullvad, who has been able to prove in many cases that his no logs policy is indeed valid.

<br />

Mullvad : https://mullvad.net/fr  
Proton : https://protonvpn.com/fr

<br />

Paste in a shell : ``` yay –S mullvad-vpn-bin ```

or ``` yay –S protonvpn-gui ```

<br />

Open the VPN and set the connexion to « autostart ».
Enter your mullvad login, a unique code of numbers.
In VPN settings, choose DNS content blocker. Select Ads, Tracker, Malware, Gambling, Adult Content and Social Media.

<br />

[![Mullvad2.png](https://i.postimg.cc/C1MqFMmK/Mullvad2.png)](https://postimg.cc/B8y6p3WW)

---

### Tools installation

<br />

This part depends on your requirements, your needs and your use of the machine.\
These are the ones I use on a daily basis, but I will try to bring you the most privacy-friendly tools.\
The tools I list are not exhaustive.

- [librewolf-bin](https://librewolf.net/) ```yay -S librewolf-bin```
- [torbrowser-launcher](https://www.torproject.org/fr/download/) ```yay -S torbrowser-launcher```
- [thunderbird](https://www.thunderbird.net/fr/) ```yay -S thunderbird```
- [keepassxc](https://keepassxc.org/) ```yay -S keepassxc```
- [webapp-manager](https://aur.archlinux.org/packages/webapp-manager) ```yay -S webapp-manager```
- [qbittorrent](https://www.qbittorrent.org/) ```yay -S qbittorrent```
- [btop](https://github.com/aristocratos/btop) ```yay -S btop```
- [onlyoffice-bin](https://www.onlyoffice.com/fr/) ```yay -S onlyoffice-bin```
- [visual-studio-code-bin](https://code.visualstudio.com/) ```yay -S visual-studio-code-bin```
- [virtualbox](https://www.virtualbox.org/) ```yay -S virtualbox```
- [openrgb-bin](https://openrgb.org/) ```yay -S openrgb-bin```
- [corectrl](https://gitlab.com/corectrl/corectrl) ```yay -S corectrl-git```
- [ddcutil](https://www.ddcutil.com/) ```yay -S ddcutil```
- [vlc](https://www.videolan.org/vlc/) ```yay -S vlc```
- [webcord](https://discord.com/) ```yay -S webcord```
- [signal-desktop](https://signal.org/download/) ```yay -S signal-desktop```
- [telegram-desktop](https://telegram.org/) ```yay -S telegram-desktop-bin```
- [steam](https://store.steampowered.com/) ```yay -S steam```
- [lutris](https://lutris.net/) ```yay -S lutris```
- [neofetch](https://github.com/dylanaraps/neofetch) ```yay -S neofetch```
- [proton-bridge](https://proton.me/mail/bridge) ```yay -S protonmail-bridge-bin```

---


### Browser configuration


<br />

You can go to this site for more information about the LibreWolf secure browser : https://librewolf.net/docs/faq/

With LibreWolf you already get strong protection against any footprint on the internet. But to solidify the configuration and improve the experience, we will add some extensions:

- [Privacy Badger](https://addons.mozilla.org/fr/firefox/addon/privacy-badger17/) (Blocking against trackers)
- [Youtube Auto HD](https://addons.mozilla.org/fr/firefox/addon/youtube-auto-hd-fps/) (Sets a default resolution)
- [Ublock Origin](https://addons.mozilla.org/fr/firefox/addon/ublock-origin/) (Already included, blocks ads)

If you need additional protection, use the [tor-browser](https://www.torproject.org/fr/download/). In addition to accessing the unindexed web, you will have access to onion sites. Browser traffic will be routed through [TOR](https://www.torproject.org/fr/about/history/) in addition to already being encapsulated in your VPN connection.

---

### Virtualisation

<br />

The choice of virtualization tool will depend on what you need. Virtualbox can do the job very well.\
If you need passtrough GPU or optimal performance, better kernel level and therefore Quemu.

- [Virtualbox](https://www.virtualbox.org/) : ```yay –S virtualbox``` and ```yay -S virtualbox-host-modules-arch```
- [Quemu](https://www.qemu.org/) : ```qemu-desktop```

<br />

Be careful if you want to pass devices (Microphone) into your VM in virtualbox, you must add your user to the vboxusers group and restart.

```usermod –aG «your username» vboxusers```

---


### Control your GPU (Radeon Only)

<br />


If you use 3D applications or want to play video games, it is necessary to install a few things to improve the experience.
We will check if the drivers are up to date, then we will install CoreCTRL.

```yay –S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon```


Download : https://archlinux.org/packages/extra/x86_64/corectrl/ \
Documentation : https://gitlab.com/corectrl/corectrl


```yay –S corectrl```

Open corectrl and go to your GPU settings. You can make a manual ventilation curve, also go to the energy profile and select "performance".
In the tool settings, put corectrl on startup + minimized to tray.

<br />

To avoid having to type the password each time you open the session :

```sudo nano /etc/polkit-1/rules.d/90-corectrl.rules```

Paste the following contents : 

```

 polkit.addRule(function(action, subject) {
    if ((action.id == "org.corectrl.helper.init" ||
         action.id == "org.corectrl.helperkiller.init") &&
        subject.local == true &&
        subject.active == true &&
        subject.isInGroup("your-user-group")) {
            return polkit.Result.YES;
    }
});

```
<br />

To enable overclocking, GPU and memory frequency, add this parameter to your kernel load:

Path : ```/efi/loader/entries/```

Add this at the end of the line "options" : ```amdgpu.ppfeaturemask=0xffffffff```

Reboot the computer to load the new kernel parameter.

---

### ddcutil configuration

<br />

Install ddcutil : 

```yay -S ddcutil```

Edit the configuration file : 

```sudo nano /etc/modules-load.d/i2c.conf```

Paste this line : 

```i2c_dev```

Save the configuration and type in a shell ```modprobe i2c_dev```

You can now control the screen brightness.

---

### Alternative Kernel

<br />

[linux-zen](https://github.com/zen-kernel/zen-kernel) : "Result of a collaborative effort of kernel hackers to provide the best Linux kernel possible for everyday systems"

```yay -S linux-zen linux-zen-headers```

```cd efi/loader/```

Edit the loader configuration file :

```sudo nano loader.conf```

To display installed kernels : ```ls /efi/loader/entries```

On the first line, set the "default" to the "linux-zen" kernel : add ```-zen.conf``` after the ```*```

```bootctl set-default @current```

---

### Gaming on Linux

<br />

If you want to play with Linux, know that it is possible. Since 5 years, advances are enormous, especially with Valve which has pushed proton, a very efficient fork of wine.

- [Steam](https://store.steampowered.com/?l=french) : ```yay –S steam```

<br />

>Steam is the reference platform for playing on Linux, try to use it as much as possible to buy your games and make them work on Linux. This is the most plug and play solution.

To use games under Linux, you must activate proton in the steam settings : 

```SteamPlay : Enable Steam Play for supported titles```

<br />

For any game that does not work with proton steam, use this:

- [ProtonGE](https://github.com/GloriousEggroll/proton-ge-custom) : ```yay –S proton-ge-custom ```

<br />

Reboot steam and select this version of Proton on the game parameter.
Here is the site to check if a game runs well on Linux : [ProtonDB](https://www.protondb.com/)

<br />

Whenever you want to install outside of steam, go through lutris. Install lutris from AUR to benefit from the installation scripts.

- [Lutris](https://lutris.net/) : ```yay –S lutris```

<br />

Install Wine Lutris dependencies : 

```
sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

Then follow the lutris documentation to install your games simply : [Lutris Game Page](https://lutris.net/games)

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
