# job-profile-vue
## Run with docker
### For production:
On Amazon Linux EC2 instance, will need to install git and set up Docker:
```bash
sudo dnf update -y
sudo dnf install -y git
sudo dnf install docker -y
sudo systemctl start docker
sudo systemctl enable docker
```
Verify versions:
```bash
git --version
docker --version
```
Docker permissions:
```bash
sudo usermod -aG docker $USER
```
Then restart SSH connection.

On Amazon Linux EC2 instance, will need to install docker-compose:
```bash
mkdir -p ~/.docker/cli-plugins

curl -SL \
  https://github.com/docker/compose/releases/download/v5.5.0/docker-compose-linux-x86_64 \
  -o ~/.docker/cli-plugins/docker-compose

chmod +x ~/.docker/cli-plugins/docker-compose
```
Verify installation with:
```bash
docker compose version
```
Need later buildx version for build to work:
```bash
mkdir -p ~/.docker/cli-plugins

curl -SL \
  https://github.com/docker/buildx/releases/download/v0.37.0/buildx-v0.37.0.linux-amd64 \
  -o ~/.docker/cli-plugins/docker-buildx

chmod +x ~/.docker/cli-plugins/docker-buildx
```
File setup before docker:
```bash
mkdir JobProfile
cd JobProfile/
git clone https://gitlab.com/kiglaze33/job-profile-vue.git
cd job-profile-vue/
```
Set up .env file.

Build docker for production:
```bash
docker compose -f docker-compose.prod.yml up -d --build
```
AWS Security Rules:

| Type | Port | Source | Purpose |
|---|---:|---|---|
| SSH | 22 | **My IP** | SSH into EC2 |
| HTTP | 80 | `0.0.0.0/0` | Vue production site |
| Custom TCP | 8000 | **My IP** | Temporarily test WordPress |
| HTTPS | 443 | `0.0.0.0/0` | Later, when you configure HTTPS |

Must install WordPress by going to http://PUBLIC_IP:8000.

How to query database in console:
```bash
docker compose -f docker-compose.prod.yml exec db   sh -c 'mariadb -u"$MARIADB_USER" -p"$MARIADB_PASSWORD" "$MARIADB_DATABASE"'
```

In WordPress, to make sure API links are correct format:
WordPress Admin → Settings → Permalinks (Post name) → Save Changes


```bash
docker build --progress=plain --no-cache -t job-profile-vue .
docker run -d -p 8080:80 job-profile-vue
```
---- docker run -d -p 8080:80 -p 443:443 job-profile-vue
### For development:
```bash
DOCKER_BUILDKIT=1 docker compose build --progress=plain --no-cache
docker compose up
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
