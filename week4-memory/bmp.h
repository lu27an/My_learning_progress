// bmp.h — Definições de structs para BMP (NÃO MODIFIQUE)

#include <stdint.h>

// Aliases para tipos de dados
typedef uint8_t BYTE;
typedef uint32_t DWORD;
typedef int32_t LONG;
typedef uint16_t WORD;

// Cabeçalho do arquivo BMP
typedef struct
{
    WORD bfType;
    DWORD bfSize;
    WORD bfReserved1;
    WORD bfReserved2;
    DWORD bfOffBits;
} __attribute__((__packed__)) BITMAPFILEHEADER;

// Informações da imagem BMP
typedef struct
{
    DWORD biSize;
    LONG biWidth;
    LONG biHeight;
    WORD biPlanes;
    WORD biBitCount;
    DWORD biCompression;
    DWORD biSizeImage;
    LONG biXPelsPerMeter;
    LONG biYPelsPerMeter;
    DWORD biClrUsed;
    DWORD biClrImportant;
} __attribute__((__packed__)) BITMAPINFOHEADER;

// Um pixel RGB
typedef struct
{
    BYTE rgbtBlue;
    BYTE rgbtGreen;
    BYTE rgbtRed;
} __attribute__((__packed__)) RGBTRIPLE;
