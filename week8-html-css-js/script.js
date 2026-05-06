// =============================================
// DASHBOARD PESSOAL — JavaScript
// CS50 — Week 8: HTML, CSS, JavaScript
// =============================================

// TODO 1: Relógio em tempo real
// Crie uma função que:
// - Pega a hora atual com new Date()
// - Formata como HH:MM:SS
// - Atualiza o elemento #relogio
// - Use setInterval para chamar a cada 1000ms


// TODO 2: Saudação dinâmica
// - Antes das 12h: "Bom dia"
// - 12h-18h: "Boa tarde"
// - Depois das 18h: "Boa noite"
// - Atualize o texto do h1


// TODO 3: Data por extenso
// Mostre: "Segunda-feira, 5 de Maio de 2026"
// Dica: use arrays com nomes dos dias e meses em português


// TODO 4: Sistema de tarefas
// Funções necessárias:
// - carregarTarefas(): lê do localStorage e renderiza na lista
// - adicionarTarefa(): pega texto do input, cria tarefa, salva
// - completarTarefa(index): marca/desmarca como feita
// - removerTarefa(index): remove da lista
// - salvarTarefas(): salva array no localStorage como JSON
//
// Cada tarefa é um objeto: { texto: "...", feita: false }
// Use JSON.stringify para salvar e JSON.parse para carregar


// TODO 5: Citações motivacionais
// Crie um array com pelo menos 10 citações:
// { texto: "A frase...", autor: "Fulano" }
// Ao carregar a página, escolha uma aleatória e exiba


// TODO 6: Clima (OPCIONAL — use dados mock se preferir)
// Se quiser usar API real: https://wttr.in/SuaCidade?format=j1
// Ou crie dados fixos para exibir


// TODO 7: Event listeners
// Quando a página carregar (DOMContentLoaded):
// - Inicie o relógio
// - Atualize a saudação e data
// - Carregue as tarefas
// - Mostre uma citação
// - Adicione listener no botão de adicionar tarefa
// - Adicione listener no input (Enter para adicionar)
