#!/bin/bash

# Script para instalar o Docker no Ubuntu

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root"
  exit
fi

echo "Atualizando o sistema..."
apt update && apt upgrade -y

echo "Removendo versões antigas do Docker, se houver..."
apt remove docker docker-engine docker.io containerd runc -y

echo "Instalando pacotes necessários..."
apt install apt-transport-https ca-certificates curl software-properties-common -y

echo "Adicionando chave GPG oficial do Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adicionando repositório do Docker..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Atualizando o índice de pacotes novamente..."
apt update

echo "Instalando o Docker..."
apt install docker-ce docker-ce-cli containerd.io -y

echo "Verificando a instalação do Docker..."
docker --version

echo "Deseja permitir executar o Docker sem sudo? [s/n]"
read -r resposta

if [ "$resposta" == "s" ]; then
  usermod -aG docker $SUDO_USER
  echo "Usuário adicionado ao grupo Docker. Será necessário reiniciar ou fazer logout/login para aplicar as mudanças."
fi

echo "Verificando se o Docker está funcionando corretamente..."
docker run hello-world

echo "Instalação concluída com sucesso!"
echo "Add user no grupo de permissão"
echo "sudo usermod -aG docker $USER"
echo "reiniciar a sessão o user"
echo "newgrp docker"
