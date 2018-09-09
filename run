#!/usr/bin/env bash

# docker run --rm -p=80:80 -p=443:443 \
docker run --rm --network=host \
    -v=${PWD}/nginx:/etc/nginx \
    -v=${HTTP_TLS_CERTIFICATE}:/tmp/certificate.crt:ro \
    -v=${HTTP_TLS_KEY}:/tmp/certificate.key:ro \
    -v=${PWD}/certs/client-ca.crt:/tmp/client-ca.crt:ro \
    nginx:mainline-alpine
