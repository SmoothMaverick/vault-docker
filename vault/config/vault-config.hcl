listener "tcp" {
   address = "0.0.0.0:8300"
   tls_disable = false
   tls_cert_file = "/vault/tls/server.crt"
   tls_key_file = "/vault/tls/server.key"
}

