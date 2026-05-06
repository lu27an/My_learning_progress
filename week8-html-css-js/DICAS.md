# 💡 Dicas — Dashboard Pessoal (Week 8)

> ⚠️ TENTE pelo menos 15 minutos sozinho antes de ler cada dica!

---

## Dica 1 — Conceitual 🤔

Uma página web tem 3 camadas:
- **HTML** = o esqueleto (estrutura)
- **CSS** = a roupa (aparência)
- **JavaScript** = o cérebro (comportamento)

Comece pelo HTML. Crie a estrutura INTEIRA primeiro, sem se preocupar
com design ou funcionalidade. Depois CSS. Depois JS.

Use elementos semânticos: `<header>`, `<main>`, `<section>`, `<footer>`.

---

## Dica 2 — Direcional 🧭

Para o relógio em tempo real:

```javascript
function atualizarRelogio() {
    const agora = new Date();
    const horas = String(agora.getHours()).padStart(2, '0');
    const minutos = String(agora.getMinutes()).padStart(2, '0');
    const segundos = String(agora.getSeconds()).padStart(2, '0');
    document.getElementById('relogio').textContent = `${horas}:${minutos}:${segundos}`;
}

setInterval(atualizarRelogio, 1000); // Atualiza a cada 1 segundo
```

Para o layout em grid (2 colunas):
```css
.dashboard {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}
```

---

## Dica 3 — Estrutural 🏗️

Para salvar tarefas no localStorage:

```javascript
// Salvar
function salvarTarefas(tarefas) {
    localStorage.setItem('tarefas', JSON.stringify(tarefas));
}

// Carregar
function carregarTarefas() {
    const dados = localStorage.getItem('tarefas');
    return dados ? JSON.parse(dados) : [];
}
```

`localStorage` persiste dados no navegador — mesmo fechando e abrindo
de novo, as tarefas continuam lá!

---

## Dica 4 — Quase Lá 🎯

Para deixar bonito, use CSS moderno:

```css
:root {
    --cor-primaria: #667eea;
    --cor-secundaria: #764ba2;
}

body {
    background: linear-gradient(135deg, var(--cor-primaria), var(--cor-secundaria));
    font-family: 'Segoe UI', sans-serif;
    min-height: 100vh;
}

.card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}
```

Isso é chamado de **glassmorphism** — o efeito de vidro fosco.
