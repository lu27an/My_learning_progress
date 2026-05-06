// =============================================
// CORRETOR ORTOGRÁFICO
// CS50 — Week 5: Data Structures
// =============================================
//
// Para compilar: gcc -o corretor corretor.c
// Para rodar:    ./corretor dicionario.txt texto.txt
// Para testar:   powershell ./testar.ps1
// =============================================

// TODO 1: Inclua as bibliotecas necessárias
// stdio.h, stdlib.h, string.h, ctype.h, time.h


// Tamanho da hash table — experimente valores diferentes!
#define NUM_BUCKETS 1000
#define MAX_WORD 50

// TODO 2: Defina a struct para um nó da linked list
// Cada nó tem: uma palavra (char[MAX_WORD]) e um ponteiro para o próximo nó
// Use typedef struct node { ... } node;


// TODO 3: Declare a hash table como array global de ponteiros
// node *table[NUM_BUCKETS];
// Declare também um contador de palavras no dicionário


// TODO 4: Crie sua função de hash
// Recebe: uma string (const char *word)
// Retorna: unsigned int (índice na tabela, entre 0 e NUM_BUCKETS-1)
// CRIE A SUA! Não copie uma pronta. Pode ser simples no início.
// Dica: some os valores das letras e use módulo (%)


// TODO 5: Crie a função para carregar o dicionário
// Recebe: nome do arquivo do dicionário
// Retorna: true se carregou com sucesso, false se falhou
// Para cada palavra:
//   1. Crie um novo nó (malloc)
//   2. Copie a palavra para o nó
//   3. Calcule o hash
//   4. Insira no início da linked list daquele bucket


// TODO 6: Crie a função para verificar se uma palavra está no dicionário
// Recebe: a palavra a verificar
// Retorna: 1 se está no dicionário, 0 se não está
// 1. Calcule o hash da palavra
// 2. Percorra a linked list naquele bucket
// 3. Compare com strcasecmp/_stricmp (ignora maiúsculas)


// TODO 7: Crie a função para liberar toda a memória
// Percorra cada bucket da hash table
// Para cada nó: salve o ponteiro next, libere o nó atual, avance


// TODO 8: Crie a função main
// 1. Verifique argc == 3
// 2. Meça o tempo de carregamento (clock())
// 3. Carregue o dicionário
// 4. Abra o arquivo de texto
// 5. Leia palavra por palavra (filtre pontuação!)
// 6. Verifique cada palavra no dicionário
// 7. Se não encontrar, imprima como possível erro
// 8. Mostre estatísticas
// 9. Libere a memória
