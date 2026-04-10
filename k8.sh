#!/bin/bash

# # we are creating 50Gb root disk, but only 20gb is partioned 
# # reamaing 30GB we need to exted using below commands
# growpart /dev/nvme0n1 4
# lvextend -L +30G /dev/RootVG/varVol
# xfs_growfs /var


# dnf -y install dnf-plugins-core
# dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
# dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# systemctl enable docker
# systemctl start docker
# usermod -aG docker ec2-user


# # install EKSCTL 
# ARCH=amd64
# PLATFORM=$(uname -s)_$ARCH
# curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
# tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
# sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl


# # install KUBECTL arm64d
# curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.2/2026-02-27/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH

# # install kubens
# git clone https://github.com/ahmetb/kubectx /opt/kubectx
# ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# # install K9s
# curl -sS https://webinstall.dev/k9s | bash
# ln -sf /home/ec2-user/.local/bin/k9s /usr/local/bin/k9s



# we are creating 50Gb root disk, but only 20gb is partioned 
# reamaing 30GB we need to exted using below commands
growpart /dev/nvme0n1 4
lvextend -L +30G /dev/RootVG/varVol
xfs_growfs /var


dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user


# install EKSCTL 
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl


# install KUBECTL arm64d
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.35.2/2026-02-27/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p /home/ec2-user/bin
cp ./kubectl /home/ec2-user/bin/kubectl

# FIX PATH (important)
chown -R ec2-user:ec2-user /home/ec2-user/bin
ln -sf /home/ec2-user/bin/kubectl /usr/local/bin/kubectl


# install kubens
git clone https://github.com/ahmetb/kubectx /opt/kubectx
ln -sf /opt/kubectx/kubens /usr/local/bin/kubens


# install K9s (FIXED)
curl -sS https://webinstall.dev/k9s | bash

# FIX k9s PATH (THIS IS THE IMPORTANT PART)
ln -sf /home/ec2-user/.local/bin/k9s /usr/local/bin/k9s