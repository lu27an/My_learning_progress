# =============================================
# TESTES - Gerador de Senhas (Week 1)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TESTES - Gerador de Senhas (Week 1)  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# --- Compilar ---
Write-Host "[COMPILANDO] gcc -o gerador gerador.c" -ForegroundColor Yellow
try {
    $compileOutput = gcc -o gerador gerador.c 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "  ERRO DE COMPILACAO!" -ForegroundColor Red
        Write-Host "  Seu codigo nao compilou. Leia o erro acima." -ForegroundColor Red
        Write-Host ""
        Write-Host "  Dica: Voce incluiu todos os #include necessarios?" -ForegroundColor Yellow
        Write-Host "  Dica: Todas as chaves { } estao fechadas?" -ForegroundColor Yellow
        Write-Host ""
        $compileOutput | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
        exit 1
    }
    Write-Host "  Compilacao OK!" -ForegroundColor Green
} catch {
    Write-Host "  ERRO: gcc nao encontrado. Instale o GCC primeiro!" -ForegroundColor Red
    exit 1
}

Write-Host ""

# --- Teste 1: Sem argumentos ---
$testCount++
Write-Host "[TESTE $testCount] Rodar sem argumentos (deve mostrar mensagem de uso)" -ForegroundColor Yellow
$output = (.\gerador.exe 2>&1) | Out-String
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0 -and $output -match "[Uu]so") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Esperado: programa retorna erro e mostra mensagem de uso" -ForegroundColor Red
    Write-Host "  Recebido: exit code=$exitCode, output='$($output.Trim())'" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Senha de tamanho 8 ---
$testCount++
Write-Host "[TESTE $testCount] Gerar senha de tamanho 8" -ForegroundColor Yellow
$output = (.\gerador.exe 8 2>&1) | Out-String
$output = $output.Trim()
# Extrair a senha (pode estar depois de "Senha gerada: " ou ser a propria saida)
if ($output -match ":\s*(.+)$") {
    $senha = $matches[1].Trim()
} else {
    $senha = $output
}
if ($senha.Length -ge 8) {
    Write-Host "  PASSOU! (senha: $senha)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Esperado: senha com pelo menos 8 caracteres" -ForegroundColor Red
    Write-Host "  Recebido: '$senha' (tamanho: $($senha.Length))" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Senha de tamanho 20 ---
$testCount++
Write-Host "[TESTE $testCount] Gerar senha de tamanho 20" -ForegroundColor Yellow
$output = (.\gerador.exe 20 2>&1) | Out-String
$output = $output.Trim()
if ($output -match ":\s*(.+)$") {
    $senha = $matches[1].Trim()
} else {
    $senha = $output
}
if ($senha.Length -ge 20) {
    Write-Host "  PASSOU! (senha: $senha)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Esperado: senha com pelo menos 20 caracteres" -ForegroundColor Red
    Write-Host "  Recebido: '$senha' (tamanho: $($senha.Length))" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Senhas sao aleatorias (gerar 2 e comparar) ---
$testCount++
Write-Host "[TESTE $testCount] Senhas devem ser diferentes a cada execucao" -ForegroundColor Yellow
$output1 = (.\gerador.exe 12 2>&1) | Out-String
Start-Sleep -Milliseconds 1100  # Garantir que time() mude
$output2 = (.\gerador.exe 12 2>&1) | Out-String
if ($output1.Trim() -ne $output2.Trim()) {
    Write-Host "  PASSOU! (senhas diferentes)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  As duas senhas geradas foram identicas: '$($output1.Trim())'" -ForegroundColor Red
    Write-Host "  Voce inicializou srand() corretamente?" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Senha contem variedade de caracteres ---
$testCount++
Write-Host "[TESTE $testCount] Senha deve conter letras, numeros e simbolos" -ForegroundColor Yellow
$output = (.\gerador.exe 50 2>&1) | Out-String
$output = $output.Trim()
if ($output -match ":\s*(.+)$") {
    $senha = $matches[1].Trim()
} else {
    $senha = $output
}
$hasLower = $senha -cmatch "[a-z]"
$hasUpper = $senha -cmatch "[A-Z]"
$hasDigit = $senha -match "[0-9]"
$hasSymbol = $senha -match "[^a-zA-Z0-9]"
if ($hasLower -and $hasUpper -and $hasDigit -and $hasSymbol) {
    Write-Host "  PASSOU! (contem minusculas, maiusculas, numeros e simbolos)" -ForegroundColor Green
    $passCount++
} else {
    $missing = @()
    if (-not $hasLower) { $missing += "minusculas" }
    if (-not $hasUpper) { $missing += "maiusculas" }
    if (-not $hasDigit) { $missing += "numeros" }
    if (-not $hasSymbol) { $missing += "simbolos" }
    Write-Host "  FALHOU!" -ForegroundColor Red
    Write-Host "  Faltando: $($missing -join ', ')" -ForegroundColor Red
    Write-Host "  Dica: seu charset inclui todos os tipos de caracteres?" -ForegroundColor Red
    $passedAll = $false
}

# --- Resultado Final ---
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 1 COMPLETA! Parabens!" -ForegroundColor Green
    Write-Host "" 
    Write-Host "  Proximo passo: me diga 'Terminei a Week 1!'" -ForegroundColor Cyan
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando! Voce consegue!" -ForegroundColor Yellow
}
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
