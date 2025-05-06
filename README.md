# job-profile-vue
## Run with docker
```bash
set -a; source .env; set +a
docker build --no-cache --build-arg GITHUB_USERNAME=$GITHUB_USERNAME \
             --build-arg GITHUB_PAT=$GITHUB_PAT \
             --build-arg GITHUB_REPO=$GITHUB_REPO \
             -t job-profile-vue .
docker run -p 8080:80 job-profile-vue
```

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

## AWS EC2 Instance Setup:
### SSH
```
ssh -i IrisProfile_KeyPair.pem ec2-user@ec2-34-227-17-7.compute-1.amazonaws.com
```
### Initial Commands in EC2 Instance Terminal
```
sudo yum update -y
sudo yum install -y httpd
sudo yum install -y git

sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd

sudo dnf install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
newgrp docker
docker info

git clone https://github.com/kiglaze/IrisProfileSiteFrontend.git
cd IrisProfileSiteFrontend
cp .env.template .env
```
Fill out .env file variables in .env file.


### Security Group Rules:
- Inbound Rules:
  - default
  - SSH: Port 22
- Outbound Rules:
  - default
  - HTTP: Port 80
