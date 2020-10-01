. .env_docker
printenv
nohup uvicorn kindofparadox.asgi:application --ssl-keyfile=ssl/test.key --ssl-certfile=ssl/test.cert --proxy-headers --log-level="trace" --forwarded-allow-ips="*" --uds /tmp/uvicorn.sock &
service nginx restart
service redis-server restart
nohup uwsgi --ini /etc/init.d/uwsgi.ini &
# tail -f to keep docker running 
tail -f /dev/null