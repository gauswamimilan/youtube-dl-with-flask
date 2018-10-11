#!/bin/bash
git add .
echo "enter commit name"
read name
git commit -a -m "$name"
#git remote add origin https://github.com/gauswamimilan/youtube-dl-with-flask
echo "enter branch 1:-master 2:-dirtest"
read branch
if [ $1 == 1 ]
then
	git push -u origin master
fi
if [ $1 == 2 ]
then
	git push -u origin dirtest
fi