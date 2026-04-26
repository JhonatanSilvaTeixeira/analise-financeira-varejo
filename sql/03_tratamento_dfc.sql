-- =========================================
-- DFC TRATADO
-- =========================================

CREATE VIEW dfc_tratado AS

WITH empresas_filtradas AS (
    SELECT UNNEST(ARRAY[
        '%americanas%',
        '%renner%',
        '%magazine%',
        '%casas bahia%'
    ]) AS filtro
),

dfc_base AS (
    SELECT * FROM dfc_raw_2021
    UNION ALL
    SELECT * FROM dfc_raw_2022
    UNION ALL
    SELECT * FROM dfc_raw_2023
)

SELECT 
    denom_cia AS empresa,
    dt_refer AS ano,

    ROUND(
        SUM(
            CASE 
                WHEN ds_conta ILIKE '%caixa%' 
                 AND ds_conta ILIKE '%operacionais%' 
                THEN vl_conta
                ELSE 0
            END
        ), 2
    ) AS caixa_operacional

FROM dfc_base d
WHERE EXISTS (
    SELECT 1 
    FROM empresas_filtradas e
    WHERE d.denom_cia ILIKE e.filtro
)
GROUP BY denom_cia, dt_refer;