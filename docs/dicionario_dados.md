# Dicionário de Dados

## Tabela: dre_consolidado

| Coluna            | Tipo    | Descrição |
|------------------|--------|----------|
| empresa          | TEXT   | Nome da empresa |
| ano              | DATE   | Data de referência (fim do exercício) |
| receita_liquida  | NUMERIC| Receita líquida consolidada |
| lucro_liquido    | NUMERIC| Lucro ou prejuízo do período |

---

## Tabela: dfc_consolidado

| Coluna            | Tipo    | Descrição |
|------------------|--------|----------|
| empresa          | TEXT   | Nome da empresa |
| ano              | DATE   | Data de referência |
| caixa_operacional| NUMERIC| Caixa líquido gerado pelas atividades operacionais |

---

## Tabela: bp_consolidado

| Coluna               | Tipo    | Descrição |
|---------------------|--------|----------|
| empresa             | TEXT   | Nome da empresa |
| ano                 | DATE   | Data de referência |
| ativo_total         | NUMERIC| Total de ativos |
| passivo_total       | NUMERIC| Total de passivos |
| patrimonio_liquido  | NUMERIC| Patrimônio líquido |

---

## Tabela: indicadores_financeiros

| Coluna            | Tipo    | Descrição |
|------------------|--------|----------|
| empresa          | TEXT   | Nome da empresa |
| ano              | DATE   | Data de referência |
| receita_liquida  | NUMERIC| Receita líquida |
| lucro_liquido    | NUMERIC| Lucro líquido |
| margem_liquida   | NUMERIC| Lucro líquido / Receita líquida |
| caixa_operacional| NUMERIC| Caixa operacional |

---

## View: analise_final

| Coluna                | Descrição |
|----------------------|----------|
| margem_liquida        | Rentabilidade da empresa |
| qualidade_lucro       | Caixa operacional / lucro líquido |
| divida_patrimonio     | Passivo total / patrimônio líquido |
| crescimento_receita   | Variação da receita ano a ano |
| crescimento_lucro     | Variação do lucro ano a ano |

---

## Observações

- Valores monetários estão em milhares ou milhões conforme escala da CVM
- Os dados foram agregados por empresa e período