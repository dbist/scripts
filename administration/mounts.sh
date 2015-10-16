# create filesystem
mkfs.ext3 /dev/sdc1

# create directory for mount point
mkdir /mnt/datadrive

# mount partition
mount -o  remount,nodiratime,noatime /mnt/datadrive

# save the mount point in fstab
echo "/dev/sdc1               /mnt/datadrive          ext3    defaults,nodiratime,noatime 1 2" >> /etc/fstab