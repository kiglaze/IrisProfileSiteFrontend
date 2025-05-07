# job-profile-vue
## Run with docker
```bash
docker build --progress=plain --no-cache -t job-profile-vue .
docker run -d -p 8080:80 -p 443:443 job-profile-vue
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
ssh -i ../../AWS_pems/IrisProfile_KeyPair.pem ec2-user@ec2-34-227-17-7.compute-1.amazonaws.com
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

I chose to stop and disable Apache to free up port 80 for the docker container to run the site on port 80....
Alternatively, if you want to keep Apache, you could configure it as a reverse proxy to forward traffic to your Docker container. However, this adds complexity and is unnecessary unless you have a specific use case for Apache.
```
sudo systemctl stop httpd
sudo systemctl disable httpd
```
### Install certbot
```
sudo yum install -y certbot python3-certbot-nginx
certbot --version
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
sudo certbot --apache -d irisglaze.net -d www.irisglaze.net

```
Run Docker container on port 8080, and use Apache (which is on port 80): 
  - reverse proxy to Docker container
  - <VirtualHost *:80> section added to /etc/httpd/conf.d/irisglaze.conf

Reload Apache to apply changes:
```
sudo systemctl reload httpd
```


### Security Group Rules:
- Inbound Rules:
  - default
  - SSH: Port 22
- Outbound Rules:
  - default
  - HTTP: Port 80
