-- =========================================
-- DRE TRATADO
-- =========================================

CREATE VIEW dre_tratado AS

WITH empresas_filtradas AS (
    SELECT UNNEST(ARRAY[
        '%americanas%',
        '%renner%',
        '%magazine%',
        '%casas bahia%'
    ]) AS filtro
),

dre_base AS (
    SELECT * FROM dre_raw_2021
    UNION ALL
    SELECT * FROM dre_raw_2022
    UNION ALL
    SELECT * FROM dre_raw_2023
)

SELECT 
    denom_cia AS empresa,
    dt_refer AS ano,

    ROUND(
        SUM(
            CASE 
                WHEN ds_conta ILIKE '%receita de venda%' THEN vl_conta
                WHEN ds_conta ILIKE '%receita líquida%' 
                     AND ds_conta NOT ILIKE '%financeira%' THEN vl_conta
                ELSE 0
            END
        ), 2
    ) AS receita_liquida,

    ROUND(
        SUM(
            CASE 
                WHEN ds_conta ILIKE '%lucro%' 
                 AND ds_conta ILIKE '%período%' THEN vl_conta
                ELSE 0
            END
        ), 2
    ) AS lucro_liquido

FROM dre_base d
WHERE EXISTS (
    SELECT 1 
    FROM empresas_filtradas e
    WHERE d.denom_cia ILIKE e.filtro
)
GROUP BY denom_cia, dt_refer;