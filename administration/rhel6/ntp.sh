# Setup NTPD

chkconfig --list ntpd
chkconfig ntpd on

service ntpd stop
ntpdate pool.ntp.org
service ntpd start
