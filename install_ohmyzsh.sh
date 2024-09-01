#!/bin/bash

# Verifica se o script está sendo executado com privilégios de superusuário
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute o script como root ou use sudo."
  exit
fi

# Atualiza a lista de pacotes e instala o Zsh
echo "Atualizando lista de pacotes..."
apt update

echo "Instalando Zsh..."
apt install -y zsh

# Define o Zsh como o shell padrão
echo "Definindo Zsh como o shell padrão..."
chsh -s $(which zsh)

# Instalação do Oh My Zsh
echo "Instalando Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Instalação do Zsh e Oh My Zsh concluída!"
echo "Por favor, reinicie o terminal para aplicar as mudanças, ou inicie um novo shell Zsh executando: zsh"

