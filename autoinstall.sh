#!/bin/bash
apt-get update
apt-get upgrade -y
echo "-apt-get install python3 -y > /dev/null"
apt-get install python3 -y > /dev/null
echo "-apt-get install python3-pip -y > /dev/null"
apt-get install python3-pip -y > /dev/null
echo "-apt-get install python -y > /dev/null"
apt-get install python -y > /dev/null
echo "-sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
echo "-sudo chmod a+rx /usr/local/bin/youtube-dl"
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "-pip3 install virtualenv > /dev/null"
pip3 install virtualenv > /dev/null
echo "-wget https://github.com/gauswamimilan/youtube-dl-with-flask > /dev/null"
wget https://github.com/gauswamimilan/youtube-dl-with-flask > /dev/null
echo "-virtualenv -p python3 youtube-dl-with-flask/venv  > /dev/null"
virtualenv -p python3 youtube-dl-with-flask/venv > /dev/null
echo "source youtube-dl-with-flask/venv/bin/activate > /dev/null"
source youtube-dl-with-flask/venv/bin/activate > /dev/null
echo "-pip3 install flask > /dev/null"
pip3 install flask > /dev/null
echo "-pip3 install gunicorn > /dev/null"
pip3 install gunicorn > /dev/null