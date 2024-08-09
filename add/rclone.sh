#!/bin/bash

rm -f ${0} >/dev/null 2>&1
GITHUB_CMD2="https://raw.githubusercontent.com/zhets/ScriptAutoInstall-xdxl/main/"
apt install rclone -y
printf "q\n" | rclone config
wget -q -O /root/.config/rclone/rclone.conf "${GITHUB_CMD2}rclone.conf"
cd /bin
git clone  https://github.com/zhets/wondershaper.git
cd wondershaper
sudo make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user oceantestdigital@gmail.com
from oceantestdigital@gmail.com
password jokerman77
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc

	echo '*/1 * * * * root echo -n > /var/log/nginx/access.log' >>/etc/cron.d/log.nginx
	echo '*/1 * * * * root echo -n > /var/log/xray/access1.log' >>/etc/cron.d/log.vmess
	echo '*/1 * * * * root echo -n > /var/log/xray/access2.log' >>/etc/cron.d/log.vless
	echo '*/1 * * * * root echo -n > /var/log/xray/access3.log' >>/etc/cron.d/log.trojan
	echo '*/1 * * * * root echo -n > /var/log/xray/access4.log' >>/etc/cron.d/log.ss
