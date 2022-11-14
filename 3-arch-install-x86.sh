clear

echo ">>> Setting ParallelDownloads = 20 in /etc/pacman.conf"
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 20/g' /etc/pacman.conf
echo "..........................................................."

echo ">>> Setting Timezone to Europe/London into /etc/localtime"
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime && hwclock --systohc
echo "..........................................................."

echo ">>> Setting locale to en_GB.UTF-8 UTF-8"
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_GB.UTF-8" > /etc/locale.conf
echo "..........................................................."

#nano -w /etc/vconsole.conf #???

echo ">>> Setting hostname to arch-x86"
echo "arch-x86" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts && echo "::1 localhost" >> /etc/hosts && echo "127.0.1.1 arch-x86.localdomain arch-x86" >> /etc/hosts
echo "..........................................................."

echo ">>> Setting root passwd to password"
echo root:password | chpasswd
echo "..........................................................."

echo ">>> Installing main software"
pacman -S openssh grub efibootmgr networkmanager dialog mtools dosfstools git reflector xdg-utils xdg-user-dirs alsa-utils pulseaudio inetutils base-devel linux-headers bash-completion rsync
echo "..........................................................."
read -p "Press enter to continue"

echo ">>> Setting march=goldmont-plus and MAKEFLAGS=-j5 in /etc/makepkg.config"
sed -i 's/-march=x86-64/-march=goldmont-plus/g' /etc/makepkg.conf
sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j5"/g' /etc/makepkg.conf
echo "..........................................................."

echo ">>> Setting MODULES=(btrfs) in /etc/mkinitcpio.conf"
#sed -i 's/old-text/new-text/g' input.txt
sed -i 's/MODULES=()/MODULES=(btrfs)/g' /etc/mkinitcpio.conf
mkinitcpio -p linux #creates kernel with btrfs included
echo "..........................................................."

echo ">>> Installing GRUB"
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg
echo "..........................................................."

echo ">>> Enabling NetworkManager sshd in systemd"
systemctl enable NetworkManager sshd
echo "..........................................................."

echo ">>> Creating user: x. Setting x passwd to password"
useradd -mG wheel x
echo x:password | chpasswd
echo "x ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/x
echo "..........................................................."
read -p "Press enter to continue"

echo ">>> Installing yay and paru-bin"
echo "password" | sudo -S -u x mkdir /home/x/sources
cd /home/x/sources
sudo -u x git clone https://aur.archlinux.org/yay
cd /home/x/sources/yay

sudo -u x makepkg -si --noconfirm
sudo -u x yay -S --noconfirm paru-bin
echo "..........................................................."

echo ""
echo "############################################"
echo "### Base install completed successfully. ###"
echo "############################################"
echo ""
echo "exit, umount -R /mnt/arch, reboot"
echo "After reboot, proceed as a normal user."
