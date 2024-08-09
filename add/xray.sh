#!/bin/bash

rm -f ${0} > /dev/null 2>&1

GITHUB_CMD="https://raw.githubusercontent.com/izulx1/autoscript/master/"

domainSock_dir="/run/xray";! [ -d $domainSock_dir ] && mkdir  $domainSock_dir
chown www-data.www-data $domainSock_dir
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version $latest_version
systemctl stop xray && systemctl disable {xray,xray@}
rm -rf /etc/systemd/system/{xray.service,xray.service.d,xray@.service.d,xray@.service}
wget -O /tmp/ins-xray.sh "${GITHUB_CMD}xray/ins-xray.sh" >/dev/null 2>&1
bash /tmp/ins-xray.sh && rm /tmp/ins-xray.sh >/dev/null 2>&1
chown www-data.www-data /var/log/xray
