# ⚽ Week 2 — Arrays: Placar de Campeonato

## 📺 Antes de começar
Assista a aula do CS50 Week 2:
- **YouTube**: https://www.youtube.com/watch?v=4vU4aEFmTSo (CS50 2024 - Lecture 2 - Arrays)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar um programa em C que gerencia o **placar de um campeonato de futebol**.

### O programa deve:

1. Registrar resultados de jogos entre times
2. Calcular e exibir a **tabela de classificação** (pontos, vitórias, empates, derrotas)
3. Mostrar o **saldo de gols** de cada time
4. Ordenar a tabela por pontos (decrescente)

### Exemplo de uso:
```
$ ./placar
=== CAMPEONATO CS50 ===

Quantos times? 4
Time 1: Flamengo
Time 2: Palmeiras
Time 3: Corinthians
Time 4: Santos

Quantos jogos para registrar? 3

Jogo 1:
  Time da casa: Flamengo
  Time visitante: Palmeiras
  Placar: 2 x 1

Jogo 2:
  Time da casa: Corinthians
  Time visitante: Santos
  Placar: 0 x 0

Jogo 3:
  Time da casa: Santos
  Time visitante: Flamengo
  Placar: 1 x 3

=== CLASSIFICAÇÃO ===
 #  Time          Pts  V  E  D  GP  GC  SG
 1  Flamengo       6   2  0  0   5   2  +3
 2  Palmeiras      0   0  0  1   1   2  -1
 3  Corinthians    1   0  1  0   0   0   0
 4  Santos         1   0  1  0   1   1   0
```

## 📋 Regras

- Máximo de **8 times** e **20 jogos**
- Use **arrays** para armazenar: nomes dos times, pontos, vitórias, empates, derrotas, gols pró, gols contra
- Use **strings** (arrays de char) para os nomes
- Vitória = 3 pontos, Empate = 1 ponto, Derrota = 0 pontos
- A tabela deve ser **ordenada por pontos** (maior primeiro)

## 🧪 Como testar

```powershell
gcc -o placar placar.c
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Arrays de inteiros e strings
- Loops aninhados (for dentro de for)
- Funções com arrays como parâmetro
- Ordenação simples (bubble sort ou selection sort)
- Formatação de saída com printf
- strcmp() para comparar strings

## 🌍 Por que isso é real?

Toda liga esportiva do mundo (FIFA, NBA, Premier League) usa exatamente essa lógica: arrays de dados, cálculos de pontuação e ordenação. O Cartola FC é basicamente isso com uma interface bonita.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md` — mas tente pelo menos 15 minutos sozinho antes!
