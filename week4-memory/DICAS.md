# 💡 Dicas — Filtro de Imagem (Week 4)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Uma imagem BMP é uma **grade de pixels**. Cada pixel tem 3 valores:
- Red (vermelho): 0-255
- Green (verde): 0-255
- Blue (azul): 0-255

(0,0,0) = preto, (255,255,255) = branco, (255,0,0) = vermelho puro.

Para aplicar um filtro, você percorre CADA pixel e modifica seus valores RGB.

Desenhe numa folha uma grade 3x3 com cores e pense:
"o que faria cada pixel ficar cinza?"

---

## Dica 2 — Direcional 🧭

**Escala de cinza**: A média de R, G e B dá um tom de cinza.
Se um pixel é (100, 50, 200), o cinza seria (100+50+200)/3 = 116.
O pixel vira (116, 116, 116).

**Sépia**: Usa uma fórmula específica:
- sepiaR = 0.393*R + 0.769*G + 0.189*B
- sepiaG = 0.349*R + 0.686*G + 0.168*B
- sepiaB = 0.272*R + 0.534*G + 0.131*B
- Se o resultado passar de 255, use 255 (cap).

**Espelho**: Troque o pixel da coluna 0 com o da última coluna,
coluna 1 com a penúltima, etc. (como inverter um array!)

---

## Dica 3 — Estrutural 🏗️

Para percorrer todos os pixels de uma imagem height x width:

```c
for (int i = 0; i < height; i++)      // cada linha
{
    for (int j = 0; j < width; j++)    // cada coluna
    {
        // image[i][j] é o pixel na linha i, coluna j
        // image[i][j].rgbtRed   = valor do vermelho
        // image[i][j].rgbtGreen = valor do verde
        // image[i][j].rgbtBlue  = valor do azul
    }
}
```

---

## Dica 4 — Quase Lá 🎯

**Blur** é o mais difícil. Para cada pixel, calcule a média dos vizinhos:

```
Para pixel [i][j], os vizinhos são:
[i-1][j-1]  [i-1][j]  [i-1][j+1]
[i  ][j-1]  [i  ][j]  [i  ][j+1]
[i+1][j-1]  [i+1][j]  [i+1][j+1]
```

Cuidado com as bordas! Se i=0, não existe [i-1].
Crie uma CÓPIA da imagem antes de aplicar blur, senão os pixels
já modificados afetam o cálculo dos vizinhos.

Use `malloc()` para criar a cópia:
```c
RGBTRIPLE(*copy)[width] = calloc(height, width * sizeof(RGBTRIPLE));
```
