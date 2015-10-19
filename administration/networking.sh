# Hadoop relies heavily on DNS, and as such performs many DNS lookups during 
# normal operation. To reduce the load on your DNS infrastructure, 
# it's highly recommended to use the Name Service Caching Daemon (NSCD) on 
# cluster nodes running Linux. This daemon will cache host, user, and group 
# lookups and provide better resolution performance, and reduced load 
# on DNS infrastructure.

yum install -y nscd

