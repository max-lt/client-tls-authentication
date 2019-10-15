#!/usr/bin/env bash

RED='\033[01;31m'
NONE='\033[00m'

set -e

source variables.sh

mkdir -p ${CA_DIR}

echo -e "${RED}This will potentially erase your current Certificate authority${NONE}"
read -p "Are you sure? [Yn] " -r
if [[ $REPLY =~ ^[Nn] ]]; then
    exit 0
fi

echo '> Generating CA key'
openssl genrsa -out ${CA_KEY} ${CA_KEY_SIZE}

echo '> Generating CA certificate'
openssl req -x509 -new -nodes \
    -extensions v3_req -sha256 \
    -config client-ca.cnf \
    -days ${CA_DAYS} \
    -key ${CA_KEY} \
    -out ${CA_CRT} \
    -subj "/L=Home/O=Home/CN=Home Localhost CA"

openssl x509 -text -noout -in ${CA_CRT}

cat certs/client-ca.crt certs/client-ca.key > certs/client-ca.pem
