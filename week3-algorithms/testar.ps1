# =============================================
# TESTES - Agenda de Contatos (Week 3)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Agenda de Contatos (Week 3)      " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Compilar ---
Write-Host "[COMPILANDO] gcc -o agenda agenda.c" -ForegroundColor Yellow
try {
    $compileOutput = gcc -o agenda agenda.c 2>&1
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

# --- Teste 1: Adicionar e listar ---
$testCount++
Write-Host "[TESTE $testCount] Adicionar contato e listar" -ForegroundColor Yellow
$input = "1`nCarlos Silva`n11999001122`ncarlos@email.com`n3`n5`n"
$output = ($input | .\agenda.exe 2>&1) | Out-String
if ($output -match "Carlos" -and $output -match "adicionado|Adicionado|ADICIONADO") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Esperado: mensagem de confirmacao e nome na listagem" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Buscar contato existente ---
$testCount++
Write-Host "[TESTE $testCount] Buscar contato existente" -ForegroundColor Yellow
$input = "1`nAna Souza`n11888776655`nana@email.com`n2`nAna`n5`n"
$output = ($input | .\agenda.exe 2>&1) | Out-String
if ($output -match "Ana" -and $output -match "11888776655|ana@email") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  A busca deveria encontrar o contato e mostrar seus dados" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Buscar contato inexistente ---
$testCount++
Write-Host "[TESTE $testCount] Buscar contato inexistente" -ForegroundColor Yellow
$input = "2`nZezinho`n5`n"
$output = ($input | .\agenda.exe 2>&1) | Out-String
if ($output -match "n.o encontr|nao encontr|N.o encontr|Nao encontr") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Deveria dizer que o contato nao foi encontrado" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Contatos listados em ordem alfabética ---
$testCount++
Write-Host "[TESTE $testCount] Contatos em ordem alfabetica" -ForegroundColor Yellow
$input = "1`nZeca`n111`nz@e.com`n1`nAna`n222`na@e.com`n1`nMaria`n333`nm@e.com`n3`n5`n"
$output = ($input | .\agenda.exe 2>&1) | Out-String
$posAna = $output.LastIndexOf("Ana")
$posMaria = $output.LastIndexOf("Maria")
$posZeca = $output.LastIndexOf("Zeca")
if ($posAna -lt $posMaria -and $posMaria -lt $posZeca -and $posAna -gt 0) {
    Write-Host "  PASSOU! (Ana < Maria < Zeca)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  A listagem deveria estar em ordem: Ana, Maria, Zeca" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Remover contato ---
$testCount++
Write-Host "[TESTE $testCount] Remover contato" -ForegroundColor Yellow
$input = "1`nTesteRemover`n999`nr@e.com`n4`nTesteRemover`n2`nTesteRemover`n5`n"
$output = ($input | .\agenda.exe 2>&1) | Out-String
if ($output -match "removid|Removid|n.o encontr|nao encontr") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  O contato deveria ser removido e nao encontrado na busca" -ForegroundColor Red
    $passedAll = $false
}

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 3 COMPLETA! Parabens!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Proximo passo: me diga 'Terminei a Week 3!'" -ForegroundColor Cyan
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
