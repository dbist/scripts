# Turn off Swappinness
echo "" >> /etc/sysctl.conf
echo "# HBase performance tuning" >> /etc/sysctl.conf
echo "vm.swappiness=0" >> /etc/sysctl.conf
sysctl -w vm.swappiness=0

# Increase this property to 1GB
echo "vm.min_free_kbytes=1048576" >> /etc/sysctl.conf
sysctl -w vm.min_free_kbytes=1048576

# zone_reclaim_node
echo "vm.zone_reclaim_mode=0" >> /etc/sysctl.conf
sysctl -w vm.zone_reclaim_mode=0
