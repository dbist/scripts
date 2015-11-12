# script to create a table and pre-split
# expects arguments 1: table name 2: COLUMNFAMILY 3: number of regions 4: algorithm (HexStringSplit or UniformSplit) 5: compression type (NONE) for no compression
echo " expects arguments 1: table name 2: column family name (i.e. cf) 3: number of regions 4: algorithm (HexStringSplit or UniformSplit) 5: compression type (i.e. NONE)"
TABLE=$1
CF=$2
NUMREGIONS=$3
SPLITALGO=$4
COMPRESSION=$5
echo "disable '$TABLE'" | hbase shell
echo "drop '$TABLE'" | hbase shell
hbase org.apache.hadoop.hbase.util.RegionSplitter $TABLE $SPLITALGO -c $NUMREGIONS -f $CF
sleep 3
echo "alter '$TABLE', {NAME => 'cf', DATA_BLOCK_ENCODING => 'FAST_DIFF', COMPRESSION => '$COMPRESSION'}" | hbase shell
