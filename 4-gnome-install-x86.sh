### Gnome Install ###
echo ">>> Installing intel drivers"
sudo pacman -S xf86-video-intel
echo "..........................................................."
read -p "Press enter to continue"

echo ">>> Installing Gnome"
sudo pacman -S --noconfirm xorg gdm gnome gnome-extra gnome-tweaks
sudo systemctl set-default graphical
sudo systemctl enable gdm

echo '#!/bin/bash' > /home/x/.xinitrc
echo 'gnome-session' >> /home/x/.xinitrc
chmod +x /home/x/.xinitrc
echo "..........................................................."

echo ""
echo "#############################################"
echo "### Gnome install completed successfully. ###"
echo "#############################################"
echo ""
