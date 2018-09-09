#!/usr/bin/env bash

DIR=certs/

CA_KEY_SIZE=4096
KEY_SIZE=2048

CA_DAYS=3650
KEY_DAYS=365

CA_DIR=${DIR}
CA_KEY=${CA_DIR}client-ca.key      #key
CA_CRT=${CA_DIR}client-ca.crt      #certificate
CA_SRL=${CA_DIR}client-ca.srl      #serial

#NAME=localhost
CSR_PATH=${DIR}${NAME}/cert.csr  # certificate request
KEY_PATH=${DIR}${NAME}/cert.key  # key
CRT_PATH=${DIR}${NAME}/cert.crt  # certificate
CNF_PATH=confs/${NAME}.cnf       # config
