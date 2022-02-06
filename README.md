# Inception

This project consists on setting up a small infrastructure composed of different
services, by virtualizing several docker images under specific rules. The whole project is done in a virtual machine.

Here is the diagram of the result:

![Screenshot 2022-02-06 at 03 01 39](https://user-images.githubusercontent.com/60663416/152665185-7ccac267-5f7c-48b5-a0e5-df0f48d1713b.png)

## VirtualBox setup

#### 1. Install and configure your VirtualBox environment. I have installed Debian.

https://www.nakivo.com/blog/use-virtualbox-quick-overview/

# 2. Install and configure sudo

```bash
su -
apt-get update
apt-get install sudo
usermod -aG sudo USERNAME
```

3. Install vim

```bash
apt-get install vim
```

4. Install and configure SSH

```bash
sudo apt install openssh-server
```
Set up an SSH Port
```bash
sudo vim /etc/ssh/sshd_config
```
Find line 13 and uncomment the port
```bash
Port 22
```
Restart SSH 
```bash
sudo service sshd restart
```
Check conection status
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


## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install foobar
```

## Usage

```python
import foobar

# returns 'words'
foobar.pluralize('word')

# returns 'geese'
foobar.pluralize('goose')

# returns 'phenomenon'
foobar.singularize('phenomena')
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
