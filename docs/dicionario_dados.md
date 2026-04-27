# Dicionário de Dados

## Padrões Gerais

- Unidade monetária: valores expressos em milhares de reais (R$ mil), conforme padrão da CVM  
- Granularidade: dados agregados por empresa e ano  
- Chave lógica: (empresa, ano)  

---

## Tabela: dre_consolidado

**Descrição:**  
Contém informações consolidadas da Demonstração do Resultado (DRE) por empresa e período.

**Chave lógica:** (empresa, ano)

| Coluna           | Tipo     | Descrição |
|------------------|---------|----------|
| empresa          | TEXT    | Nome da empresa |
| ano              | INTEGER | Ano de referência |
| receita_liquida  | NUMERIC | Receita líquida consolidada |
| lucro_liquido    | NUMERIC | Lucro ou prejuízo do período |

---

## Tabela: dfc_consolidado

**Descrição:**  
Contém informações consolidadas da Demonstração do Fluxo de Caixa (DFC), com foco na geração de caixa operacional.

**Chave lógica:** (empresa, ano)

| Coluna             | Tipo     | Descrição |
|--------------------|---------|----------|
| empresa            | TEXT    | Nome da empresa |
| ano                | INTEGER | Ano de referência |
| caixa_operacional  | NUMERIC | Caixa líquido gerado pelas atividades operacionais |

---

## Tabela: bp_consolidado

**Descrição:**  
Contém informações consolidadas do Balanço Patrimonial, incluindo ativos, passivos e patrimônio líquido.

**Chave lógica:** (empresa, ano)

| Coluna               | Tipo     | Descrição |
|----------------------|---------|----------|
| empresa              | TEXT    | Nome da empresa |
| ano                  | INTEGER | Ano de referência |
| ativo_total          | NUMERIC | Total de ativos |
| passivo_total        | NUMERIC | Total de passivos |
| patrimonio_liquido   | NUMERIC | Patrimônio líquido |

---

## Tabela: indicadores_financeiros

**Descrição:**  
Tabela derivada contendo os principais indicadores financeiros calculados a partir das demonstrações contábeis.

**Chave lógica:** (empresa, ano)

| Coluna             | Tipo     | Descrição |
|--------------------|---------|----------|
| empresa            | TEXT    | Nome da empresa |
| ano                | INTEGER | Ano de referência |
| receita_liquida    | NUMERIC | Receita líquida |
| lucro_liquido      | NUMERIC | Lucro líquido |
| margem_liquida     | NUMERIC | Relação entre lucro líquido e receita líquida, indicando rentabilidade |
| caixa_operacional  | NUMERIC | Caixa gerado pelas atividades operacionais |

---

## View: analise_final

**Descrição:**  
View analítica que integra dados de resultado, fluxo de caixa e estrutura patrimonial, permitindo análise conjunta dos principais indicadores financeiros.

| Coluna                | Descrição |
|----------------------|----------|
| margem_liquida        | Indicador de rentabilidade (lucro líquido / receita líquida) |
| qualidade_lucro       | Relação entre caixa operacional e lucro líquido, indicando capacidade de conversão do lucro em caixa |
| divida_patrimonio     | Relação entre passivo total e patrimônio líquido, indicando nível de alavancagem |
| crescimento_receita   | Variação percentual da receita líquida em relação ao período anterior |
| crescimento_lucro     | Variação percentual do lucro líquido em relação ao período anterior |

---

## Observações

- Os indicadores foram calculados com base nos dados consolidados das demonstrações financeiras  
- A análise considera apenas as empresas selecionadas no escopo do projeto  
- Eventuais valores negativos podem impactar a interpretação de indicadores como margem e qualidade do lucro  
