-- =========================================
-- CONSOLIDAÇÃO FINAL
-- =========================================

-- DRE
INSERT INTO dre_consolidado
SELECT * FROM dre_tratado;

-- DFC
INSERT INTO dfc_consolidado
SELECT * FROM dfc_tratado;

-- BP
INSERT INTO bp_consolidado
SELECT * FROM bp_tratado;

-- INDICADORES
INSERT INTO indicadores_financeiros
SELECT 
    d.empresa,
    d.ano,
    d.receita_liquida,
    d.lucro_liquido,

    ROUND(
        d.lucro_liquido / NULLIF(d.receita_liquida, 0),
    4) AS margem_liquida,

    f.caixa_operacional

FROM dre_consolidado d
LEFT JOIN dfc_consolidado f
    ON d.empresa = f.empresa 
    AND d.ano = f.ano;