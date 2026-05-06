# 🔗 Week 9 — Flask: Encurtador de URLs

## 📺 Antes de começar
Assista a aula do CS50 Week 9:
- **YouTube**: https://www.youtube.com/watch?v=oVA0fB13FBM (CS50 2024 - Lecture 9 - Flask)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar um **encurtador de URLs** completo com Flask — frontend + backend + banco de dados.

### Funcionalidades:

1. **Encurtar URL**: Usuário cola uma URL longa → recebe uma URL curta
2. **Redirecionar**: Acessar a URL curta → redireciona para a URL original
3. **Estatísticas**: Ver quantas vezes cada URL curta foi acessada
4. **Listar**: Ver todas as URLs encurtadas

### Exemplo:
```
URL original:  https://cs50.harvard.edu/x/weeks/
URL curta:     http://localhost:5000/abc123
Cliques:       42
```

## 📋 Regras

- Use **Flask** como framework web
- Use **SQLite** para armazenar URLs (reuse o que aprendeu na Week 7!)
- Gere códigos curtos **aleatórios** de 6 caracteres
- O frontend deve ter um **formulário HTML** estilizado (reuse Week 8!)
- Valide que a URL inserida é válida (começa com http:// ou https://)

## 📁 Arquivos

```
week9-flask/
├── app.py              → Servidor Flask (SEU ARQUIVO PRINCIPAL)
├── templates/
│   ├── index.html      → Página principal
│   └── stats.html      → Página de estatísticas
├── static/
│   └── style.css       → Estilos
├── requirements.txt    → Dependências Python
└── testar.ps1          → Testes
```

## 🧪 Como testar

```powershell
# Instalar Flask
pip install flask

# Rodar o servidor
python app.py

# Em outro terminal
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- Rotas Flask (@app.route)
- Templates Jinja2 ({{ variavel }}, {% for %})
- Requisições GET e POST
- Redirecionamento (redirect)
- SQLite com Python
- Formulários HTML
- Validação de entrada
- Geração de códigos aleatórios (string + random)

## 🌍 Por que isso é real?

bit.ly, TinyURL, is.gd — todos funcionam exatamente assim. É um dos projetos mais clássicos de backend. Empresas usam encurtadores internos para tracking de cliques em campanhas de marketing.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
