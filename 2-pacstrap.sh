reflector -c "United Kingdom" -a 6 --sort rate --save /etc/pacman.d/mirrorlist
echo "ParallelDownloads = 20" >> /etc/pacman.conf
clear
pacstrap /mnt/arch base linux linux-firmware nano intel-ucode
genfstab -U /mnt/arch >> /mnt/arch/etc/fstab

echo ""
echo "########################################################"
echo "### pacstrap complete                                ###"
echo "###                                                  ###"
echo "### Type:   arch-chroot /mnt/arch                    ###"
echo "###                                                  ###"
echo "### Then run the next script from inside the chroot  ###"
echo "###                                                  ###"
echo "########################################################"
echo ""



