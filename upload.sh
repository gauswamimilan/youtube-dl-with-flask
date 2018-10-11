#!/bin/bash
git add .
echo "enter commit name"
read name
git commit -a -m "$name"
git push -u origin master