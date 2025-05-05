#!/bin/bash
set -eux
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y nginx net-tools
systemctl enable nginx
systemctl start nginx
