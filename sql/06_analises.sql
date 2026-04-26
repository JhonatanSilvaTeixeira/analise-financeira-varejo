-- =========================================
-- CAMADA ANALÍTICA FINAL
-- Integra DRE + DFC + BP
-- =========================================

CREATE VIEW analise_final AS
SELECT 
    d.empresa,
    d.ano,

    -- DRE
    d.receita_liquida,
    d.lucro_liquido,

    ROUND(
        d.lucro_liquido / NULLIF(d.receita_liquida, 0),
    4) AS margem_liquida,

    -- DFC
    f.caixa_operacional,

    -- 🧠 Qualidade do lucro
    ROUND(
        f.caixa_operacional / NULLIF(d.lucro_liquido, 0),
    2) AS qualidade_lucro,

    -- BP
    b.ativo_total,
    b.passivo_total,
    b.patrimonio_liquido,

    -- 🏦 Estrutura de capital
    ROUND(
        b.passivo_total / NULLIF(b.patrimonio_liquido, 0),
    2) AS divida_patrimonio,

    -- 📈 Crescimento receita
    ROUND(
        (d.receita_liquida - LAG(d.receita_liquida) 
            OVER (PARTITION BY d.empresa ORDER BY d.ano))
        / NULLIF(
            LAG(d.receita_liquida) 
            OVER (PARTITION BY d.empresa ORDER BY d.ano),
        0),
    4) AS crescimento_receita,

    -- 📉 Crescimento lucro
    ROUND(
        (d.lucro_liquido - LAG(d.lucro_liquido) 
            OVER (PARTITION BY d.empresa ORDER BY d.ano))
        / NULLIF(
            LAG(d.lucro_liquido) 
            OVER (PARTITION BY d.empresa ORDER BY d.ano),
        0),
    4) AS crescimento_lucro

FROM dre_consolidado d

LEFT JOIN dfc_consolidado f
    ON d.empresa = f.empresa 
    AND d.ano = f.ano

LEFT JOIN bp_consolidado b
    ON d.empresa = b.empresa 
    AND d.ano = b.ano;



-- =========================================
-- 🔹 1. VISÃO GERAL
-- =========================================

SELECT *
FROM analise_final
ORDER BY empresa, ano;



-- =========================================
-- 🔹 2. PERFORMANCE (DRE)
-- Crescimento e rentabilidade
-- =========================================

SELECT 
    empresa,
    ano,
    receita_liquida,
    lucro_liquido,
    margem_liquida,
    crescimento_receita,
    crescimento_lucro
FROM analise_final
ORDER BY empresa, ano;



-- =========================================
-- 🔹 3. QUALIDADE DO LUCRO
-- Lucro vs geração de caixa
-- =========================================

SELECT 
    empresa,
    ano,
    lucro_liquido,
    caixa_operacional,
    qualidade_lucro
FROM analise_final
ORDER BY qualidade_lucro;



-- Empresas com problema de qualidade de lucro
SELECT *
FROM analise_final
WHERE qualidade_lucro < 0
ORDER BY qualidade_lucro;



-- =========================================
-- 🔹 4. EFICIÊNCIA DE CAIXA
-- Quanto do lucro vira caixa
-- =========================================

SELECT 
    empresa,
    ano,
    qualidade_lucro
FROM analise_final
ORDER BY qualidade_lucro DESC;



-- =========================================
-- 🔹 5. ESTRUTURA DE CAPITAL (RISCO)
-- =========================================

SELECT 
    empresa,
    ano,
    passivo_total,
    patrimonio_liquido,
    divida_patrimonio
FROM analise_final
ORDER BY divida_patrimonio DESC;



-- Empresas com alto risco financeiro
SELECT *
FROM analise_final
WHERE divida_patrimonio > 2
ORDER BY divida_patrimonio DESC;



-- =========================================
-- 🔹 6. CRESCIMENTO VS RISCO
-- Crescimento sustentável ou alavancado
-- =========================================

SELECT 
    empresa,
    ano,
    crescimento_receita,
    divida_patrimonio
FROM analise_final
ORDER BY crescimento_receita DESC;



-- Crescimento com alto risco (alerta)
SELECT *
FROM analise_final
WHERE crescimento_receita > 0
AND divida_patrimonio > 2;



-- =========================================
-- 🔹 7. RANKING DE MARGEM
-- =========================================

SELECT 
    empresa,
    ano,
    margem_liquida
FROM analise_final
ORDER BY margem_liquida DESC;