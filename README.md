# Análise Financeira de Varejistas Brasileiras (2021–2023)

## 1. Contexto

Em 2023, o mercado brasileiro foi impactado pelo caso da Americanas S.A., envolvendo inconsistências contábeis relevantes e deterioração financeira significativa.

Este projeto investiga se indicadores financeiros públicos seriam capazes de sinalizar deterioração financeira antes de eventos críticos, utilizando dados de empresas do setor varejista.

---

## 2. Objetivo

Analisar o desempenho financeiro de grandes varejistas brasileiras, com foco na identificação de sinais de deterioração a partir de indicadores contábeis e financeiros.

---

## 3. Empresas Analisadas

* Americanas S.A.
* Grupo Casas Bahia S.A.
* Lojas Renner S.A.
* Magazine Luiza S.A.

---

## 4. Base de Dados

Os dados utilizados são públicos e foram extraídos da CVM (Comissão de Valores Mobiliários), incluindo:

* Demonstração do Resultado (DRE)
* Demonstração do Fluxo de Caixa (DFC)
* Balanço Patrimonial

Devido ao volume dos arquivos, os dados brutos não estão versionados neste repositório.

Para reprodução do projeto, os dados podem ser obtidos diretamente na fonte oficial:

[https://www.gov.br/cvm/pt-br/assuntos/dados-abertos](https://dados.cvm.gov.br/dataset/cia_aberta-doc-dfp)

---

## 5. Metodologia

A análise foi conduzida utilizando SQL em ambiente PostgreSQL.

O projeto segue uma estrutura em pipeline:

RAW → TRATAMENTO → CONSOLIDAÇÃO → ANÁLISE

### Principais etapas

* Tratamento e padronização dos dados
* Construção de indicadores financeiros
* Consolidação das informações em tabelas analíticas
* Análise comparativa entre empresas e ao longo do tempo

---

## 6. Indicadores Analisados

### Performance

* Receita líquida
* Lucro líquido
* Margem líquida
* Crescimento

### Qualidade do lucro

* Relação entre caixa operacional e lucro líquido

### Estrutura e risco

* Relação entre dívida e patrimônio
* Evolução do endividamento

---

## 7. Principais Análises

O projeto busca responder às seguintes questões:

* As empresas apresentam crescimento consistente?
* O lucro é acompanhado por geração de caixa?
* Existe dependência de endividamento?
* Há sinais de deterioração ao longo do tempo?

Adicionalmente:

* Seria possível identificar sinais de alerta antes de uma crise financeira?

---

## 8. Caso de Estudo: Americanas S.A.

Foi realizada uma análise específica considerando:

* Evolução do lucro
* Comportamento do caixa operacional
* Deterioração do patrimônio líquido
* Aumento do risco financeiro

O objetivo é avaliar se os dados indicavam desalinhamentos antes do evento se tornar evidente.

---

## 9. Estrutura do Projeto

```
projeto/
│
├── data/
│   ├── raw/
│   └── processed/
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
│   ├── metodologia.md
│   └── dicionario_dados.md
│
└── README.md
```

---

## 10. Tecnologias Utilizadas

* PostgreSQL
* SQL
* DBeaver
* Visual Studio Code

---

## 11. Documentação

As análises detalhadas, consultas e explicações completas estão disponíveis na pasta `/docs`.

---

## 12. Considerações Finais

Este projeto foi desenvolvido com foco na organização de dados financeiros, construção de indicadores e análise crítica de desempenho.

Os resultados sugerem que a identificação de sinais de deterioração financeira depende da análise conjunta de múltiplos indicadores, não sendo evidente quando observados de forma isolada.

