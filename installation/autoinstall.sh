apt-get update
apt-get upgrade -y
echo "-apt-get install python3 -y > /dev/null"
apt-get install python3 -y > /dev/null
echo "-apt-get install python3-pip -y > /dev/null"
apt-get install python3-pip -y > /dev/null
echo "-sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
echo "-sudo chmod a+rx /usr/local/bin/youtube-dl"
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "-pip3 install virtualenv -y > /dev/null"
pip3 install virtualenv > /dev/null
echo "-virtualenv ../venv > /dev/null > /dev/null"
virtualenv venv > /dev/null
echo "-apt-get install python -y > /dev/null"
apt-get install python -y > /dev/null
