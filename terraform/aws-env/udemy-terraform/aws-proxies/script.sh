#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install squid
apt-get update
apt-get -y install squid

# Update squid config
sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf

# Create sa user
useradd sa -p "AQ!SW@de3?" --create-home --groups sudo
mkdir /home/sa/.ssh
chmod 700 /home/sa/.ssh/

# Copy ssh key for sa
cat /tmp/ecdsa-wsec-deployment.pub >> /home/sa/.ssh/authorized_keys
chmod 600 /home/sa/.ssh/authorized_keys

# Change permissions
chown sa:sa /home/sa/.ssh -R
echo "sa ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

# make sure squid is started
service squid restart
