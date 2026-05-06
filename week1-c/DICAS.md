# 💡 Dicas — Gerador de Senhas (Week 1)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!
> Leia UMA dica por vez. Tente de novo. Só leia a próxima se ainda travar.

---

## Dica 1 — Conceitual 🤔

Pense no problema assim: uma senha é apenas uma **sequência de caracteres**.
Cada caractere é escolhido **aleatoriamente** de um conjunto possível.

Pergunta pra você mesmo: "Quais são todos os caracteres possíveis em uma senha?"

Tente listar eles no papel antes de codar.

---

## Dica 2 — Direcional 🧭

Em C, cada caractere tem um número associado (tabela ASCII).
- 'a' = 97, 'b' = 98, ..., 'z' = 122
- 'A' = 65, 'B' = 66, ..., 'Z' = 90
- '0' = 48, '1' = 49, ..., '9' = 57

A função `rand()` gera um número aleatório. Mas antes de usá-la, você
precisa "plantar uma semente" com `srand()`. Pesquise:
- O que `srand(time(NULL))` faz?
- O que `rand() % N` faz?

---

## Dica 3 — Estrutural 🏗️

O esqueleto do seu programa deve ter mais ou menos esta forma:

1. Verificar se `argc == 2` (o usuário passou o tamanho?)
2. Converter `argv[1]` para um número com `atoi()`
3. Inicializar o gerador aleatório com `srand(time(NULL))`
4. Criar uma string com todos os caracteres possíveis: "abcdef...XYZ...0123...!@#..."
5. Fazer um loop `for` que roda N vezes
6. Em cada iteração, escolher um caractere aleatório dessa string
7. Imprimir o resultado

---

## Dica 4 — Quase Lá 🎯

```c
// Uma string com todos os caracteres possíveis:
char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%&*";

// Para pegar UM caractere aleatório dessa string:
int indice = rand() % strlen(charset);
char c = charset[indice];
```

Agora coloque isso dentro de um loop e monte a senha caractere por caractere.
Não esqueça: `strlen()` precisa de `#include <string.h>`
