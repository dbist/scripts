#TODO
1. convert to markdown

#hadoop

sudo su
su hadoop
cat .ssh/id_rsa.pub > .ssh/authorized_keys
/opt/hadoop/hadoop-2.7.4/bin/hdfs namenode -format

$HADOOP_HOME/sbin/start-dfs.sh
 > yes
 > yes
 > yes
$HADOOP_HOME/sbin/start-yarn.sh
hdfs dfs -mkdir /apps
hdfs dfs -chmod 777 /apps
hdfs dfs -mkdir -p /user/hbase
hdfs dfs -chown -R hbase:hdfs /user/hbase
hdfs dfs -mkdir -p /tmp/hadoop-yarn/staging
hdfs dfs -chmod -R 777 /tmp/hadoop-yarn/staging
hdfs dfs -mkdir /user/vagrant
hdfs dfs -chown vagrant:hdfs /user/vagrant


#hbase
cat .ssh/id_rsa.pub > .ssh/authorized_keys
$HBASE_HOME/bin/start-hbase.sh
 > yes
 
 
 hbase org.apache.hadoop.hbase.util.LoadTestTool -write 1:10:100 -num_keys 1000000 -read 100:30 -num_tables 1 -data_block_encoding NONE -tn ltt
 
 hbase org.apache.hadoop.hbase.PerformanceEvaluation \
 --nomapred --rows=100000 --columns=10 --latency=True \
 --valueSize=10 --presplit=5  randomWrite 9
