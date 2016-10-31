### Manual Launch Steps

If launching this outside the realm of terraform, follow the steps below to get a functional openvpn server going:

1. Update the `/etc/openvpn/get-openvpn-certs.env` file with the S3 url path to find the certs
1. Append `route <public ip here> 255.255.255.255 net_gateway` to the `/etc/openvpn/server.conf` file
1. `systemctl start get-openvpn-certs`
1. `systemctl restart openvpn@server`
1. `systemctl restart iptables`
