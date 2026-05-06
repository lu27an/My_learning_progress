# 💡 Dicas — Corretor Ortográfico (Week 5)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Uma **hash table** é um array onde cada posição contém uma **linked list**.

Pense assim: você tem 1000 gavetas (array). Para guardar uma palavra,
você calcula um número (hash) que diz em qual gaveta colocar. Para
buscar, calcula o hash de novo e vai direto na gaveta certa.

Se duas palavras caem na mesma gaveta (colisão), elas ficam encadeadas
na linked list daquela gaveta.

Desenhe isso no papel: 5 gavetas, 10 palavras. Onde cada uma vai?

---

## Dica 2 — Direcional 🧭

Uma **linked list** em C é feita com structs que apontam umas para as outras:

```c
typedef struct node {
    char word[50];
    struct node *next;  // ponteiro para o próximo nó
} node;
```

A hash table é um array de ponteiros para nós:
```c
node *table[NUM_BUCKETS];
```

Para inserir: crie um novo nó com malloc, coloque no INÍCIO da lista
(é mais rápido que no final).

---

## Dica 3 — Estrutural 🏗️

Uma função de hash simples: some os valores ASCII das letras e
tire o módulo pelo tamanho da tabela:

```c
unsigned int hash(const char *word)
{
    unsigned int valor = 0;
    for (int i = 0; word[i] != '\0'; i++)
    {
        valor += tolower(word[i]);
    }
    return valor % NUM_BUCKETS;
}
```

Esta função é simples mas funciona. Funções melhores distribuem
mais uniformemente (pesquise djb2 se quiser melhorar depois).

---

## Dica 4 — Quase Lá 🎯

O fluxo completo do programa:

```c
// 1. CARREGAR DICIONÁRIO
FILE *dic = fopen(argv[1], "r");
char palavra[50];
while (fscanf(dic, "%s", palavra) == 1)
{
    // Criar novo nó
    node *n = malloc(sizeof(node));
    strcpy(n->word, palavra);

    // Calcular hash
    unsigned int h = hash(palavra);

    // Inserir no início da lista
    n->next = table[h];
    table[h] = n;
}

// 2. VERIFICAR TEXTO
// Para cada palavra do texto:
//   - Calcule o hash
//   - Percorra a linked list nesse bucket
//   - Se encontrou (strcasecmp == 0): OK
//   - Se não encontrou: ERRO

// 3. LIBERAR MEMÓRIA (free todos os nós!)
```
