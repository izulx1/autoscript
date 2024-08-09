#!/bin/bash
rm -f ${0} >/dev/null 2>&1

GITHUB_CMD="https://raw.githubusercontent.com/izulx1/autoscript/master/"

wget -O /usr/sbin/noobzvpns "https://raw.githubusercontent.com/noobz-id/noobzvpns/master/noobzvpns.x86_64"
chmod 777 /usr/sbin/noobzvpns

cat > /etc/noobzvpns/config.json <<-END
{
	"tcp_std": [
		8880
	],
	"tcp_ssl": [
		9443
	],
	"ssl_cert": "/etc/xray/xray.crt",
	"ssl_key": "/etc/xray/xray.key",
	"ssl_version": "AUTO",
	"conn_timeout": 60,
	"dns_resolver": "/etc/resolv.conf",
	"http_ok": "HTTP/1.1 101 Switching Protocols[crlf]Upgrade: websocket[crlf]Connection: Upgrade[crlf][crlf]"
}
END

wget -q -O /etc/systemd/system/noobzvpns.service "${GITHUB_CMD}service/noobzvpns.service"
systemctl enable noobzvpns
systemctl restart noobzvpns
