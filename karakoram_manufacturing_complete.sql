-- =============================================
-- KARAKORAM MANUFACTURING LTD
-- "Assets decay, impacts endure let's valuate finite lifecycles"
-- Complete SQL Project — All Queries
-- IAS 16 | IAS 36 | IAS 7 | Ratios
-- =============================================

-- =============================================
-- PART 1: TABLES
-- =============================================

CREATE TABLE IF NOT EXISTS assets (
    asset_id            SERIAL PRIMARY KEY,
    asset_name          VARCHAR(100) NOT NULL,
    asset_class         VARCHAR(50),
    cost                NUMERIC(15,2),
    acquisition_date    DATE,
    useful_life_yrs     INT,
    residual_value      NUMERIC(15,2),
    status              VARCHAR(20) DEFAULT 'Active'
);

CREATE TABLE IF NOT EXISTS depreciation (
    dep_id              SERIAL PRIMARY KEY,
    asset_id            INT REFERENCES assets(asset_id),
    year                INT,
    depreciation_amt    NUMERIC(15,2),
    acc_depreciation    NUMERIC(15,2),
    carrying_amount     NUMERIC(15,2)
);

CREATE TABLE IF NOT EXISTS impairment (
    imp_id              SERIAL PRIMARY KEY,
    asset_id            INT REFERENCES assets(asset_id),
    year                INT,
    carrying_amount     NUMERIC(15,2),
    recoverable_amt     NUMERIC(15,2),
    impairment_loss     NUMERIC(15,2),
    status              VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS financials (
    fin_id              SERIAL PRIMARY KEY,
    year                INT,
    revenue             NUMERIC(15,2),
    cogs                NUMERIC(15,2),
    gross_profit        NUMERIC(15,2),
    operating_exp       NUMERIC(15,2),
    net_profit          NUMERIC(15,2),
    total_assets        NUMERIC(15,2),
    current_assets      NUMERIC(15,2),
    current_liab        NUMERIC(15,2),
    total_equity        NUMERIC(15,2),
    total_debt          NUMERIC(15,2)
);

CREATE TABLE IF NOT EXISTS cash_flows (
    cf_id                   SERIAL PRIMARY KEY,
    year                    INT,
    net_income              NUMERIC(15,2),
    depreciation_add_back   NUMERIC(15,2),
    impairment_add_back     NUMERIC(15,2),
    change_in_receivables   NUMERIC(15,2),
    change_in_inventory     NUMERIC(15,2),
    change_in_payables      NUMERIC(15,2),
    change_in_accrued_exp   NUMERIC(15,2),
    cf_operations           NUMERIC(15,2),
    capex                   NUMERIC(15,2),
    proceeds_asset_disposal NUMERIC(15,2),
    cf_investing            NUMERIC(15,2),
    loan_borrowed           NUMERIC(15,2),
    loan_repaid             NUMERIC(15,2),
    interest_paid           NUMERIC(15,2),
    dividend_paid           NUMERIC(15,2),
    equity_raised           NUMERIC(15,2),
    cf_financing            NUMERIC(15,2),
    net_change_in_cash      NUMERIC(15,2),
    opening_cash            NUMERIC(15,2),
    closing_cash            NUMERIC(15,2)
);

-- =============================================
-- PART 2: DATA
-- =============================================

INSERT INTO assets VALUES
(1,  'Factory Building',      'PPE - Building',   85000000, '2018-01-15', 30, 5000000,  'Active'),
(2,  'CNC Machine A',         'PPE - Machinery',  12000000, '2019-03-20', 10, 800000,   'Active'),
(3,  'CNC Machine B',         'PPE - Machinery',  14500000, '2020-06-01', 10, 900000,   'Active'),
(4,  'Delivery Truck 1',      'PPE - Vehicle',     3200000, '2019-07-10',  8, 200000,   'Active'),
(5,  'Delivery Truck 2',      'PPE - Vehicle',     3500000, '2021-02-28',  8, 200000,   'Active'),
(6,  'Office Equipment',      'PPE - Equipment',   1800000, '2020-09-01',  5, 100000,   'Active'),
(7,  'Warehouse Building',    'PPE - Building',   45000000, '2017-05-20', 30, 3000000,  'Active'),
(8,  'Old Cutting Machine',   'PPE - Machinery',   8000000, '2016-11-10', 10, 500000,   'Impaired'),
(9,  'Generator',             'PPE - Equipment',   2500000, '2021-08-15',  7, 150000,   'Active'),
(10, 'Land - Factory',        'PPE - Land',       60000000, '2015-01-01',  0, 60000000, 'Active');

INSERT INTO depreciation VALUES
(1,  1, 2022, 2666667, 10666667, 74333333),
(2,  1, 2023, 2666667, 13333333, 71666667),
(3,  1, 2024, 2666667, 16000000, 69000000),
(4,  2, 2022, 1120000,  3360000,  8640000),
(5,  2, 2023, 1120000,  4480000,  7520000),
(6,  2, 2024, 1120000,  5600000,  6400000),
(7,  3, 2022, 1360000,  2720000, 11780000),
(8,  3, 2023, 1360000,  4080000, 10420000),
(9,  3, 2024, 1360000,  5440000,  9060000),
(10, 4, 2022,  375000,  1125000,  2075000),
(11, 4, 2023,  375000,  1500000,  1700000),
(12, 4, 2024,  375000,  1875000,  1325000),
(13, 5, 2022,  412500,   412500,  3087500),
(14, 5, 2023,  412500,   825000,  2675000),
(15, 5, 2024,  412500,  1237500,  2262500),
(16, 6, 2022,  340000,   680000,  1120000),
(17, 6, 2023,  340000,  1020000,   780000),
(18, 6, 2024,  340000,  1360000,   440000),
(19, 7, 2022, 1400000,  8400000, 36600000),
(20, 7, 2023, 1400000,  9800000, 35200000),
(21, 7, 2024, 1400000, 11200000, 33800000),
(22, 8, 2022,  750000,  4500000,  3500000),
(23, 8, 2023,  750000,  5250000,  2750000),
(24, 8, 2024,  750000,  6000000,  2000000),
(25, 9, 2022,  335714,   335714,  2164286),
(26, 9, 2023,  335714,   671429,  1828571),
(27, 9, 2024,  335714,  1007143,  1492857);

INSERT INTO impairment VALUES
(1, 2, 2024,  6400000,  7200000,       0, 'No Impairment'),
(2, 3, 2024,  9060000,  9500000,       0, 'No Impairment'),
(3, 4, 2024,  1325000,  1100000,  225000, 'Impaired'),
(4, 8, 2022,  3500000,  1800000, 1700000, 'Impaired'),
(5, 8, 2023,  2750000,  1200000, 1550000, 'Impaired'),
(6, 8, 2024,  2000000,   800000, 1200000, 'Impaired'),
(7, 7, 2024, 33800000, 38000000,       0, 'No Impairment'),
(8, 1, 2024, 69000000, 72000000,       0, 'No Impairment');

INSERT INTO financials VALUES
(1, 2022, 285000000, 168000000, 117000000, 62000000, 55000000, 380000000,  95000000, 72000000, 185000000, 98000000),
(2, 2023, 312000000, 181000000, 131000000, 67000000, 64000000, 410000000, 108000000, 78000000, 198000000, 95000000),
(3, 2024, 348000000, 196000000, 152000000, 71000000, 81000000, 445000000, 124000000, 82000000, 220000000, 88000000);

INSERT INTO cash_flows VALUES
(1, 2022, 55000000, 9119595, 1700000, -8500000, -6200000, 5800000, 3200000,  60119595, -15000000, 2000000, -13000000, 12000000, -5000000,  -4200000, -3000000, 0,   -200000, 46919595,  15000000,  61919595),
(2, 2023, 64000000, 9119595, 1550000, -4200000, -3100000, 4500000, 2800000,  74669595, -12000000, 1500000, -10500000,       0,  -8000000, -3800000, -4000000, 0, -15800000, 48369595,  61919595, 110289190),
(3, 2024, 81000000, 9119595, 1425000, -3800000, -2500000, 3200000, 2100000,  90544595,  -8000000, 3000000,  -5000000,       0, -10000000, -3200000, -5000000, 0, -18200000, 67344595, 110289190, 177633785);

-- =============================================
-- PART 3: VERIFY
-- =============================================

SELECT 'assets'       AS table_name, COUNT(*) AS rows FROM assets
UNION ALL
SELECT 'depreciation', COUNT(*) FROM depreciation
UNION ALL
SELECT 'impairment',   COUNT(*) FROM impairment
UNION ALL
SELECT 'financials',   COUNT(*) FROM financials
UNION ALL
SELECT 'cash_flows',   COUNT(*) FROM cash_flows;

-- =============================================
-- PART 4: QUERIES
-- =============================================

-- Q1: All Assets
SELECT * FROM assets;

-- Q2: Active Assets Only
SELECT asset_name, asset_class, cost, status
FROM assets
WHERE status = 'Active';

-- Q3: Machinery Only
SELECT asset_name, cost, acquisition_date
FROM assets
WHERE asset_class = 'PPE - Machinery';

-- Q4: Total Cost by Class
SELECT asset_class,
       COUNT(*) AS total_assets,
       SUM(cost) AS total_cost
FROM assets
GROUP BY asset_class
ORDER BY total_cost DESC;

-- Q5: IAS 36 Impairment with Asset Names
SELECT a.asset_name,
       i.year,
       i.carrying_amount,
       i.recoverable_amt,
       i.impairment_loss,
       i.status
FROM impairment i
JOIN assets a ON i.asset_id = a.asset_id
ORDER BY i.impairment_loss DESC;

-- Q6: Current Ratio
SELECT year,
       current_assets,
       current_liab,
       ROUND(current_assets / current_liab, 2) AS current_ratio
FROM financials
ORDER BY year;

-- Q7: Net Profit Margin
SELECT year,
       revenue,
       net_profit,
       ROUND((net_profit / revenue) * 100, 2) || '%' AS net_margin
FROM financials
ORDER BY year;

-- Q8: ROA
SELECT year,
       net_profit,
       total_assets,
       ROUND((net_profit / total_assets) * 100, 2) || '%' AS roa
FROM financials
ORDER BY year;

-- Q9: Debt to Equity
SELECT year,
       total_debt,
       total_equity,
       ROUND(total_debt / total_equity, 2) AS debt_to_equity
FROM financials
ORDER BY year;

-- Q10: Gross Profit Margin
SELECT year,
       revenue,
       gross_profit,
       ROUND((gross_profit / revenue) * 100, 2) || '%' AS gross_margin
FROM financials
ORDER BY year;

-- Q11: IAS 16 Remaining Useful Life
SELECT asset_name,
       asset_class,
       useful_life_yrs,
       useful_life_yrs - (2024 - EXTRACT(YEAR FROM acquisition_date))
       AS remaining_life_yrs,
       status
FROM assets
WHERE useful_life_yrs > 0
ORDER BY remaining_life_yrs ASC;

-- Q12: 2024 Carrying Amounts
SELECT a.asset_name,
       a.cost,
       d.acc_depreciation,
       d.carrying_amount,
       ROUND((d.carrying_amount / a.cost) * 100, 1) || '%' AS book_value_pct
FROM assets a
JOIN depreciation d ON a.asset_id = d.asset_id
WHERE d.year = 2024
ORDER BY d.carrying_amount DESC;

-- Q13: IAS 36 Impairment Flag
SELECT a.asset_name,
       i.year,
       i.carrying_amount,
       i.recoverable_amt,
CASE
  WHEN i.carrying_amount > i.recoverable_amt
  THEN 'IMPAIRED - Write Down Required'
  ELSE 'Healthy - No Action'
END AS ias36_status
FROM impairment i
JOIN assets a ON i.asset_id = a.asset_id
ORDER BY i.year, i.impairment_loss DESC;

-- Q14: Replacement Flag
SELECT asset_name,
       useful_life_yrs - (2024 - EXTRACT(YEAR FROM acquisition_date))
       AS remaining_yrs,
CASE
  WHEN useful_life_yrs - (2024 - EXTRACT(YEAR FROM acquisition_date)) <= 1
  THEN 'Replace Immediately'
  WHEN useful_life_yrs - (2024 - EXTRACT(YEAR FROM acquisition_date)) <= 3
  THEN 'Plan Replacement'
  ELSE 'Good Condition'
END AS action_required
FROM assets
WHERE useful_life_yrs > 0
ORDER BY remaining_yrs ASC;

-- Q15: Asset Health VIEW
CREATE VIEW asset_health_summary AS
SELECT
    a.asset_name,
    a.asset_class,
    a.cost,
    d.carrying_amount,
    ROUND((d.carrying_amount / a.cost) * 100, 1) || '%' AS book_value_pct,
    useful_life_yrs - (2024 - EXTRACT(YEAR FROM acquisition_date))
    AS remaining_life_yrs,
    COALESCE(i.status, 'Not Reviewed') AS impairment_status,
    COALESCE(i.impairment_loss, 0) AS impairment_loss,
    a.status AS asset_status
FROM assets a
LEFT JOIN depreciation d ON a.asset_id = d.asset_id AND d.year = 2024
LEFT JOIN impairment i ON a.asset_id = i.asset_id AND i.year = 2024
WHERE a.useful_life_yrs > 0;

SELECT * FROM asset_health_summary
ORDER BY impairment_loss DESC;

-- Q16: IAS 7 Operating Activities
SELECT year,
       net_income,
       depreciation_add_back,
       impairment_add_back,
       change_in_receivables,
       change_in_inventory,
       change_in_payables,
       change_in_accrued_exp,
       cf_operations
FROM cash_flows
ORDER BY year;

-- Q17: IAS 7 Investing Activities
SELECT year,
       capex,
       proceeds_asset_disposal,
       cf_investing
FROM cash_flows
ORDER BY year;

-- Q18: IAS 7 Financing Activities
SELECT year,
       loan_borrowed,
       loan_repaid,
       interest_paid,
       dividend_paid,
       equity_raised,
       cf_financing
FROM cash_flows
ORDER BY year;

-- Q19: IAS 7 Complete Summary
SELECT year,
       cf_operations,
       cf_investing,
       cf_financing,
       net_change_in_cash,
       opening_cash,
       closing_cash
FROM cash_flows
ORDER BY year;

-- Q20: CF Quality Check
SELECT year,
       net_income,
       cf_operations,
       ROUND((cf_operations / net_income) * 100, 2) || '%' AS cf_to_income,
CASE
  WHEN cf_operations > net_income THEN 'High Quality Earnings'
  WHEN cf_operations > 0          THEN 'Acceptable'
  ELSE                                 'Cash Problem'
END AS earnings_quality
FROM cash_flows
ORDER BY year;

-- Q21: Working Capital Analysis
SELECT year,
       change_in_receivables,
       change_in_inventory,
       change_in_payables,
       change_in_accrued_exp,
       (change_in_receivables +
        change_in_inventory  +
        change_in_payables   +
        change_in_accrued_exp) AS total_wc_impact,
CASE
  WHEN (change_in_receivables +
        change_in_inventory  +
        change_in_payables   +
        change_in_accrued_exp) > 0
  THEN 'WC Releasing Cash'
  ELSE 'WC Consuming Cash'
END AS wc_flag
FROM cash_flows
ORDER BY year;

-- Q22: Financing Breakdown
SELECT year,
       loan_borrowed,
       loan_repaid,
       loan_borrowed + loan_repaid AS net_debt_movement,
       interest_paid,
       dividend_paid,
       cf_financing,
CASE
  WHEN ABS(loan_repaid) > loan_borrowed THEN 'Paying Down Debt'
  WHEN loan_borrowed > ABS(loan_repaid) THEN 'Taking On Debt'
  ELSE 'No Debt Movement'
END AS debt_strategy
FROM cash_flows
ORDER BY year;

-- Q23: Year on Year Comparison
SELECT
    f2.year,
    ROUND((f2.net_profit / f2.revenue) * 100, 2) AS npm_this_year,
    ROUND((f1.net_profit / f1.revenue) * 100, 2) AS npm_last_year,
    ROUND((f2.net_profit / f2.revenue) * 100, 2) -
    ROUND((f1.net_profit / f1.revenue) * 100, 2) AS npm_change,
CASE
  WHEN ROUND((f2.net_profit / f2.revenue) * 100, 2) >
       ROUND((f1.net_profit / f1.revenue) * 100, 2)
  THEN 'Improved'
  ELSE 'Declined'
END AS trend
FROM financials f1
JOIN financials f2 ON f2.year = f1.year + 1
ORDER BY f2.year;

-- Q24: All Ratios Combined
SELECT f.year,
       ROUND(f.current_assets / f.current_liab, 2) AS current_ratio,
       ROUND((f.current_assets * 0.65) / f.current_liab, 2) AS quick_ratio,
       ROUND((f.gross_profit / f.revenue) * 100, 2) AS gross_margin_pct,
       ROUND((f.net_profit / f.revenue) * 100, 2) AS net_margin_pct,
       ROUND((f.net_profit / f.total_assets) * 100, 2) AS roa_pct,
       ROUND((f.net_profit / f.total_equity) * 100, 2) AS roe_pct,
       ROUND(f.total_debt / f.total_equity, 2) AS debt_to_equity,
       ROUND(((f.gross_profit - f.operating_exp) /
             (f.total_equity + f.total_debt)) * 100, 2) AS roce_pct
FROM financials f
ORDER BY f.year;

-- Q25: Ratio Flags
SELECT year,
       ROUND(current_assets / current_liab, 2) AS current_ratio,
CASE
  WHEN ROUND(current_assets / current_liab, 2) >= 1.5 THEN 'Healthy'
  WHEN ROUND(current_assets / current_liab, 2) >= 1.0 THEN 'Monitor'
  ELSE 'Risk'
END AS liquidity_flag,
       ROUND((net_profit / revenue) * 100, 2) AS net_margin_pct,
CASE
  WHEN ROUND((net_profit / revenue) * 100, 2) >= 20 THEN 'Strong'
  WHEN ROUND((net_profit / revenue) * 100, 2) >= 10 THEN 'Acceptable'
  ELSE 'Weak'
END AS profitability_flag,
       ROUND(total_debt / total_equity, 2) AS debt_to_equity,
CASE
  WHEN ROUND(total_debt / total_equity, 2) <= 0.5 THEN 'Low Risk'
  WHEN ROUND(total_debt / total_equity, 2) <= 1.0 THEN 'Moderate'
  ELSE 'High Risk'
END AS leverage_flag
FROM financials
ORDER BY year;


-- Q26: Final Corporate Dashboard VIEW
CREATE VIEW corporate_dashboard AS
WITH ratios AS (
    SELECT year,
           ROUND(current_assets / current_liab, 2) AS current_ratio,
           ROUND((current_assets * 0.65) / current_liab, 2) AS quick_ratio,
           ROUND((gross_profit / revenue) * 100, 2) AS gross_margin_pct,
           ROUND((net_profit / revenue) * 100, 2) AS net_margin_pct,
           ROUND((net_profit / total_assets) * 100, 2) AS roa_pct,
           ROUND((net_profit / total_equity) * 100, 2) AS roe_pct,
           ROUND(total_debt / total_equity, 2) AS debt_to_equity,
           ROUND(((gross_profit - operating_exp) /
                 (total_equity + total_debt)) * 100, 2) AS roce_pct
    FROM financials
),
cf_data AS (
    SELECT year,
           cf_operations,
           cf_investing,
           cf_financing,
           interest_paid,
           dividend_paid,
           closing_cash
    FROM cash_flows
)
SELECT r.year,
       r.current_ratio,
       r.quick_ratio,
       r.gross_margin_pct,
       r.net_margin_pct,
       r.roa_pct,
       r.roe_pct,
       r.debt_to_equity,
       r.roce_pct,
       c.cf_operations,
       c.cf_investing,
       c.cf_financing,
       c.interest_paid,
       c.dividend_paid,
       c.closing_cash
FROM ratios r
JOIN cf_data c ON r.year = c.year
ORDER BY r.year;

SELECT * FROM corporate_dashboard;