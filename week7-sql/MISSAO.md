# 🏗️ Week 7 — SQL: Inventário de Fazenda

## 📺 Antes de começar
Assista a aula do CS50 Week 7:
- **YouTube**: https://www.youtube.com/watch?v=zrCLRC3Ci1c (CS50 2024 - Lecture 7 - SQL)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar e consultar um **banco de dados SQLite** para gerenciar o inventário de uma fazenda.

### O banco deve ter estas tabelas:

1. **fazendas** — id, nome, regiao, area_total_ha
2. **talhoes** — id, fazenda_id, nome, area_ha, tipo_solo
3. **culturas** — id, nome, ciclo_dias, preco_ton
4. **plantios** — id, talhao_id, cultura_id, data_plantio, data_colheita, producao_ton
5. **insumos** — id, nome, tipo, preco_unitario
6. **aplicacoes** — id, plantio_id, insumo_id, quantidade, data_aplicacao

### Suas tarefas:

1. **Criar o schema** (tabelas e relacionamentos) em `criar_banco.sql`
2. **Inserir dados de exemplo** (pelo menos 3 fazendas, 6 talhões, 4 culturas, 8 plantios)
3. **Escrever 10 consultas SQL** em `consultas.sql` para responder perguntas de negócio

### As 10 consultas:

```sql
-- Q1: Listar todas as fazendas com sua área total
-- Q2: Quantos talhões cada fazenda tem?
-- Q3: Qual a produção total por cultura?
-- Q4: Qual o talhão mais produtivo? (produção/área)
-- Q5: Quanto foi gasto em insumos por plantio?
-- Q6: Quais fazendas estão na região Centro-Oeste?
-- Q7: Qual a receita estimada por fazenda? (produção × preço)
-- Q8: Quais plantios ainda não foram colhidos? (data_colheita IS NULL)
-- Q9: Ranking de fazendas por lucro (receita - custo de insumos)
-- Q10: Média de produtividade por tipo de solo
```

## 📋 Regras

- Use **SQLite** (já instalado no seu sistema!)
- Todas as tabelas devem ter **chaves primárias** e **chaves estrangeiras**
- Use **JOINs** (não subconsultas aninhadas) sempre que possível
- Use **GROUP BY** e **funções de agregação** (SUM, AVG, COUNT, MAX, MIN)

## 🧪 Como testar

```powershell
# Criar o banco
sqlite3 fazenda.db < criar_banco.sql

# Rodar as consultas
sqlite3 fazenda.db < consultas.sql

# Ou testar automaticamente
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- CREATE TABLE com tipos e constraints
- INSERT INTO
- SELECT com WHERE, ORDER BY, LIMIT
- JOINs (INNER, LEFT)
- GROUP BY + HAVING
- Funções de agregação
- Subqueries
- Chaves estrangeiras (FOREIGN KEY)

## 🌍 Por que isso é real?

O CampusVisor usa PostgreSQL para armazenar exatamente esses dados! A diferença é que PostgreSQL tem PostGIS para dados geoespaciais, mas a lógica SQL é idêntica.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
