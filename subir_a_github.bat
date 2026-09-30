@echo off
chcp 65001 >nul
echo =======================================================
echo   Vincular y Subir a GitHub - Control de Notas App
echo =======================================================
echo.
echo 1. Crea un repositorio vaco en: https://github.com/new
echo    (No marques la casilla de README, .gitignore ni licencia)
echo.
set /p REPO_URL="Pega la URL de tu repositorio de GitHub (ej. https://github.com/usuario/control-notas-app.git): "

if "%REPO_URL%"=="" (
    echo [ERROR] No ingresaste ninguna URL. Operacin cancelada.
    pause
    exit /b
)

echo.
echo Configurando remoto 'origin'...
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo.
echo Subiendo la rama 'main' a GitHub...
git branch -M main
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =======================================================
    echo   Cdigo subido con xito!
    echo =======================================================
    echo Ve a la pestaa 'Actions' de tu repositorio en GitHub
    echo para ver cmo se compila automticamente tu APK.
) else (
    echo.
    echo [AVISO] Ocurri un problema al hacer push. Verifica tus credenciales de GitHub.
)

pause
