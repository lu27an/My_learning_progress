// =============================================
// AGENDA DE CONTATOS
// CS50 — Week 3: Algorithms
// =============================================
//
// Para compilar: gcc -o agenda agenda.c
// Para rodar:    ./agenda
// Para testar:   powershell ./testar.ps1
// =============================================

// TODO 1: Inclua as bibliotecas necessárias
// stdio.h, string.h, stdlib.h


// TODO 2: Defina a struct Contato
// Cada contato tem: nome (50 chars), telefone (20 chars), email (50 chars)
// Use typedef para facilitar


#define MAX_CONTATOS 50

// TODO 3: Declare um array global de Contatos e um contador
// Contato agenda[MAX_CONTATOS];
// int total = 0;


// TODO 4: Crie a função de busca binária
// Recebe: o nome a buscar
// Retorna: o índice do contato, ou -1 se não encontrar
// IMPORTANTE: a lista deve estar ordenada para isso funcionar!
// Use _stricmp() no Windows para comparar sem case-sensitivity


// TODO 5: Crie a função para adicionar contato (mantendo ordem)
// 1. Verifique se a agenda não está cheia
// 2. Leia nome, telefone e email
// 3. Encontre a posição correta para manter ordem alfabética
// 4. Desloque os contatos para abrir espaço
// 5. Insira o novo contato na posição correta
// 6. Incremente o contador


// TODO 6: Crie a função para buscar e exibir um contato
// 1. Leia o nome a buscar
// 2. Use a busca binária para encontrar
// 3. Se encontrou, mostre os dados
// 4. Se não encontrou, diga "Contato não encontrado"


// TODO 7: Crie a função para listar todos os contatos
// Como a lista já está ordenada, basta percorrer e imprimir


// TODO 8: Crie a função para remover um contato
// 1. Leia o nome a remover
// 2. Use busca binária para encontrar o índice
// 3. Desloque todos os contatos após ele uma posição para trás
// 4. Decremente o contador


// TODO 9: Crie a função main com o menu
// Use um loop do-while com switch-case
// Opcões: 1-Adicionar, 2-Buscar, 3-Listar, 4-Remover, 5-Sair
// DICA: use getchar() depois de scanf("%d") para limpar o buffer
