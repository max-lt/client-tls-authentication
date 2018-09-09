#!/usr/bin/env bash

set -e

NAME=${1:-client}

source variables.sh

echo "Generating certificate for $NAME"

mkdir -p ${DIR}/${NAME}

echo '> Generating key'
openssl genrsa -out ${KEY_PATH} ${KEY_SIZE}

echo '> Generating signing request'
openssl req -new \
    -key ${KEY_PATH} \
    -out ${CSR_PATH} \
    -subj "/O=Home/CN=Client"

openssl x509 -req -sha256 -days ${KEY_DAYS} \
    -in ${CSR_PATH} \
    -CA ${CA_CRT} \
    -CAkey ${CA_KEY} \
    -CAcreateserial \
    -CAserial ${CA_SRL} \
    -out ${CRT_PATH}

CHAIN_PATH=${DIR}/${NAME}/chain.crt

echo '> Generating key chain'
cat  ${CRT_PATH} ${CA_CRT} > ${CHAIN_PATH}

# https://arcweb.co/securing-websites-nginx-and-client-side-certificate-authentication-linux/
# https://gist.github.com/mtigas/952344

openssl pkcs12 -export -clcerts -in ${CRT_PATH} -inkey ${KEY_PATH} -out ${DIR}/${NAME}/client.p12

# Read certificate
openssl x509 -text -noout -in ${CRT_PATH}
