# 🌾 Week 6 — Python: Analisador de Dados Agrícolas

## 📺 Antes de começar
Assista a aula do CS50 Week 6:
- **YouTube**: https://www.youtube.com/watch?v=EHi0RDZ31VA (CS50 2024 - Lecture 6 - Python)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar um programa em Python que **analisa dados de produção agrícola** a partir de um arquivo CSV.

### O programa deve:

1. Ler o arquivo `dados_safra.csv`
2. Mostrar um menu de análises:
   - Resumo geral (total de fazendas, área total, produção total)
   - Ranking de produtividade (produção/área, ordenado)
   - Filtrar por cultura (ex: só soja, só milho)
   - Análise por região
   - Identificar a fazenda mais e menos produtiva
3. Exibir os resultados formatados em tabelas

### Exemplo:
```
$ python analisador.py

=== ANALISADOR AGRÍCOLA ===
1. Resumo geral
2. Ranking de produtividade
3. Filtrar por cultura
4. Análise por região
5. Fazenda mais/menos produtiva
6. Sair

Escolha: 1

=== RESUMO GERAL ===
Total de fazendas:    15
Área total:           12.450 ha
Produção total:       45.230 ton
Produtividade média:  3.63 ton/ha
Culturas: Soja, Milho, Algodão, Café
```

## 📋 Regras

- Use APENAS a biblioteca padrão do Python (csv, sys, os)
- **NÃO** use pandas, numpy, ou outras bibliotecas externas
- Organize o código em **funções** (uma para cada análise)
- Use **dicionários** e **listas** para organizar os dados
- O código deve funcionar com QUALQUER CSV no mesmo formato

## 📁 Arquivos fornecidos

- `dados_safra.csv` — Dataset de produção agrícola

## 🧪 Como testar

```powershell
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Sintaxe Python vs C (a diferença vai te surpreender!)
- Listas e dicionários
- Leitura de CSV
- Funções e parâmetros
- Formatação de strings (f-strings)
- List comprehensions
- Sorted com key functions

## 🌍 Por que isso é real?

Empresas agrícolas como a que você está construindo o CampusVisor processam exatamente esse tipo de dado! A diferença é que eles usam pandas — mas entender os fundamentos primeiro te torna um programador melhor.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
