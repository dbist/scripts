$HADOOP_HOME/bin/hdfs dfs -mkdir /apps
$HADOOP_HOME/bin/hdfs dfs -chmod 777 /apps
$HADOOP_HOME/bin/hdfs dfs -mkdir /tmp
$HADOOP_HOME/bin/hdfs dfs -chmod -R 777 /tmp
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /mr-history/tmp
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /mr-history/done
$HADOOP_HOME/bin/hdfs dfs -chmod -R 1777 /mr-history
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hbase
$HADOOP_HOME/bin/hdfs dfs -chown -R hbase:hdfs /user/hbase
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /tmp/hadoop-yarn/staging
$HADOOP_HOME/bin/hdfs dfs -chmod -R 777 /tmp/hadoop-yarn/staging
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/vagrant
$HADOOP_HOME/bin/hdfs dfs -chown vagrant:hdfs /user/vagrant
