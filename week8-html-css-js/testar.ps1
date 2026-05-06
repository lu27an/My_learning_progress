# =============================================
# TESTES - Dashboard Pessoal (Week 8)
# Rode com: .\testar.ps1
# =============================================

$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Dashboard Pessoal (Week 8)       " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Teste 1: Arquivo HTML existe e tem conteúdo ---
$testCount++
Write-Host "[TESTE $testCount] index.html tem estrutura basica" -ForegroundColor Yellow
$html = Get-Content "index.html" -Raw -ErrorAction SilentlyContinue
if ($html -and $html -match "<!DOCTYPE html>" -and $html -match "<body") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! index.html precisa de DOCTYPE e body" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: CSS linkado ---
$testCount++
Write-Host "[TESTE $testCount] CSS linkado no HTML" -ForegroundColor Yellow
if ($html -match 'link.*stylesheet.*style\.css') {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Linke o style.css no head" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: JavaScript linkado ---
$testCount++
Write-Host "[TESTE $testCount] JavaScript linkado no HTML" -ForegroundColor Yellow
if ($html -match 'script.*src.*script\.js') {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Linke o script.js antes de </body>" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Elemento do relógio existe ---
$testCount++
Write-Host "[TESTE $testCount] Elemento do relogio existe" -ForegroundColor Yellow
if ($html -match 'id=.relogio') {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Crie um elemento com id='relogio'" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: JavaScript tem setInterval ---
$testCount++
Write-Host "[TESTE $testCount] JavaScript usa setInterval (relogio tempo real)" -ForegroundColor Yellow
$js = Get-Content "script.js" -Raw -ErrorAction SilentlyContinue
if ($js -and $js -match "setInterval") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Use setInterval para atualizar o relogio" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 6: JavaScript usa localStorage ---
$testCount++
Write-Host "[TESTE $testCount] JavaScript usa localStorage (persistencia)" -ForegroundColor Yellow
if ($js -and $js -match "localStorage") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Use localStorage para salvar tarefas" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 7: CSS tem estilos ---
$testCount++
Write-Host "[TESTE $testCount] CSS tem estilos definidos" -ForegroundColor Yellow
$css = Get-Content "style.css" -Raw -ErrorAction SilentlyContinue
if ($css -and $css.Length -gt 200 -and $css -match "background|color|font") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! CSS precisa ter estilos reais (nao so comentarios)" -ForegroundColor Red
    $passedAll = $false
}

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 8 COMPLETA!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Abra index.html no navegador para ver seu dashboard!" -ForegroundColor Cyan
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
