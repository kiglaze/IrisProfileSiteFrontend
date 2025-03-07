sudo yum install git
git clone https://github.com/kiglaze/IrisProfileSiteFrontend.git
sudo yum update -y
dnf upgrade --releasever=2023.6.20250303
sudo dnf upgrade --releasever=2023.6.20250303
sudo dnf update -y
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo sed -i 's/$releasever/9/g' /etc/yum.repos.d/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo usermod -aG docker $(whoami)
newgrp docker
docker build -t job-profile-vue .

