-- =============================================
-- CRIAR BANCO — Inventário de Fazenda
-- CS50 — Week 7: SQL
-- =============================================
--
-- Para executar: sqlite3 fazenda.db < criar_banco.sql
-- =============================================

-- TODO 1: Crie a tabela 'fazendas'
-- Colunas: id (INTEGER PRIMARY KEY), nome (TEXT), regiao (TEXT), area_total_ha (REAL)


-- TODO 2: Crie a tabela 'talhoes'
-- Colunas: id, fazenda_id (FK), nome, area_ha, tipo_solo
-- Lembre-se: FOREIGN KEY (fazenda_id) REFERENCES fazendas(id)


-- TODO 3: Crie a tabela 'culturas'
-- Colunas: id, nome, ciclo_dias (INTEGER), preco_ton (REAL)


-- TODO 4: Crie a tabela 'plantios'
-- Colunas: id, talhao_id (FK), cultura_id (FK), data_plantio (TEXT),
--          data_colheita (TEXT, pode ser NULL), producao_ton (REAL)


-- TODO 5: Crie a tabela 'insumos'
-- Colunas: id, nome, tipo (TEXT: 'fertilizante', 'defensivo', 'semente'),
--          preco_unitario (REAL)


-- TODO 6: Crie a tabela 'aplicacoes'
-- Colunas: id, plantio_id (FK), insumo_id (FK), quantidade (REAL),
--          data_aplicacao (TEXT)


-- =============================================
-- DADOS DE EXEMPLO
-- =============================================

-- TODO 7: Insira pelo menos 3 fazendas
-- INSERT INTO fazendas (nome, regiao, area_total_ha) VALUES (...);


-- TODO 8: Insira pelo menos 6 talhões (2 por fazenda)


-- TODO 9: Insira pelo menos 4 culturas (Soja, Milho, Algodão, Café)


-- TODO 10: Insira pelo menos 8 plantios


-- TODO 11: Insira pelo menos 4 insumos


-- TODO 12: Insira pelo menos 6 aplicações de insumo
