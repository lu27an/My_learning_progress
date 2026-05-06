# 📇 Week 3 — Algorithms: Agenda de Contatos

## 📺 Antes de começar
Assista a aula do CS50 Week 3:
- **YouTube**: https://www.youtube.com/watch?v=jZzyERW7h1A (CS50 2024 - Lecture 3 - Algorithms)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar uma **agenda de contatos no terminal** com busca e ordenação.

### O programa deve ter um MENU:

```
=== AGENDA DE CONTATOS ===
1. Adicionar contato
2. Buscar contato (por nome)
3. Listar todos (ordenados)
4. Remover contato
5. Sair

Escolha: _
```

### Cada contato tem:
- Nome (até 50 caracteres)
- Telefone (até 20 caracteres)
- Email (até 50 caracteres)

### Funcionalidades:
1. **Adicionar**: Cadastra um novo contato
2. **Buscar**: Busca por nome usando **busca binária** (a lista deve estar ordenada!)
3. **Listar**: Mostra todos os contatos em ordem alfabética
4. **Remover**: Remove um contato pelo nome

### Exemplo:
```
Escolha: 1
Nome: Maria Silva
Telefone: 11999887766
Email: maria@email.com
Contato adicionado!

Escolha: 2
Buscar nome: Maria
Encontrado: Maria Silva | 11999887766 | maria@email.com
```

## 📋 Regras

- Máximo de **50 contatos**
- Use **struct** para representar um contato
- A lista deve estar **sempre ordenada** por nome (use insertion sort ao adicionar)
- A busca deve usar **busca binária** (não busca linear!)
- O menu deve rodar em loop até o usuário escolher "Sair"

## 🧪 Como testar

```powershell
gcc -o agenda agenda.c
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Structs (tipos compostos)
- Busca binária (O(log n) vs O(n))
- Insertion sort (manter array ordenado)
- Loops com menu interativo
- Manipulação de strings (strcasecmp/stricmp)

## 🌍 Por que isso é real?

A agenda do seu celular faz exatamente isso. O Google Contacts, o Outlook — todos usam estruturas de dados ordenadas com busca eficiente. A busca binária é usada em TUDO: bancos de dados, dicionários, DNS, git bisect.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
