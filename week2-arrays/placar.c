// =============================================
// PLACAR DE CAMPEONATO
// CS50 — Week 2: Arrays
// =============================================
//
// Seu objetivo: completar os TODOs abaixo para
// criar um sistema de placar de campeonato.
//
// Para compilar: gcc -o placar placar.c
// Para rodar:    ./placar
// Para testar:   powershell ./testar.ps1
// =============================================

// TODO 1: Inclua as bibliotecas necessárias
// Você vai precisar de: stdio.h, string.h, stdlib.h


// Constantes — não mude estes valores
#define MAX_TIMES 8
#define MAX_NOME 50
#define MAX_JOGOS 20

// TODO 2: Declare os arrays globais para armazenar os dados dos times
// Você vai precisar de arrays para:
//   - nomes (array de strings: char nomes[MAX_TIMES][MAX_NOME])
//   - pontos
//   - vitorias
//   - empates
//   - derrotas
//   - gols_pro (gols marcados)
//   - gols_contra (gols sofridos)


// TODO 3: Crie uma função para encontrar o índice de um time pelo nome
// Recebe: o nome a buscar, a quantidade de times
// Retorna: o índice do time no array, ou -1 se não encontrar
// Dica: use strcmp() para comparar strings


// TODO 4: Crie uma função para registrar o resultado de um jogo
// Recebe: índice do time da casa, índice do visitante, gols casa, gols visitante
// Atualiza: pontos, vitorias/empates/derrotas, gols_pro, gols_contra
// Lembre-se: vitória = 3 pts, empate = 1 pt, derrota = 0 pts


// TODO 5: Crie uma função para ordenar a classificação por pontos (decrescente)
// Use Selection Sort ou Bubble Sort
// CUIDADO: ao trocar posições, troque em TODOS os arrays!


// TODO 6: Crie uma função para exibir a tabela de classificação
// Formato:
//  #  Time          Pts  V  E  D  GP  GC  SG
//  1  Flamengo       6   2  0  0   5   2  +3
// Dica: use printf com especificadores de largura (%-15s, %3d, etc.)


// TODO 7: Crie a função main
// O fluxo deve ser:
//   1. Perguntar quantos times (máximo MAX_TIMES)
//   2. Ler o nome de cada time
//   3. Perguntar quantos jogos registrar (máximo MAX_JOGOS)
//   4. Para cada jogo: ler time casa, time visitante, placar
//   5. Ordenar a classificação
//   6. Exibir a tabela
