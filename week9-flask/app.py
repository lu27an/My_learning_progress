# =============================================
# ENCURTADOR DE URLs
# CS50 — Week 9: Flask
# =============================================
#
# Para rodar:  python app.py
# Para testar: powershell ./testar.ps1
# =============================================

# TODO 1: Importe os módulos necessários
# flask: Flask, render_template, request, redirect, url_for
# sqlite3
# random, string
# os


# TODO 2: Crie a instância do Flask
# app = Flask(__name__)


# TODO 3: Crie a função para inicializar o banco de dados
# Crie a tabela 'urls' se não existir:
# - id (PRIMARY KEY)
# - codigo (TEXT UNIQUE)
# - url_original (TEXT)
# - cliques (INTEGER DEFAULT 0)
# - criado_em (TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
def init_db():
    pass


# TODO 4: Crie a função para gerar código aleatório
# Gere uma string de 6 caracteres (letras + números)
# Verifique se o código já existe no banco (se sim, gere outro)
def gerar_codigo():
    pass


# TODO 5: Crie a rota principal (GET /)
# Renderize index.html
# Passe a lista de URLs do banco para o template
@app.route("/")
def index():
    pass


# TODO 6: Crie a rota para encurtar (POST /encurtar)
# 1. Pegue a URL do formulário
# 2. Valide (começa com http:// ou https://?)
# 3. Gere um código
# 4. Salve no banco
# 5. Renderize index.html com a URL curta gerada
@app.route("/encurtar", methods=["POST"])
def encurtar():
    pass


# TODO 7: Crie a rota de redirecionamento (GET /<codigo>)
# 1. Busque o código no banco
# 2. Se encontrou: incremente cliques e redirecione
# 3. Se não encontrou: mostre erro 404
@app.route("/<codigo>")
def redirecionar(codigo):
    pass


# TODO 8: Crie a rota de estatísticas (GET /stats)
# Mostre todas as URLs com seus cliques, ordenadas por cliques
@app.route("/stats")
def stats():
    pass


# TODO 9: Rode o servidor
# if __name__ == "__main__":
#     init_db()
#     app.run(debug=True)
