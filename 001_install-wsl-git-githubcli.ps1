# Certifique-se de que o script está sendo executado com privilégios de administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Este script deve ser executado como administrador."
    exit
}

# Habilitar o recurso WSL
Write-Host "Habilitando o WSL..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Baixar e instalar o Kernel do WSL2
Write-Host "Baixando e instalando o Kernel do WSL2..."
$wslUpdateUrl = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$wslUpdateInstaller = "$env:TEMP\wsl_update_x64.msi"
Invoke-WebRequest -Uri $wslUpdateUrl -OutFile $wslUpdateInstaller
Start-Process msiexec.exe -ArgumentList "/i $wslUpdateInstaller /quiet /norestart" -NoNewWindow -Wait
Remove-Item $wslUpdateInstaller

# Definir o WSL2 como padrão
Write-Host "Definindo o WSL2 como versão padrão..."
wsl --set-default-version 2

# Instalar uma distribuição Linux padrão (Ubuntu)
Write-Host "Instalando o Ubuntu..."
wsl --install -d Ubuntu

# Instalar o Git
Write-Host "Instalando o Git..."
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    winget install --id Git.Git -e --source winget
} else {
    Write-Host "Git já está instalado."
}

# Instalar o GitHub CLI
Write-Host "Instalando o GitHub CLI..."
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    winget install --id GitHub.cli -e --source winget
} else {
    Write-Host "GitHub CLI já está instalado."
}

Write-Host "Instalação concluída. Por favor, reinicie o computador para concluir a configuração do WSL."
