#!/bin/bash
# 更新mosdns资源文件并重启mosdns
# consts for mosdns files update
PATH_FOR_DIRECT_LIST='/opt/mosdns/direct-list.txt'
PATH_FOR_APPLE_CN='/opt/mosdns/apple-cn.txt'
PATH_FOR_ICLOUD='/opt/mosdns/icloud.txt'
PATH_FOR_GOOGLE_CN='/opt/mosdns/google-cn.txt'
PATH_FOR_PROXY_LIST='/opt/mosdns/proxy-list.txt'
PATH_FOR_GFW='/opt/mosdns/gfw.txt'
PATH_FOR_TLD_NOT_CN='/opt/mosdns/tld-not-cn.txt'
PATH_FOR_PROXY_TLD_LIST='/opt/mosdns/proxy-tld-list.txt'
PATH_FOR_CN_IP_CIDR='/opt/mosdns/CN-ip-cidr.txt'
URL_FOR_DIRECT_LIST='https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/direct-list.txt'
URL_FOR_APPLE_CN='https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/apple-cn.txt'
URL_FOR_ICLOUD='https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/icloud.txt'
URL_FOR_GOOGLE_CN='https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/google-cn.txt'
URL_FOR_PROXY_LIST='https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/proxy-list.txt'
URL_FOR_GFW='https://raw.githubusercontent.com/Loyalsoldier/v2ray-rules-dat/release/gfw.txt'
URL_FOR_TLD_NOT_CN='https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/tld-not-cn.txt'
URL_FOR_PROXY_TLD_LIST='https://raw.githubusercontent.com/v2rayA/dist-v2ray-rules-dat/master/proxy-tld-list.txt'
URL_FOR_CN_IP_CIDR='https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/CN-ip-cidr.txt'
#
# update direct-list.txt
# back up first
mv ${PATH_FOR_DIRECT_LIST} ${PATH_FOR_DIRECT_LIST}.bak
curl -s -o ${PATH_FOR_DIRECT_LIST} ${URL_FOR_DIRECT_LIST}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_DIRECT_LIST}.bak ${PATH_FOR_DIRECT_LIST}
else
	rm -f ${PATH_FOR_DIRECT_LIST}.bak
fi
#
# update apple-cn.txt
mv ${PATH_FOR_APPLE_CN} ${PATH_FOR_APPLE_CN}.bak
curl -s -o ${PATH_FOR_APPLE_CN} ${URL_FOR_APPLE_CN}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_APPLE_CN}.bak ${PATH_FOR_APPLE_CN}
else
	rm -f ${PATH_FOR_APPLE_CN}.bak
fi
#
# update icloud.txt
#mv ${PATH_FOR_ICLOUD} ${PATH_FOR_ICLOUD}.bak
#curl -s -o ${PATH_FOR_ICLOUD} ${URL_FOR_ICLOUD}
#if [[ $? -ne 0 ]]; then
#	mv ${PATH_FOR_ICLOUD}.bak ${PATH_FOR_ICLOUD}
#else
#	rm -f ${PATH_FOR_ICLOUD}.bak
#fi
#
# update google-cn.txt
mv ${PATH_FOR_GOOGLE_CN} ${PATH_FOR_GOOGLE_CN}.bak
curl -s -o ${PATH_FOR_GOOGLE_CN} ${URL_FOR_GOOGLE_CN}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_GOOGLE_CN}.bak ${PATH_FOR_GOOGLE_CN}
else
	rm -f ${PATH_FOR_GOOGLE_CN}.bak
fi
#
# update proxy-list.txt
mv ${PATH_FOR_PROXY_LIST} ${PATH_FOR_PROXY_LIST}.bak
curl -s -o ${PATH_FOR_PROXY_LIST} ${URL_FOR_PROXY_LIST}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_PROXY_LIST}.bak ${PATH_FOR_PROXY_LIST}
else
	rm -f ${PATH_FOR_PROXY_LIST}.bak
fi
#
# update gfw.txt
mv ${PATH_FOR_GFW} ${PATH_FOR_GFW}.bak
curl -s -o ${PATH_FOR_GFW} ${URL_FOR_GFW}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_GFW}.bak ${PATH_FOR_GFW}
else
	rm -f ${PATH_FOR_GFW}.bak
fi
#
# update tld-not-cn.txt
#mv ${PATH_FOR_TLD_NOT_CN} ${PATH_FOR_TLD_NOT_CN}.bak
#curl -s -o ${PATH_FOR_TLD_NOT_CN} ${URL_FOR_TLD_NOT_CN}
#if [[ $? -ne 0 ]]; then
#	mv ${PATH_FOR_TLD_NOT_CN}.bak ${PATH_FOR_TLD_NOT_CN}
#else
#	rm -f ${PATH_FOR_TLD_NOT_CN}.bak
#fi
#
# update proxy-tld-list.txt
mv ${PATH_FOR_PROXY_TLD_LIST} ${PATH_FOR_PROXY_TLD_LIST}.bak
curl -s -o ${PATH_FOR_PROXY_TLD_LIST} ${URL_FOR_PROXY_TLD_LIST}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_PROXY_TLD_LIST}.bak ${PATH_FOR_PROXY_TLD_LIST}
else
	rm -f ${PATH_FOR_PROXY_TLD_LIST}.bak
fi
#
# update CN-ip-cidr.txt
mv ${PATH_FOR_CN_IP_CIDR} ${PATH_FOR_CN_IP_CIDR}.bak
curl -s -o ${PATH_FOR_CN_IP_CIDR} ${URL_FOR_CN_IP_CIDR}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_CN_IP_CIDR}.bak ${PATH_FOR_CN_IP_CIDR}
else
	rm -f ${PATH_FOR_CN_IP_CIDR}.bak
fi
#
touch /opt/mosdns/icloud.txt
touch /opt/mosdns/tld-not-cn.txt
touch /opt/mosdns/force-nocn.txt
touch /opt/mosdns/force-cn.txt
touch /opt/mosdns/hosts.txt
touch /opt/mosdns/redirect.txt
#
# restart mosdns
docker restart mosdns
