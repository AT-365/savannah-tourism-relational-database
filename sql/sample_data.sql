USE glorious_savannah;

INSERT INTO book VALUES ('9780000000001', 'Glorious Savannah', 'Focus Publishing', 1, 2025, 600);
INSERT INTO attractions VALUES ('ATT001');
INSERT INTO businesses VALUES ('BUS001'), ('BUS002');

INSERT INTO hotels VALUES
('H001', 'River Street House', 'Savannah Historic District', '912-555-0101', NULL, TRUE,
 '$180-$260', 'Visa; Mastercard', 'Two-night weekend minimum', '48-hour cancellation fee',
 'Wi-Fi; breakfast', 'Synthetic historic-district hotel record');

INSERT INTO restaurants VALUES
('R001', 'Lowcountry Table', 'Savannah, GA', '912-555-0110', '11:00-22:00', NULL,
 'Southern', TRUE, 'Synthetic restaurant record');

INSERT INTO book_attractions VALUES ('9780000000001', 'ATT001');
INSERT INTO book_businesses VALUES ('9780000000001', 'BUS001'), ('9780000000001', 'BUS002');
INSERT INTO book_hotels VALUES ('9780000000001', 'H001');
INSERT INTO book_restaurants VALUES ('9780000000001', 'R001');

INSERT INTO medical_establishments VALUES
('MED001', 'Coastal Vision Group', 'Optical', 'Family owned practice; free estimates available',
 'Eye examinations', 'Savannah, GA', 'Mon-Fri', NULL, '912-555-0120',
 'Visa; Mastercard; Discover; American Express', 18);
INSERT INTO business_medical VALUES ('BUS001', 'MED001');

INSERT INTO pest_control VALUES
('PST001', 'Harbor Pest Services', 'Savannah, GA', '912-555-0130', '24/7',
 'Residential and commercial dead animal removal', 'Visa; Mastercard',
 'Family owned and operated; free estimates', 15);
INSERT INTO business_pest_control VALUES ('BUS002', 'PST001');

INSERT INTO historic_churches VALUES
('CH001', 'Example Historic Church', '912-555-0140', '100 Bull St, Savannah',
 'Nondenominational', NULL, 'Synthetic church record');
INSERT INTO historic_squares VALUES
('SQ001', 'Example Square', 'Bull St and Example Ln', 'Community history', 1850,
 'Classical', 'Synthetic square record honoring a nineteenth-century figure');

INSERT INTO parks VALUES
('PK001', 'Example Public Park', 'Savannah, GA', 'Savannah',
 'Picnic shelters and a baseball field');

INSERT INTO golf_courses VALUES
('G001', 'Example Public Golf Course', '912-555-0150', 'Savannah, GA', NULL,
 'Public 27-hole golf course', 27, TRUE);

INSERT INTO art_attractions VALUES
('ART001', 'Spring Jazz Series', '912-555-0160', 'Savannah, GA', NULL,
 'Jazz', 'Jazz performances during March and April');

INSERT INTO savannah_attractions VALUES
('SAV001', 'Nineteenth-Century Monument', 'Savannah, GA', NULL, NULL,
 'Erected in 1888');

