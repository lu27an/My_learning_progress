# =============================================
# ANALISADOR DE DADOS AGRÍCOLAS
# CS50 — Week 6: Python
# =============================================
#
# Para rodar:  python analisador.py
# Para testar: powershell ./testar.ps1
# =============================================

import csv
import sys

# TODO 1: Crie a função para carregar os dados do CSV
# Recebe: nome do arquivo
# Retorna: lista de dicionários (cada dicionário = uma fazenda)
# Converta area_ha, producao_ton e custo_por_ha para float!
def carregar_dados(arquivo):
    pass  # Substitua por seu código


# TODO 2: Crie a função de resumo geral
# Mostra: total de fazendas, área total, produção total,
# produtividade média (produção/área), e lista de culturas únicas
def resumo_geral(fazendas):
    pass


# TODO 3: Crie a função de ranking de produtividade
# Ordena as fazendas por produtividade (produção/área) decrescente
# Mostra: posição, nome, cultura, produtividade
def ranking_produtividade(fazendas):
    pass


# TODO 4: Crie a função para filtrar por cultura
# Pergunta ao usuário qual cultura filtrar
# Mostra apenas as fazendas daquela cultura
def filtrar_por_cultura(fazendas):
    pass


# TODO 5: Crie a função de análise por região
# Agrupa as fazendas por região
# Para cada região mostra: quantidade de fazendas, área total, produção total
def analise_por_regiao(fazendas):
    pass


# TODO 6: Crie a função para encontrar fazenda mais/menos produtiva
# Usa max() e min() com key function
def extremos_produtividade(fazendas):
    pass


# TODO 7: Crie a função main com o menu
# Loop que mostra opções e chama a função correspondente
def main():
    # Carregar dados
    # Mostrar menu em loop
    # Chamar função correspondente à escolha
    pass


# TODO 8: Chame a função main
# Use: if __name__ == "__main__": main()
