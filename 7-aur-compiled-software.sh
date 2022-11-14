paru -S --noconfirm zoom
paru -S --noconfirm darksnow && systemctl enable icecast
paru -S --noconfirm xrdp && paru -S --noconfirm xorgxrdp && sudo systemctl enable xrdp
#paru -S --noconfirm handbrake-full

echo ""
echo "##############################################################"
echo "### AUR compiled software install completed successfully.  ###"
echo "##############################################################"
echo ""
