echo ">>> Getting best mirrors and writing to /etc/pacman.d/mirrorlist"
reflector -c "United Kingdom" -a 6 --sort rate --save /etc/pacman.d/mirrorlist
echo "..........................................................."

echo ">>> Setting ParallelDownloads = 20 in /etc/pacman.conf"
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 20/g' /etc/pacman.conf
echo "..........................................................."

clear
pacstrap /mnt/arch base linux linux-firmware nano intel-ucode btrfs-progs
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



