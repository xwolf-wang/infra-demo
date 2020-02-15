#!/bin/bash

cd ~

echo
echo "------>Step 0 : install wget unzip git"
echo

sudo yum install -y wget unzip

echo
echo "------>Step 1 : install docker"
echo

sudo yum install -y docker

sleep 1

sudo systemctl enable docker

sudo groupadd docker

sudo usermod -aG docker ${USER}

cat << EOF | sudo tee /etc/docker/daemon.json
{

"insecure-registries" : [ "172.30.0.0/16" ]

}
EOF

sleep 1
sudo systemctl docker start
sleep 5


echo
echo "------>Step 2 : install gcc"
echo

sudo yum -y install gcc gcc-c++ autoconf pcre pcre-devel make automake

echo
echo "------>Step 3 : setup  go env"
echo
wget https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz ~/

sudo tar -C /usr/local -xzf go1.13.7.linux-amd64.tar.gz

echo "------>Step 3.1 : add path in .bash_profile"

echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile

echo
echo "------>Step 4 : install dgoss"
echo
curl -L https://raw.githubusercontent.com/aelsabbahy/goss/master/extras/dgoss/dgoss -o ~/dgoss
sudo mv ~/dgoss /usr/local/bin/
chmod 775 /usr/local/bin/dgoss

curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.6/goss-linux-amd64 -o ~/goss-linux-amd64
echo
echo "------>Step 4.1 : config goss"
echo

echo "export GOSS_PATH=~/goss-linux-amd64" >> ~/.bash_profile

echo
echo "------>Step5 : install terraform"
echo

wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip
sudo unzip terraform_0.12.17_linux_amd64.zip
sudo cp terraform /usr/local/bin


echo
echo "------>Step 6 : install openshift"
echo

wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

tar zxvf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

cd openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit

sudo mv oc kubectl /usr/local/bin/
