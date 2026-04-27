# Metodologia

## 1. Fonte de Dados

Os dados utilizados foram obtidos a partir da CVM (Comissão de Valores Mobiliários), incluindo as seguintes demonstrações financeiras:

- Demonstração do Resultado do Exercício (DRE)  
- Demonstração do Fluxo de Caixa (DFC)  
- Balanço Patrimonial (Ativo e Passivo)  

Os dados referem-se ao período de 2021 a 2023.

---

## 2. Etapas do Projeto

O projeto foi estruturado em etapas sequenciais, seguindo uma lógica de pipeline de dados:

RAW → TRATAMENTO → CONSOLIDAÇÃO → ANÁLISE

---

## 3. Importação dos Dados

Os dados brutos foram importados para o PostgreSQL utilizando a ferramenta de Data Transfer do DBeaver.

Configurações utilizadas:

- Encoding: Windows-1252  
- Delimitador: ;  
- Arquivos com cabeçalho habilitado  

---

## 4. Tratamento dos Dados

Nesta etapa, os dados foram padronizados e preparados para análise.

Principais atividades:

- Seleção das empresas do setor varejista  
- Consolidação dos períodos (2021, 2022 e 2023)  
- Identificação e mapeamento das contas contábeis relevantes  
- Padronização da estrutura dos dados  
- Utilização de expressões CASE WHEN para agregação de métricas  

Foram criadas views intermediárias:

- dre_tratado  
- dfc_tratado  
- bp_tratado  

---

## 5. Consolidação dos Dados

Após o tratamento, os dados foram organizados em tabelas consolidadas, estruturadas para análise:

- dre_consolidado  
- dfc_consolidado  
- bp_consolidado  

Essa etapa garante consistência e padronização entre as diferentes demonstrações financeiras.

---

## 6. Integração das Demonstrações

As três demonstrações financeiras foram integradas para permitir análise conjunta:

- DRE: análise de desempenho (receita e lucro)  
- DFC: análise de geração de caixa  
- Balanço Patrimonial: análise de estrutura de capital  

---

## 7. Camada Analítica

Foi criada uma view final (`analise_final`) contendo os principais indicadores financeiros, incluindo:

- Margem líquida  
- Qualidade do lucro  
- Estrutura de capital (alavancagem)  
- Crescimento de receita  
- Crescimento de lucro  

Essa camada centraliza as informações necessárias para análise e interpretação dos dados.

---

## 8. Abordagem Analítica

A análise foi estruturada em três dimensões principais:

### Performance
Avaliação de receita, lucro e crescimento ao longo do tempo.

### Qualidade do Resultado
Comparação entre lucro contábil e geração de caixa, com foco na conversão de resultados em caixa.

### Estrutura e Risco
Análise do nível de endividamento e da sustentabilidade financeira das empresas.

---

## 9. Objetivo Analítico

O projeto busca avaliar se as empresas analisadas:

- Apresentam crescimento consistente ao longo do tempo  
- Convertem lucro contábil em geração de caixa  
- Possuem dependência relevante de endividamento  
- Demonstram sinais de deterioração financeira  
