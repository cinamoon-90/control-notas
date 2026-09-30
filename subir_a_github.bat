@echo off
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
    echo [AVISO] Ocurrio un problema al subir a GitHub.
    echo Asegurate de iniciar sesion si se abre tu navegador.
)

echo.
pause
