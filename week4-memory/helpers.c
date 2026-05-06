// =============================================
// HELPERS — Funções de Filtro
// CS50 — Week 4: Memory
// =============================================
//
// ESTE É O SEU ARQUIVO! Implemente os filtros aqui.
//
// Para compilar: gcc -o filtro filtro.c helpers.c -lm
// Para testar:   powershell ./testar.ps1
// =============================================

#include "helpers.h"
#include <math.h>
#include <stdlib.h>

// TODO 1: Implemente o filtro ESCALA DE CINZA
// Para cada pixel, calcule a média de R, G e B
// Defina R, G e B como essa média (arredonde com round())
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    // Seu código aqui
    // Percorra cada pixel com dois loops (height e width)
    // Calcule: media = round((R + G + B) / 3.0)
    // Defina R = G = B = media
}

// TODO 2: Implemente o filtro SÉPIA
// Use as fórmulas:
//   sepiaR = round(0.393*R + 0.769*G + 0.189*B)
//   sepiaG = round(0.349*R + 0.686*G + 0.168*B)
//   sepiaB = round(0.272*R + 0.534*G + 0.131*B)
// Se o resultado > 255, use 255
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    // Seu código aqui
}

// TODO 3: Implemente o filtro ESPELHO (reflect)
// Para cada linha, inverta os pixels horizontalmente
// Pixel da esquerda troca com o da direita
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    // Seu código aqui
    // Para cada linha i:
    //   Troque image[i][0] com image[i][width-1]
    //   Troque image[i][1] com image[i][width-2]
    //   ... até chegar no meio
}

// TODO 4: Implemente o filtro BLUR
// Para cada pixel, calcule a média dos vizinhos (3x3)
// CUIDADO: crie uma cópia da imagem antes de modificar!
// Sem a cópia, os pixels já alterados afetam o cálculo
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // Seu código aqui
    // 1. Crie uma cópia: RGBTRIPLE(*copy)[width] = calloc(height, width * sizeof(RGBTRIPLE));
    // 2. Copie a imagem original para copy
    // 3. Para cada pixel, calcule a média dos vizinhos usando copy
    // 4. Coloque o resultado em image
    // 5. Libere a cópia com free(copy)
}
