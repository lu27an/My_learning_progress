# =============================================
# TESTES - Analisador Agricola (Week 6)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Analisador Agricola (Week 6)     " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Teste 1: Programa roda sem erro ---
$testCount++
Write-Host "[TESTE $testCount] Programa executa sem crash" -ForegroundColor Yellow
$input = "1`n6`n"
$output = ($input | python analisador.py 2>&1) | Out-String
if ($LASTEXITCODE -eq 0) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Programa crashou" -ForegroundColor Red
    Write-Host "  Saida: $output" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Resumo mostra quantidade correta ---
$testCount++
Write-Host "[TESTE $testCount] Resumo geral mostra 15 fazendas" -ForegroundColor Yellow
if ($output -match "15") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! O CSV tem 15 fazendas" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Ranking funciona ---
$testCount++
Write-Host "[TESTE $testCount] Ranking de produtividade" -ForegroundColor Yellow
$input2 = "2`n6`n"
$output2 = ($input2 | python analisador.py 2>&1) | Out-String
if ($output2 -match "Primavera|Cerrado") {
    Write-Host "  PASSOU! (fazendas de alta produtividade aparecem)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! O ranking deveria mostrar nomes de fazendas" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Filtro por cultura ---
$testCount++
Write-Host "[TESTE $testCount] Filtro por cultura (Soja)" -ForegroundColor Yellow
$input3 = "3`nSoja`n6`n"
$output3 = ($input3 | python analisador.py 2>&1) | Out-String
if ($output3 -match "Soja" -and ($output3 -match "Boa Vista" -or $output3 -match "Liberdade")) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Deveria filtrar e mostrar apenas fazendas de Soja" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Análise por região ---
$testCount++
Write-Host "[TESTE $testCount] Analise por regiao" -ForegroundColor Yellow
$input4 = "4`n6`n"
$output4 = ($input4 | python analisador.py 2>&1) | Out-String
if ($output4 -match "Centro-Oeste|Sul|Sudeste|Nordeste") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Deveria mostrar regioes" -ForegroundColor Red
    $passedAll = $false
}

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 6 COMPLETA!" -ForegroundColor Green
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
