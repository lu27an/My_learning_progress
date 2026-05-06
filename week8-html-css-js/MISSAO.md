# 📊 Week 8 — HTML/CSS/JS: Dashboard Pessoal

## 📺 Antes de começar
Assista a aula do CS50 Week 8:
- **YouTube**: https://www.youtube.com/watch?v=alnzFK-4xMY (CS50 2024 - Lecture 8 - HTML, CSS, JavaScript)
- **Duração**: ~2 horas

## 🎯 Sua Missão

Criar um **Dashboard Pessoal** interativo — uma página web que você abriria todo dia.

### O dashboard deve ter:

1. **Relógio digital** em tempo real (atualiza a cada segundo)
2. **Lista de tarefas** (To-Do) com adicionar/completar/remover (salva no localStorage!)
3. **Clima atual** — mostra temperatura e condição (use uma API grátis ou dados mock)
4. **Citação motivacional** — uma frase aleatória que muda ao carregar a página
5. **Design responsivo** — funciona no celular e no desktop

### Visualização esperada:
```
┌────────────────────────────────────────────┐
│            Bom dia, Luan! ☀️               │
│              22:30:45                       │
│         Terça-feira, 5 de Maio              │
├──────────────────────┬─────────────────────┤
│  📋 TAREFAS          │  🌤️ CLIMA           │
│  ☑ Assistir CS50 W8  │  São Paulo          │
│  ☐ Fazer dashboard   │  28°C - Ensolarado  │
│  ☐ Commit no GitHub  │                     │
│  [+ Nova tarefa]     │                     │
├──────────────────────┴─────────────────────┤
│  💬 "O único modo de fazer um ótimo        │
│   trabalho é amar o que você faz." - Jobs  │
└────────────────────────────────────────────┘
```

## 📋 Regras

- **HTML** puro para estrutura (sem frameworks!)
- **CSS** puro para estilo (sem Bootstrap, Tailwind, etc.)
- **JavaScript** puro para interatividade (sem jQuery, React, etc.)
- As tarefas devem **persistir** usando `localStorage`
- O relógio deve atualizar **em tempo real** (setInterval)
- O design deve ser **bonito** — use cores, gradientes, sombras!

## 📁 Arquivos

- `index.html` — Estrutura da página
- `style.css` — Estilos
- `script.js` — Lógica e interatividade

## 🧪 Como testar

Abra `index.html` no navegador, ou:
```powershell
.\testar.ps1
```

## 📚 Conceitos que você vai praticar

- HTML semântico (header, main, section, article)
- CSS Grid e Flexbox para layout
- CSS variáveis, gradientes, box-shadow, transições
- JavaScript DOM manipulation (getElementById, createElement, addEventListener)
- setInterval para atualização em tempo real
- localStorage para persistência
- fetch() para API de clima (opcional)
- Template literals

## 🌍 Por que isso é real?

Dashboards estão em todo lugar: Google Home, widgets do iPhone, painéis de controle de fábricas. Você está aprendendo as mesmas tecnologias que o iGoogle, Notion, e todos os painéis admin usam.

---

> 🧑‍🏫 **Tá travado?** Leia o `DICAS.md`!
