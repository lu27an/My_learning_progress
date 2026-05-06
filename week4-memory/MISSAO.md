# 🖼️ Week 4 — Memory: Filtro de Imagem

## 📺 Antes de começar
Assista a aula do CS50 Week 4:
- **YouTube**: https://www.youtube.com/watch?v=F9-yqoS7b8w (CS50 2024 - Lecture 4 - Memory)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar um programa em C que aplica **filtros em imagens BMP**.

### Filtros para implementar:

1. **Escala de Cinza** (grayscale) — Converte cada pixel para tons de cinza
2. **Sépia** — Aplica um tom amarelado/vintage
3. **Espelho** — Inverte a imagem horizontalmente
4. **Blur** — Borra a imagem (média dos pixels vizinhos)

### Exemplo de uso:
```
$ ./filtro -g imagem.bmp saida.bmp    (escala de cinza)
$ ./filtro -s imagem.bmp saida.bmp    (sépia)
$ ./filtro -e imagem.bmp saida.bmp    (espelho)
$ ./filtro -b imagem.bmp saida.bmp    (blur)
```

## 📋 Regras

- O programa recebe 3 argumentos: flag do filtro, arquivo de entrada, arquivo de saída
- Use **ponteiros** para manipular os pixels
- Use **malloc/free** para alocar a imagem na memória
- O formato BMP já vem com um helper (`bmp.h`) que lida com o cabeçalho

## 📁 Arquivos fornecidos

- `bmp.h` — Definições de struct para cabeçalho BMP (NÃO MODIFIQUE)
- `helpers.h` — Declarações das funções de filtro (NÃO MODIFIQUE)
- `filtro.c` — Programa principal (NÃO MODIFIQUE)
- `helpers.c` — **ESTE É O SEU ARQUIVO** — implemente os filtros aqui
- `imagem.bmp` — Imagem de teste

## 🧪 Como testar

```powershell
gcc -o filtro filtro.c helpers.c -lm
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Ponteiros (*ptr, &var)
- Alocação dinâmica (malloc, free)
- Leitura/escrita de arquivos binários (fopen, fread, fwrite)
- Manipulação de bytes (cada pixel = 3 bytes: R, G, B)
- Aritmética de ponteiros

## 🌍 Por que isso é real?

Instagram, Photoshop, GIMP — todos os filtros de imagem são variações dessas mesmas operações matemáticas pixel por pixel. Você está construindo a essência do processamento de imagem.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
