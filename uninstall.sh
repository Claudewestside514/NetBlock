#!/system/bin/sh
IPTABLES="/system/bin/iptables"
IP6TABLES="/system/bin/ip6tables"

# Remove all NetBlock rules
for CMD in "$IPTABLES" "$IP6TABLES"; do
    $CMD -F NETBLOCK 2>/dev/null
    $CMD -D OUTPUT -j NETBLOCK 2>/dev/null
    $CMD -X NETBLOCK 2>/dev/null
done

# Remove data
rm -rf /data/adb/netblock
rm -rf /data/adb/modules/netblock
