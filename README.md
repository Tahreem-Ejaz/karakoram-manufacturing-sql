# Karakoram Manufacturing Ltd
## Financial Intelligence Database

> *"Assets decay, impacts endure — 
> let's valuate finite lifecycles"*

---

## Project Overview

A PostgreSQL database modelling the complete 
financial reporting structure of a dummy Pakistani 
manufacturing company — built using IFRS/IAS standards.

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
