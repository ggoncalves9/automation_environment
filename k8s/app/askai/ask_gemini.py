import google.generativeai as genai
from dotenv import load_dotenv, find_dotenv

_ = load_dotenv(find_dotenv())
# Configuração da API do Gemini

genai.configure()

# Configuração do modelo
model = genai.GenerativeModel('gemini-pro')

def ask_gemini(question):
    try:    
        # Envia a pergunta para o Gemini
        response = model.generate_content(question)
        return response.text
    except Exception as e:
        return f"Erro ao consultar o Gemini: {str(e)}"

if __name__ == "__main__":
    import sys

    # Verifica se uma pergunta foi fornecida
    if len(sys.argv) < 2:
        print("Uso: python3 ask_gemini.py 'sua pergunta aqui'")
        sys.exit(1)

    # Captura a pergunta do usuário
    question = " ".join(sys.argv[1:])

    # Obtém a resposta do Gemini
    resposta = ask_gemini(question)

    # Exibe a resposta
    print(resposta)  
