nohup uvicorn kindofparadox.asgi:application --proxy-headers --log-level="trace" --forwarded-allow-ips="*" --uds /tmp/uvicorn.sock &
service nginx restart
service redis-server restart
nohup uwsgi --ini /etc/init.d/uwsgi.ini &
tail -f /dev/null