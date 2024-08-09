#!/bin/bash 

rm -f ${0} >/dev/null 2>&1

GITHUB_CMD="https://raw.githubusercontent.com/izulx1/autoscript/master/"
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb
dpkg -i /tmp/gotop.deb >/dev/null 2>&1

# Buat swap sebesar 2GB
dd if=/dev/zero of=/swapfile bs=1M count=2048
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile
swapon /swapfile
sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
chronyd -q 'server 0.id.pool.ntp.org iburst'
chronyc sourcestats -v
chronyc tracking -v
wget -q ${GITHUB_CMD}add/bbr.sh &&  chmod +x bbr.sh && ./bbr.sh
