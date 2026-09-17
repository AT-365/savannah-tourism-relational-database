# Public directory dataset

This folder contains the factual hotel and restaurant records collected for the Savannah tourism database project.

## Files

| File | Records | Contents |
|---|---:|---|
| [`savannah_restaurants.csv`](savannah_restaurants.csv) | 148 | Restaurant IDs, names, locations, phone numbers, operating hours, websites, cuisine types, and reservation information |
| [`savannah_hotels.csv`](savannah_hotels.csv) | 33 | Hotel IDs, names, locations, phone numbers, websites, historic areas, price ranges, accepted payments, booking restrictions, cancellation restrictions, and amenities |

## Provenance

The records were transcribed by a five-person graduate Database Systems project team from the Savannah tourism and business reference pages supplied for the project. Team contributors were Aubree Sellers, Autenia Murray, Olivia Grant, Rebekah Burke, and Sadie Robards. Autenia's assigned extraction scope was the hotel and restaurant sections published in this folder.

The files are published as a historical academic snapshot and portfolio artifact. Business contact details, prices, policies, and amenities may have changed since collection.

## Publication boundaries

The CSV files contain structured directory facts used in the database. Selected hotel and restaurant page excerpts are available in [`source_material`](../source_material/) to document the extraction challenge, but photographs, layout elements, and narrative descriptions were not copied into the CSV dataset. Empty source values are represented as blank CSV fields.

See the [data-transformation walkthrough](../docs/data-transformation.md) for the raw-page-to-relational-data process.

The repository's MIT license applies to the original code and documentation. It does not assert ownership over third-party business facts or source materials.
