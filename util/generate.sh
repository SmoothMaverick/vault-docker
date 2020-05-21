#!/bin/bash

if [ $# -eq 0 ] ; then
    echo "Generating Certificate..."
    openssl req -new -config cert.conf -keyout server.key -out server.csr
    openssl x509 -req -in server.csr -signkey server.key -out server.crt
    exit 0
fi

while [ $# -gt 0 ] ; do
  case $1 in
    create-csr)
      echo "Generating Certificate Request from Config"
      openssl req -new -config cert.conf -keyout server.key -out server.csr
      ;;
    create-cert)
      echo "Generating Certificate from Request"
      openssl x509 -req -in server.csr -signkey server.key -out server.crt
      ;;
    check-csr)
      echo "Checking Certificate Request..."
      openssl req -in cert.csr -noout -text
      ;;
    check-cert)
      echo "Checking Certificate..."
      openssl x509 -in server.crt -text -noout
      ;;
    create-pfx)
      echo "Generating PFX"
      openssl pkcs12 -export -out server.pfx -inkey server.key -in server.crt
      ;;
  esac
  shift
done
