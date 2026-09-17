# Case study

## Problem

The source material described Savannah attractions, businesses, hotels, and restaurants as semi-structured reference pages. The database needed to support repeatable searches across those categories without duplicating multivalued data.

## Approach

The team converted the domain narrative into 26 semantic rules, then identified functional dependencies and multivalued dependencies. A universal relation diagram made the dependencies visible before decomposition.

For the assigned hotel and restaurant portion, the source was not a clean table. It consisted of dense scanned pages with multi-column listings, advertisements, icons, wrapped text, inconsistent field placement, missing values, and handwritten review marks. The extraction separated printed facts into consistent attributes, assigned stable identifiers, and retained blanks when the source did not provide a value. Missing facts were not filled from outside sources.

Normalization proceeded in stages:

- **1NF:** confirm atomic attributes;
- **2NF:** verify full dependency on each relation's key;
- **3NF:** separate transitive dependencies into domain relations;
- **BCNF:** verify that each determinant is a candidate key; and
- **4NF:** resolve independent multivalued relationships through identification tables.

## Implementation

The design was implemented in MySQL across core entities and associative tables. Source records were loaded, the results were checked in the database client, two reusable views were created, and seventeen queries were executed. The query set covers selection, joins, unions, subqueries, regular-expression matching, updates, and inserts.

## Public-portfolio adaptations

- Table and column names were standardized for readability.
- Two CSV files publish 181 factual hotel and restaurant directory records from the team's source extraction.
- The limited hotel and restaurant source excerpts are included so recruiters can inspect the messy input; unrelated directory categories remain excluded.
- Publisher narrative descriptions are excluded from the public CSV dataset.
- A visual [data-transformation walkthrough](data-transformation.md) connects the scans to structured fields and normalized SQL.
- A small synthetic SQL seed remains available for a fast, repeatable database demonstration.
- The SQL was separated into schema, sample data, views, and queries.
- Automated checks ensure that the portfolio retains all seventeen labeled queries, required views, and key schema elements.
- The original five-person team is explicitly credited.

## Result

The project demonstrates a complete relational-design workflow from narrative requirements to normalized schema and decision-oriented SQL. It also provides evidence of communicating a large technical design through a structured written report and presentation.
