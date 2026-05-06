# 🔐 Week 1 — C: Gerador de Senhas Seguras

## 📺 Antes de começar
Assista a aula do CS50 Week 1:
- **YouTube**: https://www.youtube.com/watch?v=cKhVupvyhKk (CS50 2024 - Lecture 1 - C)
- **Duração**: ~2 horas (pode assistir em 1.5x)

## 🎯 Sua Missão

Criar um programa em C que **gera senhas seguras aleatórias** no terminal.

### O programa deve:

1. Receber pela **linha de comando** o tamanho desejado da senha
2. Gerar uma senha aleatória com letras (maiúsculas e minúsculas), números e símbolos
3. Imprimir a senha na tela

### Exemplo de uso:
```
$ ./gerador 16
Senha gerada: aK9#mP2$xL7!nQ4@

$ ./gerador 8
Senha gerada: bR3&kW9!

$ ./gerador
Uso: ./gerador <tamanho>
```

## 📋 Regras

- Use APENAS o que aprendeu na aula (stdio.h, stdlib.h, time.h)
- O programa deve validar se o usuário passou o argumento
- A senha deve conter pelo menos 1 de cada: maiúscula, minúscula, número, símbolo
- NÃO use bibliotecas externas

## 🧪 Como testar

Depois de escrever seu código em `gerador.c`:

```powershell
# Compilar
gcc -o gerador gerador.c

# Testar
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Compilação (gcc)
- Variáveis e tipos (int, char)
- Funções (printf, rand, srand, atoi)
- Condições (if/else)
- Loops (for)
- Argumentos de linha de comando (argc, argv)
- Arrays de caracteres (strings em C)

## 🌍 Por que isso é real?

Geradores de senhas existem em todo lugar (1Password, Bitwarden, LastPass). Você está construindo a lógica que está por trás de todos eles. Depois desse projeto, você vai entender como essas ferramentas funcionam.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md` — mas tente pelo menos 15 minutos sozinho antes!
