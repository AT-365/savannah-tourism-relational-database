# Savannah Tourism Relational Database

[![portfolio-checks](https://github.com/AT-365/savannah-tourism-relational-database/actions/workflows/tests.yml/badge.svg)](https://github.com/AT-365/savannah-tourism-relational-database/actions/workflows/tests.yml)

A MySQL portfolio case study demonstrating the complete relational database lifecycle: from semi-structured source data through semantic-rule modeling, functional and multivalued dependency analysis, normalization through fourth normal form (4NF), to a multi-entity MySQL schema with 52 tables, 3 reusable views, and 17 analytical queries.

**Project Scope:** The public dataset contains 181 source-derived hotel and restaurant directory records extracted from messy, multi-column scanned reference pages. These represent my assigned extraction contribution to a five-person graduate Database Systems team project covering broader Savannah tourism and business domains.

> **Project type:** Five-person graduate Database Systems team project  
> **Portfolio focus:** My documented contribution includes the hotel and restaurant extraction scope represented by the public dataset in this repository.

## Why This Project Matters

This project demonstrates practical database skills employers look for in entry-level data, analytics, backend, and database roles:

- extracting structured information from difficult semi-structured source material
- translating domain requirements into semantic rules
- modeling entities, relationships, constraints, and dependencies
- normalizing relational designs through 4NF
- converting conceptual EER designs into relational schemas
- implementing SQL schemas, views, and queries
- validating technical artifacts with automated checks
- documenting design decisions and project limitations clearly

## Project Overview

The original project used a large Savannah tourism and business reference source containing multiple information domains, including:

- attractions
- businesses
- hotels
- restaurants
- medical establishments
- universities
- sports and recreation
- historic sites
- parks and other related categories

The full team project covered a broader multi-domain database. This repository also includes a clearly identified public extraction subset containing **181 structured hotel and restaurant records** extracted from scanned reference pages.

The 181-record dataset should not be confused with the full scope of the team's database design.

## Assignment 2 and Assignment 3

Assignments 2 and 3 were connected but had different objectives and different semantic-rule sets.

### Assignment 2 — Requirements, Normalization, and Implementation

Assignment 2 documented **49 semantic rules** and used them to guide the conversion of source requirements into relational structures.

The assignment focused on:

- analyzing the source material
- identifying entities, attributes, relationships, and dependencies
- converting the 49 semantic rules into relations
- normalization through 1NF, 2NF, 3NF, BCNF, and 4NF
- implementing the database in MySQL
- creating views and answering business questions with SQL
- documenting results and validation

### Assignment 3 — EER Modeling and Relational Conversion

Assignment 3 continued the project with a separate set of **27 semantic rules**.

It focused on:

- blocking analysis
- EER conceptual modeling
- specialization and participation constraints
- documenting entity and relationship details
- converting the EER model into relations using the class algorithm
- listing attributes and final relation schemas

The 49-rule and 27-rule counts are intentionally reported separately because they belong to different assignments and support different stages of the design process.

## Verified Portfolio Metrics

| Metric | Value |
|---|---:|
| Assignment 2 semantic rules | 49 |
| Assignment 3 semantic rules | 27 |
| Public hotel records | 33 |
| Public restaurant records | 148 |
| Public source-derived records | 181 |
| Implemented schema tables | 52 |
| Labeled SQL queries | 17 |
| SQL views in repository | 3 |
| Automated repository test methods | 8 |
| Original team size | 5 |

The 181 public records represent the documented hotel and restaurant extraction subset, not the complete scope of the original team database.

## What I Built and Contributed

The repository preserves and presents evidence of:

- manual extraction from difficult scanned reference pages
- structured hotel and restaurant data files
- normalized SQL schema implementation
- primary-key and foreign-key relationships
- bridge tables for multi-entity relationships
- reusable SQL views
- analytical and operational query examples
- sample data for safe demonstration
- automated checks for schema, views, queries, and dataset consistency
- supporting reports, diagrams, assignment directions, and grading documentation

The original work was completed by a five-person team. The repository does not claim sole authorship of every team deliverable. My documented extraction scope was the hotel and restaurant portion presented in the public dataset and portfolio evidence.

## Quick Start

Load the schema and sample data into MySQL:

```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p glorious_savannah < sql/sample_data.sql
mysql -u root -p glorious_savannah < sql/views.sql
mysql -u root -p glorious_savannah < sql/queries.sql
```

Run the automated validation tests:

```bash
python -m unittest discover -s tests -v
```

Then inspect the structured output in [`data/`](data/):
- 33 hotel records: [`savannah_hotels.csv`](data/savannah_hotels.csv)
- 148 restaurant records: [`savannah_restaurants.csv`](data/savannah_restaurants.csv)

## Source-Data Challenge

The source was not a clean spreadsheet or database export. It included difficult scanned and photocopied reference pages with:

- multi-column layouts
- advertisements and visual interruptions
- wrapped text
- inconsistent field placement
- missing values
- icons and page-layout artifacts
- handwritten marks
- difficult-to-read printing

The extraction process converted relevant printed facts into consistent fields, preserved blanks when information was unavailable, and avoided filling missing values with unsupported outside research.

See [`docs/data-transformation.md`](docs/data-transformation.md) and [`source_material/`](source_material/).

## Repository Map

| Path | Purpose |
|---|---|
| [`sql/schema.sql`](sql/schema.sql) | MySQL schema, keys, relationships, and constraints |
| [`sql/views.sql`](sql/views.sql) | Reusable SQL views |
| [`sql/queries.sql`](sql/queries.sql) | Labeled analytical and operational queries |
| [`sql/sample_data.sql`](sql/sample_data.sql) | Representative demonstration data |
| [`data/`](data/) | Public hotel and restaurant record outputs |
| [`source_material/`](source_material/) | Selected source-page evidence |
| [`docs/case-study.md`](docs/case-study.md) | Modeling, normalization, and project narrative |
| [`docs/data-transformation.md`](docs/data-transformation.md) | Source-to-structured-data workflow |
| [`docs/query-catalog.md`](docs/query-catalog.md) | Query descriptions and review guide |
| [`portfolio/`](portfolio/) | Assignment reports, grading/supporting evidence, and the selected EER diagram |
| [`portfolio/Assignment 2-Semantic Rules.pdf`](portfolio/Assignment%202-Semantic%20Rules.pdf) | Assignment 2 semantic-rule evidence |
| [`portfolio/Assignment 3_Final Report.pdf`](portfolio/Assignment%203_Final%20Report.pdf) | Assignment 3 EER and relational-conversion report |
| [`portfolio/EER Final (1).jpg`](portfolio/EER%20Final%20%281%29.jpg) | Selected Assignment 3 EER diagram |
| [`tests/test_sql_assets.py`](tests/test_sql_assets.py) | Automated repository checks |

## Design Highlights

The model separates four major domains—attractions, businesses, hotels, and restaurants—then resolves multivalued relationships with identification tables. For example, a book can reference multiple attractions, universities, or hospitals through bridge tables like `book_attractions`, `book_universities`, and `business_medical`. The design demonstrates how to flatten complex M:N relationships while preserving independence between semantic facts.

The views demonstrate two different integration problems:

1. consolidating medical establishments, pest-control companies, and plumbers into a common business interface; and
2. matching historic churches with Savannah squares after normalizing street-location text.

## Technologies & Methods

- **MySQL 8:** schema design, DDL, views, complex joins, subqueries, pattern matching with REGEXP
- **SQL:** relational algebra, set operations (UNION ALL), aggregate functions, string manipulation
- **Relational modeling:** functional dependency analysis, multivalued dependency resolution, bridge tables
- **Normalization:** 1NF → 2NF → 3NF → BCNF → 4NF decomposition with dependency preservation
- **EER/ER design:** entity-relationship modeling, specialization constraints, conceptual-to-relational conversion
- **Python:** automated test suite with unittest, CSV validation, schema introspection
- **Data engineering:** extraction from semi-structured sources, field mapping, consistency validation
- **Git/GitHub:** version control, automated CI/CD with GitHub Actions

## How to Review This Project

For a quick technical review:

1. Read this README.
2. Review [`docs/case-study.md`](docs/case-study.md).
3. Read [`docs/data-transformation.md`](docs/data-transformation.md).
4. Inspect [`sql/schema.sql`](sql/schema.sql).
5. Review [`sql/views.sql`](sql/views.sql) and [`sql/queries.sql`](sql/queries.sql).
6. Open the selected Assignment 3 EER diagram in [`portfolio/EER Final (1).jpg`](portfolio/EER%20Final%20%281%29.jpg).
7. Review [`tests/test_sql_assets.py`](tests/test_sql_assets.py).

For deeper evidence, see the Assignment 2 and Assignment 3 reports in [`portfolio/`](portfolio/) and the supporting source-material files in the repository.

## Team Attribution and Scope

This work originated as a five-person graduate Database Systems project. The original report credits:

- Aubree Sellers
- Autenia Murray
- Olivia Grant
- Rebekah Burke
- Sadie Robards

This repository is a recruiter-facing curation of shared project evidence. It distinguishes the broader team deliverables from the hotel and restaurant extraction scope documented as my assigned contribution.

The repository is a historical academic portfolio artifact, not a current commercial tourism directory.

## What I Learned

This project taught me several foundational lessons about production database design:

- **Normalization is about more than eliminating redundancy.** Fourth normal form resolution requires thinking carefully about which facts are independent and which relationships should be separated into identification tables. Poor decomposition creates either over-joined queries or impossible-to-validate constraints.

- **Semi-structured source data extraction requires discipline.** When converting messy scanned pages into structured records, it's tempting to infer missing values or "clean up" inconsistencies. The right approach is to preserve source facts exactly and document the blanks—let downstream consumers decide how to handle incomplete data.

- **Automated validation catches subtle mistakes early.** The repository's test suite validates schema structure, foreign-key relationships, view definitions, and output record counts. This prevents drift between what the documentation claims and what the code actually does.

- **Clear scope boundaries are essential for team collaboration.** The original assignment included five people working on different domains. Documenting which tables, records, and assignments belong to whom prevents confusion and makes it possible to extract reusable portfolio evidence later.
