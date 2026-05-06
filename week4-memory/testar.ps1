# =============================================
# TESTES - Filtro de Imagem (Week 4)
# Rode com: .\testar.ps1
# =============================================

$ErrorActionPreference = "Stop"
$passedAll = $true
$testCount = 0
$passCount = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  TESTES - Filtro de Imagem (Week 4)        " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Criar imagem BMP de teste (4x4 pixels) ---
function New-TestBMP {
    param([string]$Path)

    $width = 4
    $height = 4
    $padding = (4 - ($width * 3) % 4) % 4
    $rowSize = $width * 3 + $padding
    $imageSize = $rowSize * $height
    $fileSize = 54 + $imageSize

    $bytes = New-Object byte[] $fileSize

    # File header
    $bytes[0] = 0x42; $bytes[1] = 0x4D  # "BM"
    [BitConverter]::GetBytes([uint32]$fileSize).CopyTo($bytes, 2)
    [BitConverter]::GetBytes([uint32]54).CopyTo($bytes, 10)

    # Info header
    [BitConverter]::GetBytes([uint32]40).CopyTo($bytes, 14)
    [BitConverter]::GetBytes([int32]$width).CopyTo($bytes, 18)
    [BitConverter]::GetBytes([int32]$height).CopyTo($bytes, 22)
    [BitConverter]::GetBytes([uint16]1).CopyTo($bytes, 26)   # planes
    [BitConverter]::GetBytes([uint16]24).CopyTo($bytes, 28)  # bits per pixel

    # Pixels - preencher com cores conhecidas
    $offset = 54
    for ($y = 0; $y -lt $height; $y++) {
        for ($x = 0; $x -lt $width; $x++) {
            $bytes[$offset] = [byte](50 + $x * 40)   # B
            $bytes[$offset+1] = [byte](100 + $y * 30) # G
            $bytes[$offset+2] = [byte](200 - $x * 20)  # R
            $offset += 3
        }
        $offset += $padding
    }

    [System.IO.File]::WriteAllBytes($Path, $bytes)
}

# Criar imagem de teste
New-TestBMP -Path ".\teste_input.bmp"

# --- Compilar ---
Write-Host "[COMPILANDO] gcc -o filtro filtro.c helpers.c -lm" -ForegroundColor Yellow
try {
    $compileOutput = gcc -o filtro filtro.c helpers.c -lm 2>&1
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

# --- Teste 1: Filtro grayscale ---
$testCount++
Write-Host "[TESTE $testCount] Filtro escala de cinza (-g)" -ForegroundColor Yellow
$output = (.\filtro.exe -g teste_input.bmp teste_gray.bmp 2>&1) | Out-String
if ($LASTEXITCODE -eq 0 -and (Test-Path "teste_gray.bmp")) {
    $original = [System.IO.File]::ReadAllBytes("teste_input.bmp")
    $gray = [System.IO.File]::ReadAllBytes("teste_gray.bmp")
    # Verificar se o pixel foi modificado (R=G=B)
    if ($gray[56] -eq $gray[57] -and $gray[57] -eq $gray[58]) {
        Write-Host "  PASSOU! (pixels em escala de cinza)" -ForegroundColor Green
        $passCount++
    } else {
        Write-Host "  FALHOU! Os valores RGB do pixel deveriam ser iguais" -ForegroundColor Red
        $passedAll = $false
    }
} else {
    Write-Host "  FALHOU! Programa nao gerou arquivo de saida" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 2: Filtro sepia ---
$testCount++
Write-Host "[TESTE $testCount] Filtro sepia (-s)" -ForegroundColor Yellow
$output = (.\filtro.exe -s teste_input.bmp teste_sepia.bmp 2>&1) | Out-String
if ($LASTEXITCODE -eq 0 -and (Test-Path "teste_sepia.bmp")) {
    $sepia = [System.IO.File]::ReadAllBytes("teste_sepia.bmp")
    $original = [System.IO.File]::ReadAllBytes("teste_input.bmp")
    # Sepia deve ter modificado os pixels
    $changed = $false
    for ($i = 54; $i -lt [Math]::Min(66, $sepia.Length); $i++) {
        if ($sepia[$i] -ne $original[$i]) { $changed = $true; break }
    }
    if ($changed) {
        Write-Host "  PASSOU! (pixels modificados com tom sepia)" -ForegroundColor Green
        $passCount++
    } else {
        Write-Host "  FALHOU! Os pixels nao foram alterados" -ForegroundColor Red
        $passedAll = $false
    }
} else {
    Write-Host "  FALHOU! Programa nao gerou arquivo de saida" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 3: Filtro espelho ---
$testCount++
Write-Host "[TESTE $testCount] Filtro espelho (-e)" -ForegroundColor Yellow
$output = (.\filtro.exe -e teste_input.bmp teste_mirror.bmp 2>&1) | Out-String
if ($LASTEXITCODE -eq 0 -and (Test-Path "teste_mirror.bmp")) {
    Write-Host "  PASSOU! (imagem espelhada gerada)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 4: Filtro blur ---
$testCount++
Write-Host "[TESTE $testCount] Filtro blur (-b)" -ForegroundColor Yellow
$output = (.\filtro.exe -b teste_input.bmp teste_blur.bmp 2>&1) | Out-String
if ($LASTEXITCODE -eq 0 -and (Test-Path "teste_blur.bmp")) {
    Write-Host "  PASSOU! (imagem borrada gerada)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU!" -ForegroundColor Red
    $passedAll = $false
}

# --- Teste 5: Argumentos inválidos ---
$testCount++
Write-Host "[TESTE $testCount] Erro com argumentos invalidos" -ForegroundColor Yellow
$output = (.\filtro.exe 2>&1) | Out-String
if ($LASTEXITCODE -ne 0) {
    Write-Host "  PASSOU! (retornou erro corretamente)" -ForegroundColor Green
    $passCount++
} else {
    Write-Host "  FALHOU! Deveria retornar erro sem argumentos" -ForegroundColor Red
    $passedAll = $false
}

# --- Limpeza ---
Remove-Item -ErrorAction SilentlyContinue teste_input.bmp, teste_gray.bmp, teste_sepia.bmp, teste_mirror.bmp, teste_blur.bmp

# --- Resultado Final ---
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
if ($passedAll) {
    Write-Host "  TODOS OS TESTES PASSARAM! ($passCount/$testCount)" -ForegroundColor Green
    Write-Host "  Week 4 COMPLETA!" -ForegroundColor Green
} else {
    Write-Host "  $passCount/$testCount testes passaram" -ForegroundColor Yellow
    Write-Host "  Continue tentando!" -ForegroundColor Yellow
}
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
