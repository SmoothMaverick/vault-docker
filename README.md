# Vault-Docker

Starts a vault container in development mode, not intended for production use.

Root token is "dev".

## Requirements

- docker-compose
- openssl

## Create TLS Certificates

Certificates are needed for testing cert authentication

```
cd util

./generate.sh create-csr
./generate.sh create-cert
```

## Create PFX File

```
cd util

/generate.sh create-pfx
```

## Start Vault

```
docker-compose up
```
