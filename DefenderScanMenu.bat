@echo off
title Menu de Verificação do Microsoft Defender
:menu
cls
echo ==========================================
echo   Menu de Verificação do Microsoft Defender
echo ==========================================
echo 1. Verificação Rápida
echo 2. Verificação Completa
echo 3. Verificação Personalizada
echo 4. Atualizar Definições de Vírus
echo 5. Sair
echo ==========================================
set /p choice=Digite sua escolha (1-5):

if "%choice%"=="1" goto quickscan
if "%choice%"=="2" goto fullscan
if "%choice%"=="3" goto customscan
if "%choice%"=="4" goto updatedef
if "%choice%"=="5" goto exit
goto menu

:quickscan
echo Iniciando Verificação Rápida...
call :progress_bar
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
pause
goto menu

:fullscan
echo Iniciando Verificação Completa...
call :progress_bar
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
pause
goto menu

:customscan
set /p path=Digite o caminho completo da pasta ou arquivo para verificar:
echo Iniciando Verificação Personalizada em %path%...
call :progress_bar
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 3 -File "%path%"
pause
goto menu

:updatedef
echo Atualizando Definições de Vírus...
call :progress_bar
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -SignatureUpdate
pause
goto menu

:progress_bar
setlocal EnableDelayedExpansion
set bar=
for /L %%i in (1,1,50) do (
    set bar=!bar!#
    cls
    echo [!bar!]
    ping -n 2 localhost >nul
)
endlocal
goto :eof

:exit
exit
