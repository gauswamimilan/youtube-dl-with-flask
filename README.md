# youtube-dl-with-flask

Youtube-dl-with-flask is personal cloud hosted youtube video downloader created in python using flask you can easily install it on your server using following steps

### for installation in ubuntu
step1:- download files
you can download application files and go to downloaded directory using
```sh
wget https://github.com/gauswamimilan/youtube-dl-with-flask
cd youtube-dl-with-flask
```
step2:- install requerements for flask and youtube-dl
you can install requirements using following shell script as given below
Just type in terminal
```sh
sh autoinstall.sh
```
step3:-run app
To run app use following commands
```sh
source venv/bin/activate
gunicorn --bind=0.0.0.0:80 app:app
```

**Well you are done.**

close terminal and type ip address of server in browser and enjoy ( to test in your local machine you can type 'localhost' in browser )
