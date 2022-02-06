# Inception

This project consists on building Nginx, Wordpress and MariaDB services on separate containers based on Apline Linux, with a volume for  WordPress Database and Wordpress website files, and establishing a connection between them through a docker-network.


Here is the diagram of the result:

![Screenshot 2022-02-06 at 03 01 39](https://user-images.githubusercontent.com/60663416/152665185-7ccac267-5f7c-48b5-a0e5-df0f48d1713b.png)

## VirtualBox setup

#### 1. Install and configure your VirtualBox environment. I have installed Debian.

https://www.nakivo.com/blog/use-virtualbox-quick-overview/

#### 2. Install and configure sudo

```bash
su -
apt-get update
apt-get install sudo
usermod -aG sudo USERNAME
```

#### 3. Install vim

```bash
apt-get install vim
```

#### 4. Install and configure SSH

```bash
sudo apt install openssh-server
```
  Set up a ssh port
```bash
sudo vim /etc/ssh/sshd_config
```
  Find the port and uncomment it
```bash
Port 22
```
  Restart ssh
```bash
sudo service sshd restart
```
  Check ssh conection status
```bash
sudo service sshd status
```
  Find out your host
```bash
hostname -I
```
  Connect via ssh from outside of your virtual machine
```bash
ssh USERNAME@HOST -p 22
```

#### 5. Install docker

Install packages to allow apt to use a repository over HTTPS
```bash
sudo apt-get install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
```
Add Docker’s official GPG key
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
Use the following command to set up the stable repository
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Install the latest version of Docker Engine and containerd
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

#### 5. Install docker-compose
Download the current stable release of Docker Compose
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
Apply executable permissions to the binary
```bash
sudo chmod +x /usr/local/bin/docker-compose
```

#### 6. Install git
```bash
sudo apt-get install git
```

#### 7. Install make
```bash
sudo apt-get install make
```

## Usage
Clone the repository in your freshly installed virtual machine
```bash
make run
```
