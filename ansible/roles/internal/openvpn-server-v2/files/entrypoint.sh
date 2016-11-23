#!/bin/sh

iptables-restore /etc/iptables/rules.v4
cp -R /keys/* /etc/openvpn/keys
chmod 0700 -R /etc/openvpn/keys
chmod 0644 /etc/openvpn/keys/crl.pem
#/usr/sbin/openvpn --daemon openvpn@server--status /run/openvpn/server.status 10 --cd /etc/openvpn --config /etc/openvpn/server.conf
/usr/sbin/openvpn --status /run/openvpn/server.status 10 --cd /etc/openvpn --config /etc/openvpn/server.conf
