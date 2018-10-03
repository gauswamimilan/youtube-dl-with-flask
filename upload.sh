git add .
echo "enter commit name"
read name
git commit -m "$name"
gir remote add origin https://github.com/gauswamimilan/youtube-dl-with-flask
git push -u origin master
