echo "" >> /etc/sysctl.conf
echo "# Turn off swappinness" >> /etc/sysctl.conf
echo "vm.swappiness=0" >> /etc/sysctl.conf
sysctl -w vm.swappiness=0