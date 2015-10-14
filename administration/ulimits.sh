# ulimits to be set
echo "hdfs - nofile 32768" >> /etc/security/limits.conf
echo "mapred - nofile 32768" >> /etc/security/limits.conf
echo "hbase - nofile 32768" >> /etc/security/limits.conf
echo "hive - nproc 32768" >> /etc/security/limits.conf
echo "yarn - nproc 32768" >> /etc/security/limits.conf
echo "storm - nproc 32768" >> /etc/security/limits.conf
