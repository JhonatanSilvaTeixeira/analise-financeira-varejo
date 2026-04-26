# Metodologia do Projeto

## Fonte de Dados

Os dados foram obtidos a partir da CVM (Comissão de Valores Mobiliários), incluindo:

- DRE (Demonstração do Resultado)
- DFC (Fluxo de Caixa)
- BPA (Ativo)
- BPP (Passivo)

---

## Etapas do Projeto

### 1. Importação

Os dados foram importados via DBeaver (Data Transfer), com as seguintes configurações:

- Encoding: Windows-1252  
- Delimitador: `;`  
- Header: habilitado  

---

### 2. Tratamento dos Dados

Foi realizada a padronização e filtragem dos dados:

- Seleção de empresas do setor varejista
- União dos anos (2021, 2022, 2023)
- Identificação de contas contábeis relevantes
- Uso de `CASE WHEN` para agregação de métricas

---

### 3. Consolidação

Os dados tratados foram inseridos em tabelas consolidadas:

- `dre_consolidado`
- `dfc_consolidado`
- `bp_consolidado`

---

### 4. Integração dos Dados

As três demonstrações financeiras foram integradas:

- DRE → performance
- DFC → geração de caixa
- BP → estrutura patrimonial

---

### 5. Camada Analítica

Foi criada uma view final (`analise_final`) contendo indicadores como:

- Margem líquida
- Qualidade do lucro
- Estrutura de capital
- Crescimento de receita e lucro

---

## Abordagem Analítica

O projeto foi estruturado em três blocos:

### Performance
Avaliação de receita, lucro e crescimento

### Qualidade do Resultado
Comparação entre lucro contábil e geração de caixa

### Estrutura e Risco
Análise da alavancagem financeira e sustentabilidade

---

## Objetivo Final

Avaliar se as empresas:

- Crescem de forma sustentável  
- Convertem lucro em caixa  
- Apresentam risco financeiro elevado  