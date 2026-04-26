
-- =========================================
-- CAMADA RAW (DADOS BRUTOS CVM)
-- =========================================

-- DRE
CREATE TABLE dre_raw_2021 (
    cnpj_cia TEXT,
    dt_refer DATE,
    versao INTEGER,
    denom_cia TEXT,
    cd_cvm INTEGER,
    grupo_dfp TEXT,
    moeda TEXT,
    escala_moeda TEXT,
    ordem_exerc TEXT,
    dt_ini_exerc DATE,
    dt_fim_exerc DATE,
    cd_conta TEXT,
    ds_conta TEXT,
    vl_conta NUMERIC,
    st_conta_fixa TEXT
);

CREATE TABLE dre_raw_2022 (LIKE dre_raw_2021);
CREATE TABLE dre_raw_2023 (LIKE dre_raw_2021);


-- DFC
CREATE TABLE dfc_raw_2021 (
    cnpj_cia TEXT,
    dt_refer DATE,
    versao INTEGER,
    denom_cia TEXT,
    cd_cvm INTEGER,
    grupo_dfp TEXT,
    moeda TEXT,
    escala_moeda TEXT,
    ordem_exerc TEXT,
    dt_ini_exerc DATE,
    dt_fim_exerc DATE,
    cd_conta TEXT,
    ds_conta TEXT,
    vl_conta NUMERIC,
    st_conta_fixa TEXT
);

CREATE TABLE dfc_raw_2022 (LIKE dfc_raw_2021);
CREATE TABLE dfc_raw_2023 (LIKE dfc_raw_2021);


-- BPA (Ativo)
CREATE TABLE bpa_raw_2021 (
    cnpj_cia TEXT,
    dt_refer DATE,
    versao INTEGER,
    denom_cia TEXT,
    cd_cvm INTEGER,
    grupo_dfp TEXT,
    moeda TEXT,
    escala_moeda TEXT,
    ordem_exerc TEXT,
    dt_fim_exerc DATE,
    cd_conta TEXT,
    ds_conta TEXT,
    vl_conta NUMERIC(18,2),
    st_conta_fixa TEXT
);

CREATE TABLE bpa_raw_2022 (LIKE bpa_raw_2021);
CREATE TABLE bpa_raw_2023 (LIKE bpa_raw_2021);


-- BPP (Passivo)
CREATE TABLE bpp_raw_2021 (LIKE bpa_raw_2021);
CREATE TABLE bpp_raw_2022 (LIKE bpa_raw_2021);
CREATE TABLE bpp_raw_2023 (LIKE bpa_raw_2021);


-- =========================================
-- CAMADA TRATADA (CONSOLIDADO)
-- =========================================

CREATE TABLE dre_consolidado (
    empresa TEXT,
    ano DATE,
    receita_liquida NUMERIC,
    lucro_liquido NUMERIC
);


CREATE TABLE dfc_consolidado (
    empresa TEXT,
    ano DATE,
    caixa_operacional NUMERIC
);


CREATE TABLE bp_consolidado (
    empresa TEXT,
    ano DATE,
    ativo_total NUMERIC,
    passivo_total NUMERIC,
    patrimonio_liquido numeric
    );


-- =========================================
-- CAMADA ANALÍTICA
-- =========================================

CREATE TABLE indicadores_financeiros (
    empresa TEXT,
    ano DATE,
    receita_liquida NUMERIC(18,2),
    lucro_liquido NUMERIC(18,2),
    margem_liquida NUMERIC(10,4),
    caixa_operacional NUMERIC(18,2),
    CONSTRAINT uq_indicadores UNIQUE (empresa, ano)
);

