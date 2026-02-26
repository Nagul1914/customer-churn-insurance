-- ─────────────────────────────────────────────────────────────
-- Customer Churn Segmentation & Risk Analysis
-- Author: Nagul Meera Shaik | Data Analyst
-- ─────────────────────────────────────────────────────────────

-- 1. Churn rate by customer tenure bucket
WITH tenure_segments AS (
    SELECT
        customer_id,
        churn_flag,
        CASE
            WHEN tenure_months < 12  THEN '0-1 Year'
            WHEN tenure_months < 24  THEN '1-2 Years'
            WHEN tenure_months < 36  THEN '2-3 Years'
            ELSE '3+ Years'
        END AS tenure_bucket,
        annual_premium,
        claim_count_ytd,
        days_since_last_claim
    FROM insurance_customers
),
churn_by_tenure AS (
    SELECT
        tenure_bucket,
        COUNT(*)                                        AS total_customers,
        SUM(churn_flag)                                 AS churned_customers,
        ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2)   AS churn_rate_pct,
        AVG(annual_premium)                             AS avg_premium,
        AVG(claim_count_ytd)                            AS avg_claims
    FROM tenure_segments
    GROUP BY tenure_bucket
)
SELECT * FROM churn_by_tenure
ORDER BY churn_rate_pct DESC;

-- ─────────────────────────────────────────────────────────────
-- 2. High-risk customer identification (score >= 0.7)
-- ─────────────────────────────────────────────────────────────
WITH risk_flags AS (
    SELECT
        customer_id,
        annual_premium,
        tenure_months,
        claim_count_ytd,
        days_since_last_interaction,
        -- Risk scoring logic
        CASE WHEN claim_count_ytd >= 3                THEN 1 ELSE 0 END
      + CASE WHEN tenure_months BETWEEN 18 AND 36     THEN 1 ELSE 0 END
      + CASE WHEN days_since_last_interaction > 180   THEN 1 ELSE 0 END
      + CASE WHEN annual_premium > 2500               THEN 1 ELSE 0 END
        AS risk_score
    FROM insurance_customers
    WHERE churn_flag = 0  -- Active customers only
),
ranked AS (
    SELECT
        *,
        ROUND(CAST(risk_score AS FLOAT) / 4, 2) AS normalized_risk,
        ROW_NUMBER() OVER (ORDER BY risk_score DESC) AS risk_rank
    FROM risk_flags
)
SELECT
    customer_id,
    annual_premium,
    tenure_months,
    claim_count_ytd,
    risk_score,
    normalized_risk,
    CASE
        WHEN normalized_risk >= 0.75 THEN 'CRITICAL — Immediate outreach'
        WHEN normalized_risk >= 0.50 THEN 'HIGH — Schedule call'
        WHEN normalized_risk >= 0.25 THEN 'MEDIUM — Send offer'
        ELSE 'LOW — Monitor only'
    END AS recommended_action
FROM ranked
WHERE normalized_risk >= 0.50
ORDER BY normalized_risk DESC;
