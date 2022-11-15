sudo cat << EOF >> /etc/fstab

#/dev/sdb1
UUID=7602-8686                                  /mnt/sdb		exfat           rw,relatime,user,noauto 0 0

#/dev/sdc1
UUID=d130d8a9-a47b-4ab1-b879-7e8eaecba799	/mnt/sdc		btrfs      	rw,relatime,user	0 0

#/dev/sdd1
UUID=d2d4d369-9b13-4757-9abe-edb6163d454f	/mnt/sdd		btrfs      	rw,relatime,user	0 0

EOF
