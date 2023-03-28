# !/bin/bash
# 备份原来的源文件
cp /etc/apt/sources.list /etc/apt/sources.list.bak
# 获取系统的版本信息
SYS_VERSION=$(lsb_release -c | grep -o "\s.*")
# 清空原有的源内容
echo "" > /etc/apt/sources.list
# 将阿里云的源数据源设置到sources.list文件中
cat >> /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $SYS_VERSION-proposed main restricted universe multiverse
EOF
apt-get update
apt-get upgrade
