apt-get install nginx -y > /dev/null
/etc/init.d/nginx start
rm /etc/nginx/sites-enabled/default
touch /etc/nginx/sites-available/flask_settings
ln -s /etc/nginx/sites-available/flask_settings /etc/nginx/sites-enabled
cat server_setting.txt >> /etc/nginx/sites-enabled/flask_settings
/etc/init.d/nginx restart > /dev/null
gunicorn app:app
