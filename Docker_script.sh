#!/bin/sh

#Author Mohamed saouab
#42login : msaouab

sleep 2

Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Cyan='\033[0;36m'
Yellow='\033[0;33m'
NC='\033[0m' # No Color

printf	"${Red}This script is used to Create env Inception in the virtual machine${NC}"

apt-get -y update
apt-get -y upgrade
apt-get -y install vim
apt-get -y install zsh
apt-get -y install git
apt-get -y install tree
mkdir   inception/
cd      inception/
mkdir   srcs/
touch   srcs/.env srcs/docker-compose.yml
mkdir   srcs/requirements/
cd      srcs/requirements/
mkdir   bonus/ mariadb/ nginx/ wordpress/ tools/
mkdir   mariadb/conf mariadb/tools
touch   mariadb/Dockerfile mariadb/.dockerignore
cp -r   mariadb/* wordpress/
cp -r   mariadb/* nginx/
touch   mariadb/conf/my.cnf
touch   nginx/conf/nginx.conf
touch   wordpress/conf/wp-config.php

printf "${RED}Create inception Files Done${NC}"

printf "${RED}install Docker${NC}"

apt-get -y update
apt-get -y install ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
apt-cache madison docker-ce
VERSION=`apt-cache madison docker-ce | awk 'NR==1{print $3}'`
apt-get -y install docker-ce=$VERSION docker-ce-cli=$VERSION containerd.io docker-compose-plugin
service docker start
docker run hello-world
apt-get -y update

echo " > ${Yellow}[DOCKER IS DONE]${NC}"


echo -e "\n            report any issues to me in:"
echo -e "                  GitHub   ~> ${Blue}\e]8;;https://github.com/msaouab\e\\msaouab\e]8;;\e\\ ${NC}"
echo -e "                  42 Intra ~> ${Blue}\e]8;;https://profile.intra.42.fr/users/msaouab\e\\msaouab\e]8;;\e\\ ${NC}"
echo    "DONE"

