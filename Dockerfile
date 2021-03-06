FROM python:3.8

#ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y nginx redis-server tesseract-ocr build-essential autoconf default-libmysqlclient-dev default-mysql-client

RUN pip3 install --upgrade pip

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt


ADD server_setup/default /etc/nginx/sites-available/
ADD ssl /etc/nginx/ssl
RUN nginx -t
RUN service nginx restart
RUN service redis-server restart
ADD server_setup/uwsgi.ini /etc/init.d/


# Create and switch to a new user
RUN useradd --create-home ooo
USER ooo
# the way to copy parent folder of Dockerfile
RUN mkdir /home/ooo/kindofparadox
COPY . /home/ooo/kindofparadox
WORKDIR /home/ooo/kindofparadox


# use "docker build --network=host -t yourtag"
RUN /bin/bash -c '. .env_docker; ./manage.py migrate; ./manage.py collectstatic'

USER root

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && ln -sf /var/log/redis/redis-server.log

STOPSIGNAL SIGTERM

# bin/bash critical for exporting env variables for settings
ENTRYPOINT ["/bin/bash", "server_setup/onload_docker.sh"]