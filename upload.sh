#!/bin/bash
git add .
echo "enter commit name"
read name
git commit -a -m "$name"
gir remote add origin https://github.com/gauswamimilan/youtube-dl-with-flask
git push -u origin dirtest