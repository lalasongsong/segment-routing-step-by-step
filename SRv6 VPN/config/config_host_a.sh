systemctl disable NetworkManager
systemctl stop NetworkManager
systemctl disable firewalld
systemctl stop firewalldd
ip addr add 192.168.119.21/24 dev ens32
ip addr add 30.30.30.1/24 dev ens34
systemctl enable sshd
systemctl restart sshd

ip route add 20.20.20.0/24 via 30.30.30.2

#ip addr add 2000:200a::100a/120 dev ens34

sysctl -w net.ipv4.ip_forward=1
sysctl -w net.ipv6.conf.all.forwarding=1
sysctl -w net.ipv6.conf.all.seg6_enabled=1
sysctl -w net.ipv6.conf.default.seg6_enabled=1
sysctl -w net.ipv6.conf.ens32.seg6_enabled=1
sysctl -w net.ipv6.conf.ens34.seg6_enabled=1
sysctl -w net.ipv6.conf.lo.seg6_enabled=1
sysctl -w net.ipv4.conf.all.rp_filter=0

ip route add 2000:200b::100b/120 via 2000:200a::1001
