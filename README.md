# Savannah Tourism Relational Database

[![portfolio-checks](https://github.com/AT-365/savannah-tourism-relational-database/actions/workflows/tests.yml/badge.svg)](https://github.com/AT-365/savannah-tourism-relational-database/actions/workflows/tests.yml)

A MySQL portfolio case study showing the lifecycle of a relational database: source analysis, semantic-rule modeling, functional and multivalued dependencies, normalization through fourth normal form (4NF), schema implementation, views, and analytical/operational queries.

## What this demonstrates

- Translating an unstructured tourism reference into a relational model
- Defining 26 semantic rules and identifying functional and multivalued dependencies
- Decomposing the universal relation through 1NF, 2NF, 3NF, BCNF, and 4NF
- Implementing a multi-entity MySQL schema with primary and foreign keys
- Combining subtype tables through `UNION ALL`, joins, subqueries, string functions, and views
- Answering 17 business questions and performing controlled updates/inserts
- Explaining a technical design to both technical and nontechnical audiences

## Repository map

| Path | Purpose |
|---|---|
| [`sql/schema.sql`](sql/schema.sql) | Recruiter-readable MySQL DDL for the normalized schema |
| [`sql/views.sql`](sql/views.sql) | Reusable views for cross-table business analysis |
| [`sql/queries.sql`](sql/queries.sql) | Seventeen documented analytical and operational queries |
| [`sql/sample_data.sql`](sql/sample_data.sql) | Small synthetic dataset for safe demonstration |
| [`data/savannah_restaurants.csv`](data/savannah_restaurants.csv) | 148 source-derived restaurant directory records |
| [`data/savannah_hotels.csv`](data/savannah_hotels.csv) | 33 source-derived hotel directory records |
| [`data/README.md`](data/README.md) | Dataset provenance, fields, exclusions, and use notes |
| [`docs/case-study.md`](docs/case-study.md) | Design decisions, normalization narrative, and results |
| [`docs/query-catalog.md`](docs/query-catalog.md) | Plain-language catalog of the 17 questions |
| [`tests/test_sql_assets.py`](tests/test_sql_assets.py) | Automated structural checks for the portfolio SQL |

## Quick start

```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p glorious_savannah < sql/sample_data.sql
mysql -u root -p glorious_savannah < sql/views.sql
mysql -u root -p glorious_savannah < sql/queries.sql
```

Run the repository checks:

```bash
python -m unittest discover -s tests -v
```

## Design highlights

The model separates four major domains—attractions, businesses, hotels, and restaurants—then resolves multivalued relationships with identification tables. For example, a book can reference many hotels, while each hotel record remains independently keyed and reusable. The same pattern is applied to attractions, universities, sports facilities, and business subtypes.

The views demonstrate two different integration problems:

1. consolidating medical establishments, pest-control companies, and plumbers into a common business interface; and
2. matching historic churches with Savannah squares after normalizing street-location text.

## Scope and attribution

This originated as a five-person graduate Database Systems team project. The original submission credits Aubree Sellers, Autenia Murray, Olivia Grant, Rebekah Burke, and Sadie Robards. This repository is a recruiter-facing curation of the shared design and implementation evidence; it does not claim sole authorship by one teammate.

The repository includes 181 factual business-directory records transcribed from the AAA/Glorious Savannah reference used by the team. The CSV files contain structured directory fields such as business names, locations, phone numbers, websites, categories, and booking information. Publisher page scans, photographs, layout, and narrative descriptions are excluded. The records are a historical academic snapshot and should not be treated as a current travel directory.

The small SQL seed file remains synthetic so the schema and queries can be demonstrated quickly and repeatably. The public CSV files preserve the source-derived dataset separately for inspection and portfolio evidence.

## Technology

MySQL 8 · SQL · relational modeling · normalization · EER/URD design · views · joins · subqueries · regular expressions · automated repository checks
