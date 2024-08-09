#!/bin/bash


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
