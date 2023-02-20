#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
downurl=https://raw.githubusercontent.com/tyycloud/LinuxPanel/main/

if [ -f "/usr/bin/yum" ] && [ -d "/etc/yum.repos.d" ]; then
	wget -O cenos.sh $downurl/cenos.sh && bash cenos.sh
elif [ -f "/usr/bin/apt-get" ]; then
	if grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        wget -O other.sh $downurl/cenos.sh && bash other.sh
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        wget -O other.sh $downurl/cenos.sh && sudo bash other.sh
	else
		echo "当前系统不支持安装此软件"
		exit;
	fi
fi
