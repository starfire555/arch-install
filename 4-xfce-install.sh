### xfce Install ###
echo ">>> Installing xfce"
sudo pacman -S xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies arc-gtk-theme arc-icon-theme papirus-icon-theme rofi
sudo systemctl set-default graphical
sudo systemctl enable lightdm

echo '#!/bin/bash' > /home/x/.xinitrc
echo 'startxfce4' >> /home/x/.xinitrc
chmod +x /home/x/.xinitrc
echo "..........................................................."

echo ""
echo "############################################"
echo "### xfce install completed successfully. ###"
echo "############################################"
echo ""
