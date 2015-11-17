# erase everything in HBase, including zookeeper parent
# Usage: hbase clean (--cleanZk|--cleanHdfs|--cleanAll)
# Options:
#        --cleanZk   cleans hbase related data from zookeeper.
#        --cleanHdfs cleans hbase related data from hdfs.
#        --cleanAll  cleans hbase related data from both zookeeper and hdfs.
#
#

hbase clean --cleanAll


