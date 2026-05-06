# 💡 Dicas — Analisador Agrícola (Week 6)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Em Python, ler um CSV é MUITO mais fácil que em C:

```python
import csv

with open("arquivo.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["coluna"])
```

`DictReader` transforma cada linha em um dicionário onde as chaves
são os nomes das colunas. Muito mais intuitivo!

Tente ler o CSV e imprimir cada linha para ver a estrutura dos dados.

---

## Dica 2 — Direcional 🧭

Para organizar os dados, crie uma **lista de dicionários**:

```python
fazendas = []
for row in reader:
    fazenda = {
        "nome": row["nome"],
        "area": float(row["area_ha"]),
        "producao": float(row["producao_ton"]),
        # ... outros campos
    }
    fazendas.append(fazenda)
```

Depois, para calcular o total de área:
```python
area_total = sum(f["area"] for f in fazendas)
```

Isso se chama **generator expression** — é o equivalente Python de um
loop que soma, mas em uma linha só.

---

## Dica 3 — Estrutural 🏗️

Para ordenar por produtividade (produção/área), use `sorted` com `key`:

```python
ranking = sorted(fazendas, key=lambda f: f["producao"] / f["area"], reverse=True)
```

`lambda` é uma "mini-função" sem nome. Essa linha diz:
"ordene as fazendas pelo resultado de produção/área, do maior para o menor."

Para filtrar por cultura:
```python
soja = [f for f in fazendas if f["cultura"] == "Soja"]
```

Isso se chama **list comprehension** — é um loop+if em uma linha.

---

## Dica 4 — Quase Lá 🎯

Para formatar a saída como tabela:

```python
print(f"{'Nome':<20} {'Área (ha)':>10} {'Produção (ton)':>15} {'Prod. (ton/ha)':>15}")
print("-" * 62)
for f in ranking:
    prod = f["producao"] / f["area"]
    print(f"{f['nome']:<20} {f['area']:>10.1f} {f['producao']:>15.1f} {prod:>15.2f}")
```

O `<` alinha à esquerda, `>` à direita. O `.1f` e `.2f` controlam casas decimais.
