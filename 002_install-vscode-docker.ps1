# Certifique-se de que o script está sendo executado com privilégios de administrador
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Este script deve ser executado como administrador."
    exit
}

# Instalar Visual Studio Code
Write-Host "Instalando o Visual Studio Code..."
if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    winget install --id Microsoft.VisualStudioCode -e --source winget
} else {
    Write-Host "Visual Studio Code já está instalado."
}

# Verificar se a plataforma Hyper-V está habilitada
$hyperVEnabled = Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online | Select-Object -ExpandProperty State

if ($hyperVEnabled -ne "Enabled") {
    Write-Host "Habilitando a plataforma Hyper-V..."
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart
} else {
    Write-Host "A plataforma Hyper-V já está habilitada."
}

# Verificar se o Docker está instalado
Write-Host "Verificando se o Docker Desktop está instalado..."
$dockerInstalled = Get-Command docker -ErrorAction SilentlyContinue

if (-not $dockerInstalled) {
    Write-Host "Instalando o Docker Desktop..."
    winget install --id Docker.DockerDesktop -e --source winget

    Write-Host "A instalação do Docker Desktop foi concluída."
} else {
    Write-Host "Docker Desktop já está instalado."
}

Write-Host "A instalação foi concluída. Por favor, reinicie o computador para concluir a configuração do Docker, se necessário."
