#!/bin/bash
# 更新mosdns资源文件并重启mosdns
# 创建文件夹
mkdir -p /opt/mosdns
# consts for mosdns files update
PATH_FOR_DIRECT_LIST='/opt/mosdns/direct-list.txt'
PATH_FOR_APPLE_CN='/opt/mosdns/apple-cn.txt'
PATH_FOR_GOOGLE_CN='/opt/mosdns/google-cn.txt'
PATH_FOR_PROXY_LIST='/opt/mosdns/proxy-list.txt'
PATH_FOR_GFW='/opt/mosdns/gfw.txt'
PATH_FOR_CN_IP_CIDR='/opt/mosdns/CN-ip-cidr.txt'
URL_FOR_DIRECT_LIST='https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/direct-list.txt'
URL_FOR_APPLE_CN='https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/apple-cn.txt'
URL_FOR_GOOGLE_CN='https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/google-cn.txt'
URL_FOR_PROXY_LIST='https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/proxy-list.txt'
URL_FOR_GFW='https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/gfw.txt'
URL_FOR_CN_IP_CIDR='https://cdn.jsdelivr.net/gh/Hackl0us/GeoIP2-CN@release/CN-ip-cidr.txt'
#
# back up first
mv ${PATH_FOR_DIRECT_LIST} ${PATH_FOR_DIRECT_LIST}.bak
# update direct-list.txt
curl -s -o ${PATH_FOR_DIRECT_LIST} ${URL_FOR_DIRECT_LIST}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_DIRECT_LIST}.bak ${PATH_FOR_DIRECT_LIST}
else
	rm -f ${PATH_FOR_DIRECT_LIST}.bak
fi
mv ${PATH_FOR_APPLE_CN} ${PATH_FOR_APPLE_CN}.bak
# update apple-cn.txt
curl -s -o ${PATH_FOR_APPLE_CN} ${URL_FOR_APPLE_CN}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_APPLE_CN}.bak ${PATH_FOR_APPLE_CN}
else
	rm -f ${PATH_FOR_APPLE_CN}.bak
fi
mv ${PATH_FOR_GOOGLE_CN} ${PATH_FOR_GOOGLE_CN}.bak
# update google-cn.txt
curl -s -o ${PATH_FOR_GOOGLE_CN} ${URL_FOR_GOOGLE_CN}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_GOOGLE_CN}.bak ${PATH_FOR_GOOGLE_CN}
else
	rm -f ${PATH_FOR_GOOGLE_CN}.bak
fi
mv ${PATH_FOR_PROXY_LIST} ${PATH_FOR_PROXY_LIST}.bak
# update proxy-list.txt
curl -s -o ${PATH_FOR_PROXY_LIST} ${URL_FOR_PROXY_LIST}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_PROXY_LIST}.bak ${PATH_FOR_PROXY_LIST}
else
	rm -f ${PATH_FOR_PROXY_LIST}.bak
fi
mv ${PATH_FOR_GFW} ${PATH_FOR_GFW}.bak
# update gfw.txt
curl -s -o ${PATH_FOR_GFW} ${URL_FOR_GFW}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_GFW}.bak ${PATH_FOR_GFW}
else
	rm -f ${PATH_FOR_GFW}.bak
fi
mv ${PATH_FOR_CN_IP_CIDR} ${PATH_FOR_CN_IP_CIDR}.bak
# update CN-ip-cidr.txt
curl -s -o ${PATH_FOR_CN_IP_CIDR} ${URL_FOR_CN_IP_CIDR}
if [[ $? -ne 0 ]]; then
	mv ${PATH_FOR_CN_IP_CIDR}.bak ${PATH_FOR_CN_IP_CIDR}
else
	rm -f ${PATH_FOR_CN_IP_CIDR}.bak
fi
touch /opt/mosdns/force-nocn.txt
touch /opt/mosdns/force-cn.txt
touch /opt/mosdns/hosts.txt
# restart mosdns
docker restart mosdns
