#!/bin/bash
git add .
echo "enter commit name"
read name
git commit -a -m "$name"
#git remote add origin https://github.com/gauswamimilan/youtube-dl-with-flask
echo "enter branch 1:-master 2:-dirtest"
read branch
git push -u origin $branch 