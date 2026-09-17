import re
import csv
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


class PortfolioSQLTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.schema = (ROOT / "sql" / "schema.sql").read_text(encoding="utf-8")
        cls.views = (ROOT / "sql" / "views.sql").read_text(encoding="utf-8")
        cls.queries = (ROOT / "sql" / "queries.sql").read_text(encoding="utf-8")

    def test_core_schema_tables_are_present(self):
        for table in ("book", "hotels", "restaurants", "historic_squares", "medical_establishments"):
            self.assertRegex(self.schema.lower(), rf"create table\s+{table}\b")

    def test_multivalued_relationships_use_bridge_tables(self):
        for table in ("book_hotels", "book_restaurants", "university_programs", "doctor_degrees"):
            self.assertRegex(self.schema.lower(), rf"create table\s+{table}\b")

    def test_foreign_keys_are_declared(self):
        self.assertGreaterEqual(self.schema.lower().count("foreign key"), 30)

    def test_three_recruiter_facing_views_are_present(self):
        names = re.findall(r"create\s+or\s+replace\s+view\s+([a-z0-9_]+)", self.views, re.I)
        self.assertEqual(
            names,
            [
                "all_businesses",
                "family_owned_businesses_matching_free_estimate_area",
                "historic_churches_on_squares",
            ],
        )

    def test_all_seventeen_queries_are_labeled(self):
        labels = [int(n) for n in re.findall(r"^--\s*(\d+)\.", self.queries, re.M)]
        self.assertEqual(labels, list(range(1, 18)))

    def test_public_directory_dataset_is_present(self):
        expected = {
            "savannah_restaurants.csv": 148,
            "savannah_hotels.csv": 33,
        }
        for filename, record_count in expected.items():
            with (ROOT / "data" / filename).open(encoding="utf-8", newline="") as source:
                rows = list(csv.DictReader(source))
            self.assertEqual(len(rows), record_count)

    def test_public_dataset_excludes_publisher_descriptions(self):
        for path in (ROOT / "data").glob("*.csv"):
            with path.open(encoding="utf-8", newline="") as source:
                headers = {header.lower() for header in next(csv.reader(source))}
            self.assertNotIn("description", headers)
            self.assertNotIn("rest_descript", headers)
            self.assertNotIn("hotel_descript", headers)

    def test_selected_source_evidence_and_transformation_guide_are_present(self):
        required = (
            ROOT / "source_material" / "savannah_hotel_source_pages.pdf",
            ROOT / "source_material" / "savannah_restaurant_source_pages.pdf",
            ROOT / "docs" / "images" / "raw-hotel-page.png",
            ROOT / "docs" / "images" / "raw-restaurant-page.png",
            ROOT / "docs" / "data-transformation.md",
        )
        for path in required:
            self.assertTrue(path.is_file(), f"Missing portfolio evidence: {path.relative_to(ROOT)}")

        guide = (ROOT / "docs" / "data-transformation.md").read_text(encoding="utf-8")
        for phrase in ("33 hotel records", "148 restaurant records", "181 source-derived records"):
            self.assertIn(phrase, guide)


if __name__ == "__main__":
    unittest.main()
