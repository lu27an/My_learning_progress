# 📝 Week 5 — Data Structures: Corretor Ortográfico

## 📺 Antes de começar
Assista a aula do CS50 Week 5:
- **YouTube**: https://www.youtube.com/watch?v=0euvEdPwQnQ (CS50 2024 - Lecture 5 - Data Structures)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar um **corretor ortográfico** que verifica um texto contra um dicionário de palavras em português.

### O programa deve:

1. Carregar um dicionário de palavras em uma **hash table**
2. Ler um arquivo de texto
3. Verificar cada palavra: está no dicionário?
4. Reportar as palavras não encontradas (possíveis erros)
5. Mostrar estatísticas (tempo de carregamento, palavras verificadas, erros encontrados)

### Exemplo de uso:
```
$ ./corretor dicionario.txt texto.txt

PALAVRAS COM POSSIVEL ERRO:
- programacao (linha 3)
- algoritimo (linha 7)
- memoira (linha 12)

ESTATISTICAS:
  Palavras no dicionario: 320.000
  Palavras no texto:      1.247
  Erros encontrados:      3
  Tempo de carga:         0.03s
  Tempo de verificacao:   0.01s
```

## 📋 Regras

- Use uma **hash table** (array de linked lists) para o dicionário
- A hash table deve ter pelo menos **1000 buckets**
- Crie sua própria **função de hash** (não copie uma pronta!)
- As verificações devem ser **case-insensitive** (ignorar maiúsculas)
- Meça o tempo com `clock()` de `<time.h>`

## 📁 Arquivos fornecidos

- `dicionario.txt` — Lista de palavras em português (uma por linha)

## 🧪 Como testar

```powershell
gcc -o corretor corretor.c
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Hash tables (arrays + linked lists)
- Funções de hash
- Alocação dinâmica (malloc para cada nó)
- Linked lists (inserção, busca)
- Leitura de arquivos texto (fopen, fscanf, fgets)
- Medição de performance (clock)

## 🌍 Por que isso é real?

O Word, Google Docs, e o corretor do seu celular fazem exatamente isso — mas com algoritmos mais sofisticados (distância de Levenshtein, n-grams). A hash table é a estrutura de dados mais usada em software: caches, bancos de dados, compiladores, tudo usa hash.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
