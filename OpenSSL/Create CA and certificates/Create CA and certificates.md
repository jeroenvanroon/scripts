Step 1 : Create the private key
* openssl genrsa -des3 -out CAPrivate.key 2048

Step 2: Generate the root certificate
* openssl req -x509 -new -nodes -key CAPrivate.key -sha256 -days 365 -out CAPrivate.crt -config san_root.cnf

Step 3 : Generate the private key and csr
* openssl req -out sslcert.csr -newkey rsa:2048 -nodes -keyout private.key -config san.cnf

Step 4: Generate the Certificate using the CSR
* openssl x509 -req -in sslcert.csr -CA CAPrivate.crt -CAkey CAPrivate.key -CAcreateserial -out certificate.crt -days 3650 -extensions req_ext -extfile san.cnf

Check if SAN is in CSR:
* openssl req -noout -text -in sslcert.csr | grep -A 1 "Subject Alternative Name"

Check if SAN is in certificate:
* openssl x509 -text -noout -in certificate.crt | grep -A 1 "Subject Alternative Name"