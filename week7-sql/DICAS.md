# 💡 Dicas — Inventário de Fazenda (Week 7)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Um banco de dados relacional organiza dados em **tabelas** que se conectam
por **chaves**. Pense assim:

- Uma FAZENDA tem vários TALHÕES (relação 1:N)
- Um TALHÃO tem vários PLANTIOS (relação 1:N)
- Um PLANTIO usa uma CULTURA (relação N:1)
- Um PLANTIO recebe várias APLICAÇÕES de insumo (relação 1:N)

Desenhe essas relações no papel antes de criar as tabelas.
Cada seta "tem vários" vira uma chave estrangeira (FOREIGN KEY).

---

## Dica 2 — Direcional 🧭

Para criar uma tabela com chave estrangeira:

```sql
CREATE TABLE talhoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fazenda_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    area_ha REAL NOT NULL,
    tipo_solo TEXT,
    FOREIGN KEY (fazenda_id) REFERENCES fazendas(id)
);
```

`FOREIGN KEY` garante que todo `fazenda_id` existe na tabela `fazendas`.
`AUTOINCREMENT` gera IDs automaticamente.

---

## Dica 3 — Estrutural 🏗️

Para consultas com JOIN, a ideia é "juntar tabelas":

```sql
-- Produção por fazenda (precisa juntar 3 tabelas!)
SELECT f.nome, SUM(p.producao_ton) as total
FROM fazendas f
JOIN talhoes t ON t.fazenda_id = f.id
JOIN plantios p ON p.talhao_id = t.id
GROUP BY f.nome
ORDER BY total DESC;
```

Leia de baixo para cima: GROUP BY agrupa, JOIN conecta, SELECT escolhe.

---

## Dica 4 — Quase Lá 🎯

Para calcular receita (produção × preço) e custo (soma das aplicações):

```sql
-- Receita por fazenda
SELECT f.nome,
       SUM(p.producao_ton * c.preco_ton) as receita
FROM fazendas f
JOIN talhoes t ON t.fazenda_id = f.id
JOIN plantios p ON p.talhao_id = t.id
JOIN culturas c ON p.cultura_id = c.id
GROUP BY f.nome;

-- Para o lucro, você precisa SUBTRAIR o custo de insumos.
-- Dica: faça o custo em uma subquery ou CTE (WITH ... AS)
```
