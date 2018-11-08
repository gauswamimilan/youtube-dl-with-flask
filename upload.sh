#!/bin/bash
git add .
echo "enter commit name"
read name
git commit -a -m "$name"
git push -u origin master
rm -f ./.git/index.lock