#!/bin/bash

mkdir /etc/nginx/ssl && cd /etc/nginx/ssl

openssl req -new -x509 -nodes -sha256 -days 3650 -newkey rsa:2048 -keyout test.key -out test.cert -subj "/CN=*.test.test" -extensions SAN -config <(
cat <<-EOF
[req]
distinguished_name=dn

[dn]
CN=*.test.test

[SAN]
subjectAltName=DNS:*.test.test
EOF
)

#https://gist.github.com/willpower232/3205bf38fd6a0dcad7f01c3fd99b2ad0
#https://stackoverflow.com/questions/29827299/django-uwsgi-nginx-ssl-request-for-working-configuration-emphasis-on-ss