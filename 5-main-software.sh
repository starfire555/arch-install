sudo pacman -S --noconfirm neofetch btop plocate arch-install-scripts firefox telegram-desktop community/code obsidian nomacs vlc audacity simplescreenrecorder libreoffice gimp flameshot remmina youtube-dl icecast pavucontrol qbittorrent cockpit virt-manager qemu qemu-arch-extra ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat
sudo pacman -S --noconfirm --asdeps freerdp spice-gtk cockpit-pcp cockpit-storaged cockpit-packagekit cockpit-podman cockpit-machines
sudo systemctl enable cockpit.socket
sudo systemctl enable libvirtd

echo ""
echo "######################################################"
echo "### Main software install completed successfully.  ###"
echo "######################################################"
