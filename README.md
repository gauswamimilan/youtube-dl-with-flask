# youtube-dl-with-flask

Youtube-dl-with-flask is personal cloud hosted youtube video downloader created in python using flask and youtube-dl cli .you can easily install it on your server using following steps

### for installation in ubuntu
just run following commands

```sh
wget https://raw.githubusercontent.com/gauswamimilan/youtube-dl-with-flask/master/autoinstall.sh
gunicorn --bind=0.0.0.0:80 app:app
```

**Well you are done.**

close terminal and type ip address of server in browser and enjoy ( to test in your local machine you can type 'localhost' in browser )
