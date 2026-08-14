# Karakoram Manufacturing Ltd
## Financial Intelligence Database

> *"Assets decay, impacts endure — 
> let's valuate finite lifecycles"*

---

## Project Overview

A PostgreSQL database modelling the complete 
financial reporting structure of a dummy Pakistani 
manufacturing company — built using IAS standards.

## Standards Applied

| Standard | Coverage |
|----------|----------|
| IAS 16 | PPE, Depreciation, Remaining Useful Life |
| IAS 36 | Impairment Testing & Loss Recognition |
| IAS 7  | Cash Flow Statement (Indirect Method) |

## SQL Concepts Used

- SELECT, WHERE, GROUP BY, ORDER BY
- INNER JOIN, LEFT JOIN
- CASE WHEN (IAS 36 flags, ratio flags)
- EXTRACT() — IAS 16 remaining life
- COALESCE() — NULL handling
- CREATE VIEW — Asset Health Summary
- CTE (WITH clause) — Corporate Dashboard
- UNION ALL — Table verification

## Database Structure (3NF)

- **assets**: Core metadata, cost, useful life, and asset classes.
- **depreciation**: Tracks sequential carrying values and cumulative decay.
- **impairment**: Holds analytical audits comparing market recoverable amounts against historical book values.
- **financials**: Multi-year income statement and balance sheet checkpoints.
- **cash_flow_ledger**: Tracks operational liquidity transformations using non-cash add-backs.

## Queries — 27 Total

### IAS 16 — PPE & Depreciation
- All assets, active assets, machinery filter
- Remaining useful life calculation
- Book value % (carrying amount / cost)
- Asset replacement flags

### IAS 36 — Impairment
- Impairment details with asset names
- CASE WHEN impairment flag
- Write-down required identification

### IAS 7 — Cash Flow Statement
- Operating, Investing, Financing activities
- CF Quality Check (earnings quality)
- Working Capital Analysis
- Financing breakdown & debt strategy

### Financial Ratios
- Liquidity: Current Ratio, Quick Ratio
- Profitability: NPM, ROA, ROE, ROCE, Gross Margin
- Leverage: Debt to Equity
- YoY comparison with trend flag
- Ratio flags (Healthy/Monitor/Risk)

### Advanced
- Corporate Dashboard VIEW (CTE)
- Asset Health Summary VIEW

## Tools

- PostgreSQL 17
- pgAdmin 4

## Background

CA (CAF Level) + BS Data Science Student  
Focus: Financial Reporting | Data Analytics | IAS
