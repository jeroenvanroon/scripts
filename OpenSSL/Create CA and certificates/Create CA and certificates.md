Step 1 : Create the private key
openssl genrsa -des3 -out CAPrivate.key 2048

Step 2: Generate the root certificate
openssl req -x509 -new -nodes -key CAPrivate.key -sha256 -days 365 -out CAPrivate.pem

Step 3 : Generate the private key and csr
openssl req -out sslcert.csr -newkey rsa:2048 -nodes -keyout private.key -config san.cnf

Step 4: Generate the Certificate using the CSR
openssl x509 -req -in sslcert.csr -CA CAPrivate.pem -CAkey CAPrivate.key -CAcreateserial -out certificate.crt -days 3650 -extensions req_ext -extfile san.cnf