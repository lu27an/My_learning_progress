# =============================================
# TESTES - Inventario de Fazenda (Week 7)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Inventario de Fazenda (Week 7)   " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Limpar banco anterior ---
if (Test-Path "fazenda.db") { Remove-Item "fazenda.db" }

# --- Teste 1: Schema cria sem erros ---
$testCount++
Write-Host "[TESTE $testCount] Criar banco de dados (schema)" -ForegroundColor Yellow
$output = (sqlite3 fazenda.db ".read criar_banco.sql" 2>&1) | Out-String
if ($LASTEXITCODE -eq 0) {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Erro no SQL:" -ForegroundColor Red
    Write-Host "  $output" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Tabelas existem ---
$testCount++
Write-Host "[TESTE $testCount] Tabelas criadas corretamente" -ForegroundColor Yellow
$tables = (sqlite3 fazenda.db ".tables" 2>&1) | Out-String
$required = @("fazendas", "talhoes", "culturas", "plantios", "insumos", "aplicacoes")
$allExist = $true
foreach ($t in $required) {
    if ($tables -notmatch $t) {
        Write-Host "  Tabela '$t' nao encontrada!" -ForegroundColor Red
        $allExist = $false
    }
}
if ($allExist) {
    Write-Host "  PASSOU! (todas as 6 tabelas existem)" -ForegroundColor Green
    $passCount++
} else {
    $passedAll = $false
}

# --- Teste 3: Dados inseridos ---
$testCount++
Write-Host "[TESTE $testCount] Dados de exemplo inseridos" -ForegroundColor Yellow
$count = (sqlite3 fazenda.db "SELECT COUNT(*) FROM fazendas;" 2>&1) | Out-String
$countNum = [int]$count.Trim()
if ($countNum -ge 3) {
    Write-Host "  PASSOU! ($countNum fazendas inseridas)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Esperado: pelo menos 3 fazendas, encontrado: $countNum" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Foreign keys estão corretas ---
$testCount++
Write-Host "[TESTE $testCount] Chaves estrangeiras funcionando" -ForegroundColor Yellow
$talhoes = (sqlite3 fazenda.db "SELECT COUNT(*) FROM talhoes WHERE fazenda_id IN (SELECT id FROM fazendas);" 2>&1) | Out-String
$totalTalhoes = (sqlite3 fazenda.db "SELECT COUNT(*) FROM talhoes;" 2>&1) | Out-String
if ($talhoes.Trim() -eq $totalTalhoes.Trim() -and [int]$totalTalhoes.Trim() -ge 6) {
    Write-Host "  PASSOU! (foreign keys consistentes)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Verifique as chaves estrangeiras" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Consultas rodam sem erro ---
$testCount++
Write-Host "[TESTE $testCount] Consultas SQL executam sem erro" -ForegroundColor Yellow
$output = (sqlite3 fazenda.db ".read consultas.sql" 2>&1) | Out-String
if ($LASTEXITCODE -eq 0 -and $output.Length -gt 10) {
    Write-Host "  PASSOU! (consultas retornaram dados)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! As consultas retornaram erro ou estao vazias" -ForegroundColor Red
    if ($output) { Write-Host "  $output" -ForegroundColor Red }
    $passedAll = $false
}

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 7 COMPLETA!" -ForegroundColor Green
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
