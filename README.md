# Análise Financeira de Varejistas Brasileiras (2021–2023)

## Visão Geral

Este projeto foi desenvolvido com o objetivo de analisar o desempenho financeiro de grandes varejistas brasileiras a partir de dados públicos da CVM. Mais do que apenas organizar números, a ideia foi entender o que esses dados mostram sobre o comportamento das empresas ao longo do tempo.

A análise foi estruturada em três dimensões principais:

* desempenho operacional (receita, lucro e crescimento)
* geração de caixa (se o lucro se converte em dinheiro de fato)
* estrutura de capital (nível de endividamento e risco)

Além disso, o projeto também buscou responder uma pergunta mais específica:

**Seria possível identificar sinais de deterioração financeira antes de eventos relevantes?**

Para isso, foi dado um foco maior ao caso da Americanas, analisando se os indicadores já apresentavam sinais de alerta antes da crise enfrentada pela companhia.

---

## Empresas Analisadas

* Americanas S.A.
* Grupo Casas Bahia S.A.
* Lojas Renner S.A.
* Magazine Luiza S.A.

---

## Estrutura do Projeto

Os dados foram organizados seguindo uma lógica de pipeline:

**RAW → TRATAMENTO → CONSOLIDAÇÃO → ANÁLISE**

### Organização das pastas

```
projeto/
│
├── data/
│   └── raw/    # Dados brutos baixados no site da CVM (CSV)
│   └── processed/    # Dados tratados/exportados (CSV)
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_tratamento_dre.sql
│   ├── 03_tratamento_dfc.sql
│   ├── 04_tratamento_bp.sql
│   ├── 05_consolidacao.sql
│   └── 06_analises.sql
│
├── docs/
│   ├── analises.md
│   ├── dicionario_dados.md
│   └── metodologia.md
│
└── README.md
```
   
---

## Importação

Os dados brutos (raw) foram importados diretamente no banco de dados utilizando a ferramenta de Data Transfer do DBeaver, sem utilização de scripts SQL para ingestão.

### Configurações utilizadas:

* Encoding: Windows-1252
* Delimitador: ;
* Arquivos com cabeçalho

Essa abordagem foi adotada para simplificar a etapa de ingestão e manter o foco no tratamento e na análise dos dados.

---

## Fonte de Dados

Os dados utilizados são públicos e foram extraídos da CVM, incluindo:

* Demonstração do Resultado (DRE)
* Demonstração do Fluxo de Caixa (DFC)
* Balanço Patrimonial (Ativo e Passivo)

Por limitações de tamanho e boas práticas de versionamento, os arquivos brutos não estão incluídos neste repositório.

### Fonte dos dados:
- CVM – Dados Abertos: https://www.gov.br/cvm/pt-br/assuntos/dados-abertos

### Como reproduzir o projeto:
1. Baixar os arquivos diretamente da fonte oficial da CVM
2. Inserir na pasta `/data_raw`
3. Executar os scripts SQL na ordem definida na pasta `/sql`

---

## Como o projeto foi construído

### 1. Tratamento

Os dados brutos foram organizados em views, com alguns cuidados principais:

* filtragem das empresas analisadas
* união dos anos (2021, 2022 e 2023)
* identificação das contas relevantes
* padronização das informações

**Views criadas:**

* dre_tratado
* dfc_tratado
* bp_tratado

---

### 2. Consolidação

Após o tratamento, os dados foram estruturados em tabelas finais:

* dre_consolidado
* dfc_consolidado
* bp_consolidado
* indicadores_financeiros

Essa etapa transforma os dados em uma base pronta para análise.

---

### 3. Camada Analítica

Foi criada uma view chamada **analise_final**, que integra:

* DRE (resultado)
* DFC (caixa)
* BP (estrutura)

É nessa camada que os indicadores são calculados e as análises são realizadas.

---

## Principais Indicadores

A análise foi organizada em três blocos:

### Performance

* receita líquida
* lucro líquido
* margem líquida
* crescimento ao longo do tempo

### Qualidade do lucro

* relação entre caixa operacional e lucro líquido
* capacidade de conversão do lucro em caixa

### Estrutura e risco

* relação entre dívida e patrimônio
* evolução do nível de endividamento

---

## O que a análise busca responder

O projeto foi orientado por algumas perguntas principais:

* a empresa está crescendo de forma consistente?
* o lucro é acompanhado por geração de caixa?
* existe dependência de dívida para sustentar o crescimento?
* há sinais de deterioração ao longo do tempo?

De forma mais específica:

* seria possível identificar sinais de alerta antes de uma crise?

---

## Análise específica: caso Americanas

O projeto dedica uma atenção especial à Americanas, considerando o contexto recente da companhia.

A análise observa:

* evolução do lucro
* comportamento do caixa operacional
* deterioração do patrimônio líquido
* aumento do risco financeiro

O objetivo não é explicar o evento em si, mas avaliar se os dados já indicavam algum desalinhamento antes dele se tornar evidente.

---

## Tecnologias utilizadas

* PostgreSQL
* DBeaver
* SQL

---

## Documentação

Mais detalhes podem ser encontrados em:

* docs/dicionario_dados.md
* docs/metodologia.md

---

## Considerações finais

Este projeto foi desenvolvido com foco em prática e clareza: organizar dados reais, estruturar uma análise consistente e extrair interpretações que façam sentido.

Mais do que calcular indicadores, a proposta foi usar os dados para entender comportamento, identificar padrões e levantar possíveis sinais de risco ao longo do tempo.
