# partition disk as ext4
fdisk /dev/sdc
p
n
p
1
accept defaults
p
w

# create filesystem
mkfs.ext4 /dev/sdc1

# create directory for mount point
mkdir -p /mnt/datadrive1

# mount partition
mount /dev/sdc1 /mnt/datadrive1
mount -o  remount,nodiratime,noatime,dirsync /mnt/datadrive1

# save the mount point in fstab
echo "/dev/sdc1              /mnt/datadrive         ext4    defaults,nodiratime,noatime,dirsync 1 2" >> /etc/fstab