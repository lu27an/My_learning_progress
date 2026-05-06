# 💡 Dicas — Agenda de Contatos (Week 3)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Um contato tem 3 informações (nome, telefone, email). Em C, quando
algo tem múltiplos atributos, usamos **struct**:

```c
typedef struct {
    char nome[50];
    char telefone[20];
    char email[50];
} Contato;
```

Pense na struct como uma "ficha" — e a agenda como um **array de fichas**.

---

## Dica 2 — Direcional 🧭

A **busca binária** só funciona em dados ordenados. O truque é:
manter a lista SEMPRE ordenada. Para isso, ao adicionar um contato:

1. Encontre a posição correta (onde ele deveria ficar na ordem)
2. Empurre todos os contatos depois dessa posição uma casa para frente
3. Coloque o novo contato na posição

Isso se chama **Insertion Sort** — pesquise o conceito.

Para comparar nomes ignorando maiúsculas/minúsculas, use
`_stricmp()` no Windows (ou `strcasecmp()` em Linux).

---

## Dica 3 — Estrutural 🏗️

A busca binária funciona assim:

```
1. inicio = 0, fim = n - 1
2. Enquanto inicio <= fim:
   a. meio = (inicio + fim) / 2
   b. Compare o nome buscado com contatos[meio].nome
   c. Se for igual: ENCONTROU!
   d. Se for menor: fim = meio - 1  (busque na metade esquerda)
   e. Se for maior: inicio = meio + 1  (busque na metade direita)
3. Se saiu do loop: NÃO ENCONTROU
```

---

## Dica 4 — Quase Lá 🎯

Para o menu em loop, use uma estrutura assim:

```c
int opcao;
do {
    printf("\n=== AGENDA DE CONTATOS ===\n");
    printf("1. Adicionar contato\n");
    // ... outras opções ...
    printf("Escolha: ");
    scanf("%d", &opcao);
    getchar(); // Consome o \n que sobrou do scanf

    switch (opcao) {
        case 1: adicionar(); break;
        case 2: buscar(); break;
        // ...
    }
} while (opcao != 5);
```

O `getchar()` depois do `scanf` é ESSENCIAL — sem ele, o `fgets` da
próxima leitura vai "engolir" o Enter e não funcionar.
