Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "  Subiendo Control de Notas a GitHub" -ForegroundColor Cyan
Write-Host "  Repositorio: https://github.com/cinamoon-90/control-notas.git" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Conectando y enviando rama 'main'..." -ForegroundColor Yellow

$gitExe = "C:\Users\UIET01\AppData\Local\Programs\MinGit\cmd\git.exe"
if (-not (Test-Path $gitExe)) {
    $gitExe = "git"
}

& $gitExe branch -M main
& $gitExe push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=======================================================" -ForegroundColor Green
    Write-Host "  ¡CÓDIGO SUBIDO CON ÉXITO!" -ForegroundColor Green
    Write-Host "=======================================================" -ForegroundColor Green
    Write-Host "GitHub Actions está compilando tu archivo APK." -ForegroundColor White
    Write-Host "Puedes ver el progreso y descargarlo aquí:" -ForegroundColor White
    Write-Host "https://github.com/cinamoon-90/control-notas/actions" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "[AVISO] Si es la primera vez, inicia sesión en la ventana emergente de GitHub." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Presiona Enter para cerrar esta ventana..."
