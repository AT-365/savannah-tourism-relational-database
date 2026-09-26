# SQL Query Catalog

This catalog describes the SQL query and view artifacts included in the repository.

## Assignment Context

The SQL implementation is primarily evidence from the Assignment 2 implementation phase. Assignment 3 was focused on EER conceptual design and systematic relation conversion rather than SQL execution.

## Query Set

The repository contains **17 labeled analytical and operational queries** in [`../sql/queries.sql`](../sql/queries.sql).

The query set demonstrates:

- filtering and pattern matching
- joins across related entities
- cross-domain retrieval
- set-based analysis
- regular-expression searches
- update examples
- insert examples
- business-oriented questions based on the modeled data

## Views

The repository contains **3 SQL views** in [`../sql/views.sql`](../sql/views.sql).

Some original Assignment 2 materials refer to two required views. The repository implementation contains three view definitions, including an additional reusable abstraction used by the portfolio SQL assets. The README therefore distinguishes:

- the assignment requirement, and
- the current repository implementation count.

## Relationship to Semantic Rules

The query and view design is downstream of the Assignment 2 modeling work:

1. Assignment 2 documented 49 semantic rules.
2. Those requirements informed the relational schema and dependencies.
3. The schema supported views and business queries.
4. Assignment 3 separately documented 27 semantic rules for EER modeling and relation conversion.

The two semantic-rule counts belong to different assignments and should not be treated as one combined query-design count.

## Review Path

1. Open [`../sql/queries.sql`](../sql/queries.sql).
2. Review the numbered query comments.
3. Cross-reference referenced tables in [`../sql/schema.sql`](../sql/schema.sql).
4. Review reusable abstractions in [`../sql/views.sql`](../sql/views.sql).
5. Review validation logic in [`../tests/test_sql_assets.py`](../tests/test_sql_assets.py).

## Validation

The repository tests check the presence and consistency of core SQL assets, including:

- required tables
- bridge tables
- foreign-key relationships
- view definitions
- labeled query count
- public dataset counts
- documented scope exclusions
