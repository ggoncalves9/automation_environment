#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Uso: ./askai.sh 'sua pergunta aqui'"
    exit 1
fi

# Captura a pergunta do usuário
question="$*"

# Chama o script Python e passa a pergunta, redirecionando a saída de erro para /dev/null
python3 /home/mage/ASKAI/ask_gemini.py "$question" 2>/dev/null
