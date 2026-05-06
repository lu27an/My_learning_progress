# =============================================
# TESTES - Corretor Ortografico (Week 5)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Corretor Ortografico (Week 5)    " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Criar texto de teste ---
$textoTeste = @"
O programa de computador usa um algoritmo para buscar dados.
Esta memoira do sistema esta com erro.
O algoritimo nao funciona direito.
Casa escola aluno professor aula nota.
"@
$textoTeste | Out-File -FilePath "teste_texto.txt" -Encoding utf8

# --- Compilar ---
Write-Host "[COMPILANDO] gcc -o corretor corretor.c" -ForegroundColor Yellow
try {
    $compileOutput = gcc -o corretor corretor.c 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  ERRO DE COMPILACAO!" -ForegroundColor Red
        $compileOutput | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
        exit 1
    }
    Write-Host "  Compilacao OK!" -ForegroundColor Green
} catch {
    Write-Host "  ERRO: gcc nao encontrado!" -ForegroundColor Red
    exit 1
}

Write-Host ""

# --- Teste 1: Programa roda sem crash ---
$testCount++
Write-Host "[TESTE $testCount] Programa executa sem crash" -ForegroundColor Yellow
$output = (.\corretor.exe dicionario.txt teste_texto.txt 2>&1) | Out-String
if ($LASTEXITCODE -eq 0) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Programa crashou (exit code $LASTEXITCODE)" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Detecta palavras erradas ---
$testCount++
Write-Host "[TESTE $testCount] Detecta palavras com erro" -ForegroundColor Yellow
if ($output -match "memoira|algoritimo") {
    Write-Host "  PASSOU! (detectou erros ortograficos)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Deveria detectar 'memoira' e/ou 'algoritimo' como erros" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Não marca palavras corretas como erro ---
$testCount++
Write-Host "[TESTE $testCount] Nao marca palavras corretas como erro" -ForegroundColor Yellow
# "programa", "algoritmo", "casa" devem estar no dicionario
$falsePositives = 0
if ($output -match "(?m)^.*\bprograma\b.*erro" -or $output -match "(?m)^.*\bcasa\b.*erro") {
    $falsePositives++
}
if ($falsePositives -eq 0) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Marcou palavras corretas como erro" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Mostra estatísticas ---
$testCount++
Write-Host "[TESTE $testCount] Mostra estatisticas" -ForegroundColor Yellow
if ($output -match "estat|dicion|palavr|tempo") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Deveria mostrar estatisticas ao final" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Argumentos invalidos ---
$testCount++
Write-Host "[TESTE $testCount] Erro com argumentos invalidos" -ForegroundColor Yellow
$output2 = (.\corretor.exe 2>&1) | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Deveria retornar erro sem argumentos" -ForegroundColor Red
    $passedAll = $false
}

# --- Limpeza ---
Remove-Item -ErrorAction SilentlyContinue teste_texto.txt

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 5 COMPLETA!" -ForegroundColor Green
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
