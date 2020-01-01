# Macbook Pro 11,4 {Status = Development}

You can follow the readme file and carry the setup step by step or run the automated scripts. 
There are 3 sripts (pre, post and package install).

## Installation Instructions
### Setting the font
Macbook Pro have HiDPI which makes reading the text hard. To make it readable.
```
setfont latarcyrheb-sun32
```
If the system is not connected to internet through LAN, it can be connected using wifi
```
wifi-menu
```

Git is not avaialble in the start which can be installed using:
```
pacman -Sy git
```

### Disk Prepararion 
Following is my disk setup. I am choosing not to create a special parition for swap file. If swap is required in the future, I plan to create a swap file.

| Size | Mount Point | Format | Patition Code |
|---|---|---|---|
| 300M | /boot | FAT32 | UEFI Boot Parition |
| * | / | ext4 | Linux File System |

```bash
cgdisk /dev/sda
```
#### Formating the Drives
This setup will be using F2FS as this file system designed for falsh drives.
```bash
mkfs.vfat -F32 /dev/sda1
mkfs.ext4 -l main /dev/sda2
```

#### Mounting drives for install
```bash
mount /dev/sda2 /mnt
mkdir /mnt/boot && mount /dev/sda1 /mnt/boot
lsblk 
```
lsblk allows you to look at the structure of the disk.

### Installing Arch Linux files
```bash
pacstrap /mnt base base-devel vim intel-ucode sudo networkmanager wpa_supplicant  git util-linux sway wlroots wayland swaylock swayidle termite mako grim slurp wl-clipboard
```
| Package | Purpose |
|---|---|
| base | The required one with base utils. |
| base-devel | Development tools |
| vim | Text Editor |
| intel-ucode | |
| sudo | To run superuser commands without changing the suer |
| networkmanager | Package to manage network connections |
| wpa_supplicant | |
| git | |
| util-linux | |
| sway | Wayland based tiling windows manager and 100% compatible with i3 |
| wlroots | Required by wayland |
| wayland | The new Xorg compositor |
| swaylock | Sway's addon to allow system lockdown with idle |
| swayidle | | 
| termite | Terminal application |
| mako | Notification Daemon |
| grim + slurp | Screenshot |
| wl-clipboard | Clipboard copy/paste |

#### Configuring fstab
```bash
genfstab -L -p /mnt >> /mnt/etc/fstab
```


arch-chroot /mnt


