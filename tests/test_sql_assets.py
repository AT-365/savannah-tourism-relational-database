import re
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

    def test_no_real_source_dataset_is_committed(self):
        prohibited = {"phonebook", "aaa", "source_pages"}
        paths = {p.name.lower() for p in ROOT.rglob("*") if p.is_file()}
        self.assertTrue(prohibited.isdisjoint(paths))


if __name__ == "__main__":
    unittest.main()

