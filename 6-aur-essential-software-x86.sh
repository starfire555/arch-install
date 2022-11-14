paru -S --noconfirm timeshift-bin timeshift-autosnap zramd microsoft-edge-stable-bin brave-bin
sed -i 's/# MAX_SIZE=8192/MAX_SIZE=4096/g' /etc/default/zramd
sudo systemctl enable zramd.service

echo ""
echo "###############################################################"
echo "### AUR essential software install completed successfully.  ###"
echo "###############################################################"
echo ""
