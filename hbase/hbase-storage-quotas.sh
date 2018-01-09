#!/bin/bash

# based on HBASE-16961 script by Josh Elser

reset=`tput sgr0`
green=`tput setaf 2`

echo ""
echo ""
echo "${green}Create a namespace, set a quota on it, and observe it${reset}"
echo ""

echo 'create_namespace "tinyns"' | hbase shell
echo 'set_quota TYPE=>SPACE, NAMESPACE=>"tinyns", LIMIT=>"1M", POLICY=>NO_WRITES' | hbase shell
echo 'list_quotas' | hbase shell

TABLE1="tinyns:quotatbl1"
TABLE2="tinyns:quotatbl2"
TABLE3="tinyns:quotatbl3"

echo ""
echo "${green}Write a small amount of data${reset}"
echo ""

hbase ltt -tn "$TABLE1" -write 10:100:30 -num_keys 200 || echo '*** Failed to write data!'

echo "${green}Make sure the data we wrote is flushed to hfiles${reset}"
echo "flush '$TABLE1'" | hbase shell

echo "${green}Ask the master for the size of the table, waiting a little bit for them to be sent${reset}"

sleep 15
for x in 1 2 3; do echo list_quota_table_sizes | hbase shell; sleep 5; done

echo ""
echo "${green}Write rows to table1${reset}"
echo ""

hbase ltt -tn "$TABLE1" -write 10:100:30 -num_keys 200 || echo '*** Failed to write data!'

echo ""
echo "${green}Make sure the data we wrote is flushed to hfiles${reset}"
echo ""

echo "flush '$TABLE1'" | hbase shell

echo ""
echo "${green}Ask the master for the size of the table, waiting a little bit for them to be sent${reset}"
echo ""

sleep 15
for x in 1 2 3; do echo list_quota_table_sizes | hbase shell; sleep 5; done

echo ""
echo "${green}Just like we got the size report from the master, we should also be able to get it from the RS"
echo "The RS is pulling this info from the Master${reset}"
echo ""

echo "list_quota_snapshots '$(hostname -f),16201'" | hbase shell

echo ""
echo "${green}We are still within our quota, so we expect no output${reset}"
echo ""

echo "list_quota_snapshots '$(hostname -f),16201'" | hbase shell

echo ""
echo "${green}Write rows to table2${reset}"
echo ""

hbase ltt -tn "$TABLE2" -write 10:100:30 -num_keys 200 || echo '*** Failed to write data!'
echo "flush '$TABLE2'" | hbase shell

echo ""
echo "${green}Ask the master for the size of the table, waiting a little bit for them to be sent${reset}"
echo ""

sleep 15
for x in 1 2 3; do echo list_quota_table_sizes | hbase shell; sleep 5; done

echo ""
echo "${green}At this point, we're very close to the quota limit. Write a little more data to exceed it${reset}"
echo ""

hbase ltt -tn "$TABLE3" -write 10:100:30 -num_keys 1000

echo "flush '$TABLE3'" | hbase shell

sleep 15
for x in 1 2 3; do echo list_quota_table_sizes | hbase shell; sleep 5; done

echo ""
echo "${green}We should see violations now!${reset}"
echo ""

echo "list_quota_snapshots '$(hostname -f),16201'" | hbase shell

echo ""
echo "${green}We expect all of these to get rejected because the entire NS should be over quota${reset}"
echo ""

echo "put '$TABLE1', 'r1', 'test_cf:q1', 'this should be rejected'" | hbase shell

echo "put '$TABLE2', 'r1', 'test_cf:q1', 'this should be rejected'" | hbase shell

echo "put '$TABLE3', 'r1', 'test_cf:q1', 'this should be rejected'" | hbase shell
