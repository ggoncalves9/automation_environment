#!/bin/bash
# Gera um token para que um novo nó possa se juntar ao cluster.
TOKEN=$(kubeadm token generate)
CERT_HASH=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | \
            openssl rsa -pubin -outform der 2>/dev/null | \
            openssl dgst -sha256 | sed 's/^.* //')

echo "Execute o comando abaixo no novo nó para juntá-lo ao cluster:"
echo "kubeadm join $(hostname -i):6443 --token $TOKEN --discovery-token-ca-cert-hash sha256:$CERT_HASH"
