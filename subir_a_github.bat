@echo off
chcp 65001 >nul
echo =======================================================
echo   Subiendo Control de Notas a GitHub
echo   Repositorio: https://github.com/cinamoon-90/control-notas.git
echo =======================================================
echo.
echo Conectando y enviando rama 'main'...
git branch -M main
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo =======================================================
    echo   ¡CÓDIGO SUBIDO CON ÉXITO!
    echo =======================================================
    echo.
    echo GitHub Actions está compilando tu archivo APK en este momento.
    echo Puedes ver el progreso y descargar el archivo aquí:
    echo https://github.com/cinamoon-90/control-notas/actions
    echo.
) else (
    echo.
    echo [AVISO] Si es la primera vez, el navegador o la consola te
    echo pedirá autorizar el acceso a tu cuenta de GitHub (Sign in with browser).
)

echo.
pause
