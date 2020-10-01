# update onload_docker too in case of changes
cd /home/ooo/kindofparadox/
nohup uvicorn kindofparadox.asgi:application --ssl-keyfile=ssl/test.key --ssl-certfile=ssl/test.cert --proxy-headers --log-level="trace" --forwarded-allow-ips="*" --uds /tmp/uvicorn.sock &
nohup uwsgi --ini /etc/init.d/uwsgi.ini &
sudo service nginx restart
sudo service redis-server restart