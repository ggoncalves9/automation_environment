# automation_environment
Automatização via script para configuração de ambiente em Windows + WSL e/ou Linux, voltado a atuação de tecnologias baseadas em Cloud, DevOps e AI.

## 001
```
# Abrir PowerShell como Administrador
Start-Process powershell -Verb runAs

# Permitir execução de scripts
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Executar o script de instalação
.\install-wsl-git-githubcli.ps1

# Reverter a política de execução de scripts para restrito
Set-ExecutionPolicy Restricted -Scope CurrentUser

```
