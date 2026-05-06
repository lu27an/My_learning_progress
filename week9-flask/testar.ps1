# =============================================
# TESTES - Encurtador de URLs (Week 9)
# Rode com: .\testar.ps1
# =============================================

$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Encurtador de URLs (Week 9)      " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Teste 1: Flask instalado ---
$testCount++
Write-Host "[TESTE $testCount] Flask esta instalado" -ForegroundColor Yellow
$flask = (python -c "import flask; print(flask.__version__)" 2>&1) | Out-String
if ($LASTEXITCODE -eq 0) {
    Write-Host "  PASSOU! (Flask $($flask.Trim()))" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Rode: pip install flask" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: app.py tem rotas definidas ---
$testCount++
Write-Host "[TESTE $testCount] app.py tem rotas Flask" -ForegroundColor Yellow
$appPy = Get-Content "app.py" -Raw -ErrorAction SilentlyContinue
if ($appPy -and $appPy -match "@app.route" -and $appPy -match "def index" -and $appPy -match "def encurtar") {
    Write-Host "  PASSOU!" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! app.py precisa de rotas @app.route e funcoes" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Templates existem ---
$testCount++
Write-Host "[TESTE $testCount] Templates HTML existem" -ForegroundColor Yellow
if ((Test-Path "templates/index.html") -and (Test-Path "templates/stats.html")) {
    $indexHtml = Get-Content "templates/index.html" -Raw
    if ($indexHtml -match "form|action|method") {
        Write-Host "  PASSOU!" -ForegroundColor Green
        $passCount++
    } else {
        Write-Host "  FALHOU! index.html precisa de um formulario" -ForegroundColor Red
        $passedAll = $false
    }
} else {
    Write-Host "  FALHOU! Faltam templates em templates/" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Servidor inicia sem crash ---
$testCount++
Write-Host "[TESTE $testCount] Servidor Flask inicia" -ForegroundColor Yellow
$job = Start-Job -ScriptBlock { Set-Location $using:PWD; python app.py 2>&1 }
Start-Sleep -Seconds 3
$running = $false
try {
    $response = Invoke-WebRequest -Uri "http://127.0.0.1:5000/" -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
    if ($response.StatusCode -eq 200) { $running = $true }
} catch { }

if ($running) {
    Write-Host "  PASSOU! (servidor respondeu na porta 5000)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! O servidor nao respondeu em http://127.0.0.1:5000/" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Encurtar URL funciona ---
$testCount++
Write-Host "[TESTE $testCount] Encurtar URL via POST" -ForegroundColor Yellow
if ($running) {
    try {
        $body = @{ url = "https://cs50.harvard.edu/x/" }
        $resp = Invoke-WebRequest -Uri "http://127.0.0.1:5000/encurtar" -Method POST -Body $body -UseBasicParsing -TimeoutSec 5
        if ($resp.StatusCode -eq 200 -and $resp.Content -match "[a-zA-Z0-9]{6}") {
            Write-Host "  PASSOU! (URL encurtada com sucesso)" -ForegroundColor Green
            $passCount++
        } else {
            Write-Host "  FALHOU! Resposta inesperada" -ForegroundColor Red
            $passedAll = $false
        }
    } catch {
        Write-Host "  FALHOU! Erro ao encurtar: $_" -ForegroundColor Red
        $passedAll = $false
    }
} else {
    Write-Host "  PULADO (servidor nao iniciou)" -ForegroundColor Yellow
    $passedAll = $false
}

# --- Parar servidor ---
Stop-Job -Job $job -ErrorAction SilentlyContinue
Remove-Job -Job $job -ErrorAction SilentlyContinue

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 9 COMPLETA!" -ForegroundColor Green
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
