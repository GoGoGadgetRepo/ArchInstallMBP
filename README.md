# Macbook Pro 11,4

## Installation Instructions
### Setting the font
Macbook Pro have HiDPI which makes reading the text hard. To make it readable.
'''
setfont latarcyrheb-sun32
'''
### Disk Prepararion 

300MB for UEFI Boot
Rest for the root partition

#### Perparing the Harddrive or SSD
'''bash
cgdisk /dev/sda
'''

'''bash
mkfs.vfat -F32 /dev/sda1
mkfs.f2fs -l main /dev/sda2
'''
I am using F2FS as this file system is designed for SSD drives. 

### Mounting drives for install
'''bash
mount /dev/sda2 /mnt
mkdir /mnt/boot && mount /dev/sda1 /mnt/boot
lsblk 
'''
lsblk allows you to look at the structure of the disk.

### Installing Arch Linux files
'''bash
pacstrap /mnt base base-devel vim intel-ucode sudo networkmanager wpa_supplicant  git util-linux sway wlroots wayland swaylock swayidle termite
'''
| Package | Purpose |
---------------------
| base | The required one with base utils. |
| base-devel | Development tools |
| vim | Text Editor |
| intel-ucode | |
| sudo | To run superuser commands without changing the suer |
| networkmanager | |
| wpa_supplicant | |
| git | |

#### Configuring fstab
'''bash
genfstab -L -p /mnt >> /mnt/etc/fstab
'''


arch-chroot /mnt


