Client TLS authentication test
==============================

This repository is made to test client tls authentication.

### Dependencies:

You will need docker and openssl installed on your machine.

### Prerequisites:
You must have a certificate for your server: (it can be [self signed](https://www.digitalocean.com/community/tutorials/how-to-create-an-ssl-certificate-on-nginx-for-ubuntu-14-04)*)

```
HTTP_TLS_CERTIFICATE=path/to/certificate.crt
HTTP_TLS_KEY=path/to/certificate.key
```

\* Generate self signed certificate: `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt`

### Setup:
  - Generate a certificate authority: `./gen-master`
  - Generate client key/certificate: `./gen-cert`
  - Add the generated client key (cert/client/client.p12) on your browser.

### Run the server 
```
./run
```
