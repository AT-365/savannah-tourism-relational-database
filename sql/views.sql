USE glorious_savannah;

CREATE OR REPLACE VIEW all_businesses AS
SELECT b.business_id, m.name, m.description, m.phone, m.location,
       m.accepted_payment, m.years_in_business, 'medical' AS business_type
FROM businesses b
JOIN business_medical bm USING (business_id)
JOIN medical_establishments m USING (medical_id)
UNION ALL
SELECT b.business_id, p.name, p.description, p.phone, p.location,
       p.accepted_payment, p.years_in_business, 'pest_control'
FROM businesses b
JOIN business_pest_control bp USING (business_id)
JOIN pest_control p USING (pest_id)
UNION ALL
SELECT b.business_id, p.name, p.description, p.phone, p.location,
       p.accepted_payment, p.years_in_business, 'plumber'
FROM businesses b
JOIN business_plumbers bp USING (business_id)
JOIN plumbers p USING (plumber_id);

CREATE OR REPLACE VIEW family_owned_businesses_matching_free_estimate_area AS
SELECT DISTINCT family.name
FROM all_businesses family
WHERE UPPER(family.description) LIKE '%FAMILY OWN%'
  AND SUBSTRING_INDEX(family.phone, '-', 1) IN (
      SELECT SUBSTRING_INDEX(free_estimate.phone, '-', 1)
      FROM all_businesses free_estimate
      WHERE UPPER(free_estimate.description) LIKE '%FREE EST%'
  );

CREATE OR REPLACE VIEW historic_churches_on_squares AS
SELECT DISTINCT c.name AS church_name,
       c.location AS church_location,
       s.name AS square_name
FROM (
    SELECT church_id, name, location,
           TRIM(REGEXP_REPLACE(SUBSTRING_INDEX(location, ', Savannah', 1), '^[0-9]+', '')) AS street_name
    FROM historic_churches
) c
JOIN historic_squares s
  ON s.location LIKE CONCAT('%', c.street_name, '%');

