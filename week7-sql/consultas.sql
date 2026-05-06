-- =============================================
-- CONSULTAS — Inventário de Fazenda
-- CS50 — Week 7: SQL
-- =============================================
--
-- Para executar: sqlite3 fazenda.db < consultas.sql
-- =============================================

-- Q1: Listar todas as fazendas com sua área total
-- TODO: SELECT ...


-- Q2: Quantos talhões cada fazenda tem?
-- Dica: use JOIN + GROUP BY + COUNT()
-- TODO: SELECT ...


-- Q3: Qual a produção total por cultura?
-- Dica: JOIN plantios com culturas, GROUP BY cultura
-- TODO: SELECT ...


-- Q4: Qual o talhão mais produtivo? (produção/área)
-- Dica: JOIN talhoes com plantios, calcule SUM(producao) / area
-- TODO: SELECT ...


-- Q5: Quanto foi gasto em insumos por plantio?
-- Dica: JOIN aplicacoes com insumos, SUM(quantidade * preco_unitario)
-- TODO: SELECT ...


-- Q6: Quais fazendas estão na região Centro-Oeste?
-- TODO: SELECT ...


-- Q7: Qual a receita estimada por fazenda? (produção × preço por tonelada)
-- Dica: precisa de JOIN com 4 tabelas! fazendas → talhoes → plantios → culturas
-- TODO: SELECT ...


-- Q8: Quais plantios ainda não foram colhidos?
-- Dica: WHERE data_colheita IS NULL
-- TODO: SELECT ...


-- Q9: Ranking de fazendas por lucro estimado (receita - custo de insumos)
-- Dica: esta é a mais difícil! Use subqueries ou CTEs (WITH ... AS)
-- TODO: SELECT ...


-- Q10: Média de produtividade por tipo de solo
-- Dica: JOIN talhoes com plantios, GROUP BY tipo_solo
-- TODO: SELECT ...
