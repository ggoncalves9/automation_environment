0# Função para instalar o WSL e o Ubuntu 22.04
function Install-WSLAndUbuntu {
    Write-Host "Instalando WSL e Ubuntu 22.04..."
    wsl --install -d Ubuntu-22.04
    Write-Host "WSL e Ubuntu 22.04 instalados."
}

# Função para instalar o Visual Studio Code
function Install-VSCode {
    Write-Host "Instalando Visual Studio Code..."
    winget install --id Microsoft.VisualStudioCode -e --source winget
    Write-Host "Visual Studio Code instalado."
}

# Função para instalar o Git
function Install-Git {
    Write-Host "Instalando Git..."
    winget install --id Git.Git -e --source winget
    Write-Host "Git instalado."
}

# Função para instalar o Docker Desktop
function Install-Docker {
    Write-Host "Instalando Docker Desktop..."
    winget install --id Docker.DockerDesktop -e --source winget
    Write-Host "Docker Desktop instalado."
}

# Função para instalar o Terminator no WSL
function Install-Terminator {
    Write-Host "Instalando Terminator no Ubuntu 22.04..."
    wsl -d Ubuntu-22.04 -- sudo apt update
    wsl -d Ubuntu-22.04 -- sudo apt install -y terminator
    Write-Host "Terminator instalado no Ubuntu 22.04."
}

# Menu de seleção de módulos
function Show-Menu {
    Clear-Host
    Write-Host "Selecione uma das opções para instalar:"
    Write-Host "1. WSL e Ubuntu 22.04"
    Write-Host "2. Visual Studio Code"
    Write-Host "3. Git"
    Write-Host "4. Docker Desktop"
    Write-Host "5. Terminator (no WSL)"
    Write-Host "6. Instalar Todos"
    Write-Host "7. Sair"

    $choice = Read-Host "Escolha uma opção (1-7)"

    switch ($choice) {
        1 { Install-WSLAndUbuntu }
        2 { Install-VSCode }
        3 { Install-Git }
        4 { Install-Docker }
        5 { Install-Terminator }
        6 { 
            Install-WSLAndUbuntu
            Install-VSCode
            Install-Git
            Install-Docker
            Install-Terminator
        }
        7 { exit }
        default { Write-Host "Escolha inválida. Tente novamente."; Show-Menu }
    }
}

# Chama o menu para que o usuário escolha o que deseja instalar
Show-Menu
