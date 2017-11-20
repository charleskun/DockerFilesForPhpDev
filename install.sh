#!/bin/bash
mkdir ~/Work ~/Work/data ~/Work/log ~/Work/log/nginx ~/Work/log/php ~/Work/web
apt-get install -y git curl python-pip
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=https://ytu9d8zj.mirror.aliyuncs.com\"" | sudo tee -a /etc/default/docker
service docker restart
pip install -U docker-compose




