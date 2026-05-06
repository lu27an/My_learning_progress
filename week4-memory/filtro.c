// =============================================
// FILTRO DE IMAGEM — Programa Principal
// CS50 — Week 4: Memory
// =============================================
// NÃO MODIFIQUE ESTE ARQUIVO!
// Seu trabalho é em helpers.c

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.h"

int main(int argc, char *argv[])
{
    // Verificar argumentos
    if (argc != 4)
    {
        printf("Uso: ./filtro -flag entrada.bmp saida.bmp\n");
        printf("Flags: -g (cinza) -s (sepia) -e (espelho) -b (blur)\n");
        return 1;
    }

    // Identificar o filtro
    char *flag = argv[1];
    if (strlen(flag) != 2 || flag[0] != '-' ||
        (flag[1] != 'g' && flag[1] != 's' && flag[1] != 'e' && flag[1] != 'b'))
    {
        printf("Flag invalida. Use: -g, -s, -e ou -b\n");
        return 2;
    }

    char filtro = flag[1];

    // Abrir arquivo de entrada
    FILE *inptr = fopen(argv[2], "rb");
    if (inptr == NULL)
    {
        printf("Nao foi possivel abrir %s\n", argv[2]);
        return 3;
    }

    // Ler cabeçalho do arquivo
    BITMAPFILEHEADER bf;
    fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);

    // Ler cabeçalho da imagem
    BITMAPINFOHEADER bi;
    fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);

    // Verificar se é BMP válido
    if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 ||
        bi.biSize != 40 || bi.biBitCount != 24 || bi.biCompression != 0)
    {
        fclose(inptr);
        printf("Formato BMP nao suportado.\n");
        return 4;
    }

    int height = abs(bi.biHeight);
    int width = bi.biWidth;

    // Alocar memória para a imagem
    RGBTRIPLE(*image)[width] = calloc(height, width * sizeof(RGBTRIPLE));
    if (image == NULL)
    {
        printf("Memoria insuficiente.\n");
        fclose(inptr);
        return 5;
    }

    // Calcular padding
    int padding = (4 - (width * sizeof(RGBTRIPLE)) % 4) % 4;

    // Ler pixels
    for (int i = 0; i < height; i++)
    {
        fread(image[i], sizeof(RGBTRIPLE), width, inptr);
        fseek(inptr, padding, SEEK_CUR);
    }
    fclose(inptr);

    // Aplicar filtro
    switch (filtro)
    {
        case 'g': grayscale(height, width, image); break;
        case 's': sepia(height, width, image); break;
        case 'e': reflect(height, width, image); break;
        case 'b': blur(height, width, image); break;
    }

    // Salvar arquivo de saída
    FILE *outptr = fopen(argv[3], "wb");
    if (outptr == NULL)
    {
        printf("Nao foi possivel criar %s\n", argv[3]);
        free(image);
        return 6;
    }

    fwrite(&bf, sizeof(BITMAPFILEHEADER), 1, outptr);
    fwrite(&bi, sizeof(BITMAPINFOHEADER), 1, outptr);

    for (int i = 0; i < height; i++)
    {
        fwrite(image[i], sizeof(RGBTRIPLE), width, outptr);
        for (int k = 0; k < padding; k++) fputc(0x00, outptr);
    }

    fclose(outptr);
    free(image);

    printf("Filtro '%c' aplicado com sucesso! Saida: %s\n", filtro, argv[3]);
    return 0;
}
