#!/bin/bash
cd /etc/ssl/
mkdir nginx
cd nginx
openssl genrsa -des3 -out self-ssl.key 2048
openssl req -new -key self-ssl.key -out self-ssl.csr
cp -v self-ssl.{key,original}
openssl rsa -in self-ssl.original -out self-ssl.key
openssl x509 -req -days 365 -in self-ssl.csr -signkey self-ssl.key -out self-ssl.crt

