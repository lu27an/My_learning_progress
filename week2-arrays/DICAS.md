# 💡 Dicas — Placar de Campeonato (Week 2)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Pense em como organizar os dados. Cada time tem VÁRIOS atributos
(nome, pontos, vitórias, empates, etc.)

Uma forma é usar **arrays paralelos**: um array pra nomes, outro pra pontos,
outro pra vitórias... O índice conecta tudo (time 0 = posição 0 em todos os arrays).

Quantos arrays você precisa? Liste no papel antes de codar.

---

## Dica 2 — Direcional 🧭

Para ler o nome de um time, você precisa de um **array de strings**.
Em C, string = array de char. Então array de strings = array de arrays:

```c
char nomes[8][50]; // 8 times, cada nome com até 49 caracteres
```

Para ler strings com espaço, use `fgets()` em vez de `scanf()`.
Mas cuidado: `fgets()` inclui o `\n` no final! Pesquise como remover.

---

## Dica 3 — Estrutural 🏗️

Para registrar um jogo, você precisa:
1. Encontrar o ÍNDICE do time da casa nos seus arrays
2. Encontrar o ÍNDICE do time visitante
3. Comparar os gols: quem ganhou?
4. Atualizar pontos, vitórias/empates/derrotas, gols

Para encontrar o índice, faça um loop comparando nomes com `strcmp()`.

---

## Dica 4 — Quase Lá 🎯

Para ordenar a tabela por pontos, use **Selection Sort**:

```c
// Para cada posição i
for (int i = 0; i < n - 1; i++)
{
    int max = i;
    // Encontre o time com mais pontos a partir de i
    for (int j = i + 1; j < n; j++)
    {
        if (pontos[j] > pontos[max])
            max = j;
    }
    // Troque os valores em TODOS os arrays (nome, pontos, vitorias, etc.)
    // ... swap aqui ...
}
```

Cuidado: ao trocar, você precisa trocar em TODOS os arrays paralelos,
senão os dados ficam desalinhados!
