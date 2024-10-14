Tests connectivity to an HTTPS service.
* `openssl s_client -connect hostname.com:443`

Prints all certificates in the certificate chain presented by the SSL service. Useful when troubleshooting missing intermediate CA certificate issues.
* `openssl s_client -connect <hostname>:<port> -showcerts`

Forces TLSv1 and DTLSv1 respectively.
* `openssl s_client -connect <hostname>:<port> -tls1`

Forces a specific cipher. This option is useful in testing enabled SSL ciphers. Use the openssl ciphers command to see a list of available ciphers for OpenSSL.
* `openssl s_client -connect <hostname>:<port> -cipher DHE-RSA-AES256-SHA`

Prints server certificate to file
* `echo | openssl s_client -connect <hostname>:<port> | openssl x509 > /tmp/$cert.pem`

Prints certificate chain to file
* `echo | openssl s_client -showcerts -connect <hostname>:<port> 2>&1 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > cert.pem`