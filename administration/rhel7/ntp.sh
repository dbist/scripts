# Setup NTPD

yum install -y ntp
systemctl is-enabled ntpd
systemctl enable ntpd

# enable firewall rules for ntp
firewall-cmd --add-service=ntp --permanent
firewall-cmd --reload

systemctl stop ntpd
ntpdate pool.ntp.org
systemctl start ntpd
systemctl status ntpd

echo "wait 30 sec for time to synchronize"
sleep 30
ntpq -p
date -R

