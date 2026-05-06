# =============================================
# TESTES - Placar de Campeonato (Week 2)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Placar de Campeonato (Week 2)    " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Compilar ---
Write-Host "[COMPILANDO] gcc -o placar placar.c" -ForegroundColor Yellow
try {
    $compileOutput = gcc -o placar placar.c 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "  ERRO DE COMPILACAO!" -ForegroundColor Red
        Write-Host "  Seu codigo nao compilou. Leia o erro abaixo:" -ForegroundColor Red
        $compileOutput | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
        exit 1
    }
    Write-Host "  Compilacao OK!" -ForegroundColor Green
} catch {
    Write-Host "  ERRO: gcc nao encontrado!" -ForegroundColor Red
    exit 1
}

Write-Host ""

# --- Teste 1: Programa compila e roda ---
$testCount++
Write-Host "[TESTE $testCount] Programa compila e executa sem crash" -ForegroundColor Yellow
$input = "2`nTimeA`nTimeB`n1`nTimeA`nTimeB`n2`n1`n"
$output = ($input | .\placar.exe 2>&1) | Out-String
if ($LASTEXITCODE -eq 0) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! O programa crashou." -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Exibe classificação ---
$testCount++
Write-Host "[TESTE $testCount] Exibe tabela de classificacao" -ForegroundColor Yellow
if ($output -match "classifica" -or $output -match "CLASSIFICA" -or $output -match "#") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Esperado: alguma saida com 'classificacao' ou tabela" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Vitória dá 3 pontos ---
$testCount++
Write-Host "[TESTE $testCount] Vitoria = 3 pontos" -ForegroundColor Yellow
if ($output -match "3") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  O time vencedor deveria ter 3 pontos" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Empate dá 1 ponto cada ---
$testCount++
Write-Host "[TESTE $testCount] Empate = 1 ponto para cada time" -ForegroundColor Yellow
$input2 = "2`nTimeX`nTimeY`n1`nTimeX`nTimeY`n1`n1`n"
$output2 = ($input2 | .\placar.exe 2>&1) | Out-String
# Em caso de empate 1x1, ambos devem ter 1 ponto
$matches_1pt = [regex]::Matches($output2, "\b1\b")
if ($matches_1pt.Count -ge 2) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Em um empate, ambos os times devem ter 1 ponto" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Tabela ordenada ---
$testCount++
Write-Host "[TESTE $testCount] Tabela ordenada por pontos (maior primeiro)" -ForegroundColor Yellow
$input3 = "3`nAlfa`nBeta`nGama`n2`nBeta`nAlfa`n3`n0`nGama`nBeta`n1`n0`n"
$output3 = ($input3 | .\placar.exe 2>&1) | Out-String
# Beta ganhou de Alfa (3pts), Gama ganhou de Beta (3pts), Alfa tem 0pts
# Ordem esperada: Beta ou Gama primeiro, Alfa por último
$lines = $output3 -split "`n"
$lastTeamLine = ($lines | Where-Object { $_ -match "Alfa" }) | Select-Object -Last 1
if ($output3.IndexOf("Alfa") -gt [Math]::Min($output3.IndexOf("Beta"), $output3.IndexOf("Gama")) -or $output3.IndexOf("Alfa") -eq -1) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  O time com 0 pontos deveria aparecer por ultimo" -ForegroundColor Red
    $passedAll = $false
}

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 2 COMPLETA! Parabens!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Proximo passo: me diga 'Terminei a Week 2!'" -ForegroundColor Cyan
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando! Voce consegue!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
