-- =========================================
-- BP TRATADO
-- =========================================

CREATE OR REPLACE VIEW bp_tratado AS

WITH empresas_filtradas AS (
    SELECT UNNEST(ARRAY[
        '%americanas%',
        '%renner%',
        '%magazine%',
        '%casas bahia%'
    ]) AS filtro
),

bpa_base AS (
    SELECT * FROM bpa_raw_2021
    UNION ALL
    SELECT * FROM bpa_raw_2022
    UNION ALL
    SELECT * FROM bpa_raw_2023
),

bpp_base AS (
    SELECT * FROM bpp_raw_2021
    UNION ALL
    SELECT * FROM bpp_raw_2022
    UNION ALL
    SELECT * FROM bpp_raw_2023
),

ativo AS (
    SELECT 
        denom_cia AS empresa,
        dt_refer AS ano,
        SUM(
            CASE 
                WHEN ds_conta ILIKE '%ativo total%' THEN vl_conta
                ELSE 0
            END
        ) AS ativo_total
    FROM bpa_base b
    WHERE EXISTS (
        SELECT 1 
        FROM empresas_filtradas e
        WHERE b.denom_cia ILIKE e.filtro
    )
    GROUP BY denom_cia, dt_refer
),

passivo AS (
    SELECT 
        denom_cia AS empresa,
        dt_refer AS ano,

        SUM(
            CASE 
                WHEN ds_conta ILIKE '%passivo total%' THEN vl_conta
                ELSE 0
            END
        ) AS passivo_total,

        SUM(
            CASE 
                WHEN ds_conta ILIKE '%patrim%líquido%' THEN vl_conta
                ELSE 0
            END
        ) AS patrimonio_liquido

    FROM bpp_base b
    WHERE EXISTS (
        SELECT 1 
        FROM empresas_filtradas e
        WHERE b.denom_cia ILIKE e.filtro
    )
    GROUP BY denom_cia, dt_refer
)

SELECT 
    a.empresa,
    a.ano,
    ROUND(a.ativo_total, 2) AS ativo_total,
    ROUND(p.passivo_total, 2) AS passivo_total,
    ROUND(p.patrimonio_liquido, 2) AS patrimonio_liquido
FROM ativo a
LEFT JOIN passivo p
    ON a.empresa = p.empresa
    AND a.ano = p.ano;