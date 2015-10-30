# Setup NTPD

systemctl is-enabled ntpd
systemctl enable ntpd

systemctl stop ntpd
ntpdate pool.ntp.org
systemctl start ntpd
