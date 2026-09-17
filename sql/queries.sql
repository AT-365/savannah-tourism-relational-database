USE glorious_savannah;

-- 1. Businesses with an 800 number, website, and four major cards.
SELECT name, phone, location
FROM all_businesses
WHERE phone LIKE '800-%'
  AND accepted_payment LIKE '%Visa%'
  AND accepted_payment LIKE '%Mastercard%'
  AND accepted_payment LIKE '%Discover%'
  AND accepted_payment LIKE '%American Express%';

-- 2. Steakhouses in Hilton Head.
SELECT * FROM restaurants
WHERE cuisine_type LIKE '%Steak%'
  AND location LIKE '%Hilton Head%';

-- 3. Businesses not located in Savannah.
SELECT name FROM all_businesses
WHERE location NOT LIKE '%Savannah%';

-- 4. Pest controllers specializing in residential and commercial dead-animal removal.
SELECT name FROM pest_control
WHERE specialty LIKE '%dead animal%'
  AND specialty LIKE '%residential%'
  AND specialty LIKE '%commercial%';

-- 5. Optical doctors at a named medical establishment.
SELECT d.name
FROM doctors d
JOIN medical_doctors md USING (doctor_id)
JOIN medical_establishments m USING (medical_id)
WHERE m.name LIKE '%Georgia Eye Institute%'
  AND (m.specialty LIKE '%Optical%' OR m.services LIKE '%Optical%');

-- 6. Plastic-surgery establishments offering eyelid surgery.
SELECT name FROM medical_establishments
WHERE specialty LIKE '%Plastic Surgery%'
  AND services LIKE '%eye%lid%';

-- 7. Savannah art activities that include jazz.
SELECT name, location FROM art_attractions
WHERE location LIKE '%Savannah%'
  AND (art_type LIKE '%Jazz%' OR description LIKE '%Jazz%');

-- 8. Public Savannah golf courses with more than 20 holes.
SELECT name, hole_count FROM golf_courses
WHERE is_public = TRUE
  AND location LIKE '%Savannah%'
  AND hole_count > 20;

-- 9. Sports recreation on Tybee Island.
SELECT name, location FROM tennis_courts WHERE location LIKE '%Tybee%'
UNION ALL
SELECT name, location FROM golf_courses WHERE location LIKE '%Tybee%'
UNION ALL
SELECT name, location FROM boat_ramps WHERE location LIKE '%Tybee%'
UNION ALL
SELECT name, location FROM fishing_piers WHERE location LIKE '%Tybee%';

-- 10. Savannah squares established for war heroes.
SELECT name FROM historic_squares
WHERE description LIKE '%war hero%'
   OR inspiration LIKE '%war hero%';

-- 11. Public parks with picnic shelters and an athletic field.
SELECT name, location FROM parks
WHERE description LIKE '%picnic shelter%'
  AND (description REGEXP 'baseball|softball|football|soccer|athletic field');

-- 12. Savannah art events in March or April.
SELECT a.name, a.location, e.start_date
FROM art_attractions a
JOIN attraction_art aa USING (art_id)
JOIN attraction_events ae USING (attraction_id)
JOIN calendar_events e USING (event_id)
WHERE a.location LIKE '%Savannah%'
  AND MONTH(e.start_date) IN (3, 4);

-- 13. Historic-area hotels with cancellation fees and booking-day limits.
SELECT name, location, booking_restrictions, cancellation_restrictions
FROM hotels
WHERE historic_area = TRUE
  AND cancellation_restrictions LIKE '%fee%'
  AND booking_restrictions IS NOT NULL;

-- 14. Established, family-owned businesses that accept Mastercard.
SELECT name, years_in_business
FROM all_businesses
WHERE years_in_business > 10
  AND accepted_payment LIKE '%Mastercard%'
  AND UPPER(description) LIKE '%FAMILY OWN%';

-- 15. Controlled update after a medical-practice closure and relocation.
UPDATE medical_establishments
SET description = CONCAT(COALESCE(description, ''), '; Richmond Hill primary care and prior cardiology locations closed')
WHERE name LIKE '%Southcoast Medical%';

UPDATE medical_establishments
SET location = 'Garden City, GA'
WHERE name LIKE '%Southcoast Medical%'
  AND specialty LIKE '%Cardiology%';

-- 16. Savannah attractions erected in the nineteenth century.
SELECT name, location FROM savannah_attractions
WHERE description REGEXP '18[0-9]{2}|nineteenth|19th';

-- 17. Insert the requested square while preserving a stable surrogate identifier.
INSERT INTO historic_squares
    (square_id, name, location, inspiration, design_year, architecture_style, description)
VALUES
    ('SQ-AASU-2007', 'AASU Square', 'Apache Street and Abercorn',
     'Michael Jordan, AASU president from 1994-2000', 2007,
     'Hungarian', 'Designed by James Cameron');

