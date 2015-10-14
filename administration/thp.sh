# turn off transparent huge pages
echo never > /sys/kernel/mm/redhat_transparent_hugepage/enabled
echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag

# confirm it's off by running
sysctl -a | grep hugepage
