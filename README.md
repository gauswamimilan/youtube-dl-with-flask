# youtube-dl-with-flask

Youtube-dl-with-flask is personal cloud hosted youtube video downloader created in python using flask and youtube-dl cli .you can easily install it on your server using following steps

### for installation in ubuntu
To install requirements write the following commands
```sh
git clone https://github.com/gauswamimilan/youtube-dl-with-flask
cd youtube-dl-with-flask
source autoinstall.sh
```
**Note:-** Installation may take a while so keep patience and it will run automatically
**Well you are done.**

close terminal and type ip address or domain name of server in browser and enjoy ( to test in your local machine you can type 'localhost' in browser )

in the above steps **gunicorn app:app --daemon** will deploy app in localhost of server and nginx will serve as revese proxy and allow user to acess website
