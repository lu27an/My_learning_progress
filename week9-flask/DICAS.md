# 💡 Dicas — Encurtador de URLs (Week 9)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Um encurtador de URLs é simplesmente um DICIONÁRIO:
- Chave: código curto ("abc123")
- Valor: URL longa ("https://...")

Quando alguém acessa `/abc123`, o servidor procura no dicionário
e redireciona para a URL longa.

O desafio é: como armazenar isso de forma permanente? → SQLite!

---

## Dica 2 — Direcional 🧭

Flask básico funciona assim:

```python
from flask import Flask, render_template, request, redirect

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/encurtar", methods=["POST"])
def encurtar():
    url = request.form.get("url")
    # Gerar código, salvar no banco, retornar resultado
    ...

if __name__ == "__main__":
    app.run(debug=True)
```

Para gerar um código aleatório:
```python
import random, string
codigo = ''.join(random.choices(string.ascii_letters + string.digits, k=6))
```

---

## Dica 3 — Estrutural 🏗️

A tabela no SQLite:
```sql
CREATE TABLE urls (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo TEXT UNIQUE NOT NULL,
    url_original TEXT NOT NULL,
    cliques INTEGER DEFAULT 0,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Para redirecionar, crie uma rota dinâmica:
```python
@app.route("/<codigo>")
def redirecionar(codigo):
    # Buscar URL no banco
    # Incrementar cliques
    # redirect(url_original)
```

---

## Dica 4 — Quase Lá 🎯

Template Jinja2 para o formulário (`index.html`):

```html
<form action="/encurtar" method="POST">
    <input type="url" name="url" placeholder="Cole sua URL aqui..." required>
    <button type="submit">Encurtar!</button>
</form>

{% if url_curta %}
<div class="resultado">
    <p>URL encurtada: <a href="{{ url_curta }}">{{ url_curta }}</a></p>
</div>
{% endif %}
```

O `{% if %}` do Jinja só mostra o resultado DEPOIS que uma URL foi encurtada.
