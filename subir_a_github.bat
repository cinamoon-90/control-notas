@echo off
setlocal
set "PATH=C:\Users\UIET01\AppData\Local\Programs\MinGit\cmd;%PATH%"
cls
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
    echo   CODIGO SUBIDO CON EXITO!
    echo =======================================================
    echo GitHub Actions esta compilando tu archivo APK.
    echo Puedes ver el progreso y descargarlo aqui:
    echo https://github.com/cinamoon-90/control-notas/actions
) else (
    echo.
    echo [AVISO] Si es la primera vez, el navegador te solicitara
    echo autorizar el acceso a tu cuenta de GitHub (Sign in with browser).
)

echo.
pause
