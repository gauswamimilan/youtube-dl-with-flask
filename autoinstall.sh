#!/bin/bash
apt-get update
apt-get upgrade -y

echo "-apt-get install python3 -y > /dev/null"
apt-get install python3 -y > /dev/null

echo "-apt-get install python3-pip -y > /dev/null"
apt-get install python3-pip -y > /dev/null

echo "-apt-get install python -y > /dev/null"
apt-get install python -y > /dev/null

echo "-apt-get install nginx -y > /dev/null"
apt-get install nginx -y > /dev/null

echo "->start nginx"
/etc/init.d/nginx start > /dev/null

echo "---changing nginx setting"
rm /etc/nginx/sites-enabled/default
touch /etc/nginx/sites-available/flask_settings
ln -s /etc/nginx/sites-available/flask_settings /etc/nginx/sites-enabled
cat youtube-dl-with-flask/installation/server_setting.txt >> /etc/nginx/sites-enabled/flask_settings

echo "--restart nginx"
/etc/init.d/nginx restart > /dev/null

echo "->installing youtube-dl"
echo "-sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

echo "-sudo chmod a+rx /usr/local/bin/youtube-dl"
sudo chmod a+rx /usr/local/bin/youtube-dl

echo "-sudo apt-get install build-essential chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1 -y > /dev/null"
sudo apt-get install build-essential chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1 -y > /dev/null

echo "->downloading phantomjs"
sudo wget -q https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
echo "extracting phantomjs"
sudo tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

echo "->testing phantomjs"
phantomjs --version

echo "-pip3 install virtualenv > /dev/null"
pip3 install virtualenv > /dev/null

echo "-git clone https://github.com/gauswamimilan/youtube-dl-with-flask > /dev/null"
git clone https://github.com/gauswamimilan/youtube-dl-with-flask > /dev/null

echo "-virtualenv -p python3 youtube-dl-with-flask/venv  > /dev/null"
virtualenv -p python3 youtube-dl-with-flask/venv > /dev/null

echo "source youtube-dl-with-flask/venv/bin/activate > /dev/null"
source youtube-dl-with-flask/venv/bin/activate > /dev/null

echo "-pip3 install flask > /dev/null"
pip3 install flask > /dev/null

echo "-pip3 install gunicorn > /dev/null"
pip3 install gunicorn > /dev/null
