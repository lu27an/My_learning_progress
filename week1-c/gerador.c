// =============================================
// GERADOR DE SENHAS SEGURAS
// CS50 — Week 1: C
// =============================================
//
// Seu objetivo: completar os TODOs abaixo para
// criar um gerador de senhas que funciona no terminal.
//
// Para compilar: gcc -o gerador gerador.c
// Para rodar:    ./gerador 16
// Para testar:   powershell ./testar.ps1
// =============================================

// TODO 1: Inclua as bibliotecas necessárias
// Você vai precisar de:
//   - stdio.h   (para printf)
//   - stdlib.h  (para rand, srand, atoi)
//   - time.h    (para time)
//   - string.h  (para strlen)


// TODO 2: Crie a função main
// Lembre-se: para receber argumentos da linha de comando,
// a assinatura é: int main(int argc, char *argv[])
// - argc = quantos argumentos foram passados
// - argv = array com os argumentos (argv[0] é o nome do programa)


    // TODO 3: Verifique se o usuário passou exatamente 1 argumento
    // Se não passou, mostre: "Uso: ./gerador <tamanho>\n"
    // E retorne 1 (código de erro)


    // TODO 4: Converta o argumento de texto para número
    // argv[1] é uma string ("16"), você precisa do número 16
    // Pesquise: qual função converte string para int em C?


    // TODO 5: Inicialize o gerador de números aleatórios
    // Sem isso, rand() gera sempre os MESMOS números!
    // Pesquise: srand() e time()


    // TODO 6: Defina o conjunto de caracteres possíveis
    // Sua senha deve poder conter:
    //   - Letras minúsculas (a-z)
    //   - Letras maiúsculas (A-Z)
    //   - Números (0-9)
    //   - Símbolos (!@#$%&*)


    // TODO 7: Gere a senha usando um loop
    // Para cada posição da senha:
    //   - Escolha um índice aleatório no charset
    //   - Imprima o caractere nessa posição


    // TODO 8: Imprima uma nova linha no final e retorne 0

