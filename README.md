## Automação para configuração de ambientes novos


# Windows
Automatização via script para configuração de ambiente em Windows + WSL e/ou Linux, voltado a atuação DevOps

### Utilize o passo a passo abaixo para instalação (utilizar step-by-step)

- Abrir PowerShell como Administrador;
```
Start-Process powershell -Verb runAs
```

- Permitir execução de scripts;
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- Executar a instalação do Make para gerenciar as instalações;
```
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ggoncalves9/automation_environment/main/000_install-make-modules.ps1" -OutFile "$env:TEMP\install-make-modules.ps1"
& "$env:TEMP\install-make-modules.ps1"
```


-  Utilizar o Make e seus modulos;
```
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ggoncalves9/automation_environment/main/001_make-modules.ps1" -OutFile "$env:TEMP\001_make-modules.ps1"
& "$env:TEMP\001_make-modules.ps1"
```

## WARNING 
[!ALERT]
- Reverter a política de execução de scripts para restrito;
```
Set-ExecutionPolicy Restricted -Scope CurrentUser
```

# Linux

#END
