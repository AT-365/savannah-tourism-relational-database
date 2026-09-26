# Case Study: Savannah Tourism Relational Database

## Project Context

This repository presents a graduate Database Systems project completed through two connected assignments.

- **Assignment 2:** semantic requirements, normalization, implementation, SQL queries, views, and results
- **Assignment 3:** EER modeling and systematic conversion of the conceptual model into relational schemas

The original work was completed by a five-person team. The repository is a curated portfolio presentation of the shared project artifacts and the documented hotel and restaurant extraction scope.

## Project Scope

The full team project modeled information from a broad Savannah tourism and business reference source. The modeled domains included attractions, businesses, hotels, restaurants, medical establishments, universities, sports and recreation, historic sites, parks, and related categories.

The public structured dataset in this repository contains the hotel and restaurant extraction subset:

- 33 hotel records
- 148 restaurant records
- 181 records total

These records represent the documented extraction scope presented in the portfolio. They are not the complete record count of every domain considered by the full team database.

## Assignment 2: Requirements and Implementation

Assignment 2 documented **49 semantic rules**. These rules guided the analysis of the source material and the conversion of domain requirements into relational structures.

The Assignment 2 workflow included:

1. analyzing the source material,
2. identifying entities, attributes, and relationships,
3. documenting 49 semantic rules,
4. identifying functional and multivalued dependencies,
5. decomposing relations through normal forms,
6. implementing the relational database in MySQL,
7. creating views and SQL queries,
8. documenting results and validation.

The portfolio implementation includes:

- 52 SQL tables
- 3 repository views
- 17 labeled queries
- automated repository checks
- structured hotel and restaurant data outputs

## Assignment 3: EER Modeling and Relational Conversion

Assignment 3 documented a separate set of **27 semantic rules** for the conceptual EER-design phase.

The Assignment 3 report includes:

- blocking analysis
- entity and relationship descriptions
- specialization constraints
- an EER diagram
- systematic EER-to-relational conversion
- attribute lists
- final relation schemas

The 27 Assignment 3 rules should not be merged with the 49 Assignment 2 rules. They belong to a separate assignment and document a different stage of the database-design process.

## Source-Data Challenge

The source material was semi-structured and difficult to transcribe. The selected pages included:

- dense multi-column listings
- advertisements
- wrapped descriptions
- inconsistent field placement
- missing values
- visual artifacts
- handwritten marks
- poor-quality scans and photocopies

The extraction process converted source information into consistent machine-readable fields. Where the source did not provide a value, the process preserved the blank rather than inventing information from outside sources.

See [`data-transformation.md`](data-transformation.md) and [`../source_material/`](../source_material/).

## Modeling and Normalization

The Assignment 2 implementation documents normalization through:

- 1NF
- 2NF
- 3NF
- BCNF
- 4NF

The design addresses dependency and multivalued-relationship concerns through keys, foreign keys, and bridge or identification tables.

Assignment 3 complements this implementation work by documenting the conceptual EER model and the formal algorithmic conversion from EER structures to relation schemas.

## Portfolio Evidence

| Evidence | Location |
|---|---|
| Assignment 2 semantic rules | `Assignment 2-Semantic Rules.pdf` |
| Assignment 3 semantic rules and EER report | `Assignment 3_Final Report.pdf` |
| Assignment 3 EER diagram | `EER FinalFRFR.jpg` |
| Implemented schema | [`../sql/schema.sql`](../sql/schema.sql) |
| Views | [`../sql/views.sql`](../sql/views.sql) |
| Queries | [`../sql/queries.sql`](../sql/queries.sql) |
| Source transformation process | [`data-transformation.md`](data-transformation.md) |
| Automated checks | [`../tests/test_sql_assets.py`](../tests/test_sql_assets.py) |

## Employer-Relevant Takeaways

This case study demonstrates the ability to:

- work with incomplete and difficult source data,
- translate narrative requirements into formal semantic rules,
- reason about dependencies and normalization,
- create conceptual and logical database designs,
- implement SQL schemas and query assets,
- validate repository artifacts,
- communicate the evolution of a technical design across multiple project phases.

## Attribution

The original project was completed by a five-person graduate Database Systems team. The repository preserves that team context and identifies the hotel and restaurant extraction subset as the documented individual scope represented in the public dataset.
