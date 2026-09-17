DROP DATABASE IF EXISTS glorious_savannah;
CREATE DATABASE glorious_savannah CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE glorious_savannah;

CREATE TABLE book (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher VARCHAR(160),
    edition_no INT,
    publication_year SMALLINT,
    page_count INT
);

CREATE TABLE attractions (attraction_id VARCHAR(20) PRIMARY KEY);
CREATE TABLE businesses (business_id VARCHAR(20) PRIMARY KEY);

CREATE TABLE hotels (
    hotel_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    phone VARCHAR(40),
    website VARCHAR(255),
    historic_area BOOLEAN,
    price_range VARCHAR(80),
    accepted_payment VARCHAR(160),
    booking_restrictions TEXT,
    cancellation_restrictions TEXT,
    amenities TEXT,
    description TEXT
);

CREATE TABLE restaurants (
    restaurant_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    phone VARCHAR(40),
    operating_hours VARCHAR(160),
    website VARCHAR(255),
    cuisine_type VARCHAR(120),
    reservations_accepted BOOLEAN,
    description TEXT
);

CREATE TABLE book_attractions (
    isbn VARCHAR(20) NOT NULL,
    attraction_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (isbn, attraction_id),
    FOREIGN KEY (isbn) REFERENCES book(isbn),
    FOREIGN KEY (attraction_id) REFERENCES attractions(attraction_id)
);

CREATE TABLE book_businesses (
    isbn VARCHAR(20) NOT NULL,
    business_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (isbn, business_id),
    FOREIGN KEY (isbn) REFERENCES book(isbn),
    FOREIGN KEY (business_id) REFERENCES businesses(business_id)
);

CREATE TABLE book_hotels (
    isbn VARCHAR(20) NOT NULL,
    hotel_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (isbn, hotel_id),
    FOREIGN KEY (isbn) REFERENCES book(isbn),
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

CREATE TABLE book_restaurants (
    isbn VARCHAR(20) NOT NULL,
    restaurant_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (isbn, restaurant_id),
    FOREIGN KEY (isbn) REFERENCES book(isbn),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

CREATE TABLE emergency_agencies (
    emergency_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40)
);

CREATE TABLE savannah_attractions (
    savannah_attraction_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    phone VARCHAR(40),
    website VARCHAR(255),
    description TEXT
);

CREATE TABLE tybee_attractions (
    tybee_attraction_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    phone VARCHAR(40),
    website VARCHAR(255),
    description TEXT
);

CREATE TABLE historic_cemeteries (
    cemetery_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    established_year SMALLINT,
    cemetery_type VARCHAR(120),
    description TEXT
);

CREATE TABLE historic_churches (
    church_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    location VARCHAR(255),
    denomination VARCHAR(120),
    website VARCHAR(255),
    description TEXT
);

CREATE TABLE historic_squares (
    square_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    inspiration VARCHAR(255),
    design_year SMALLINT,
    architecture_style VARCHAR(120),
    description TEXT
);

CREATE TABLE parks (
    park_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    municipality VARCHAR(120),
    description TEXT
);

CREATE TABLE calendar_events (
    event_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    location VARCHAR(255),
    website VARCHAR(255),
    start_date DATE,
    description TEXT
);

CREATE TABLE art_attractions (
    art_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    location VARCHAR(255),
    website VARCHAR(255),
    art_type VARCHAR(120),
    description TEXT
);

CREATE TABLE sports_attractions (sports_id VARCHAR(20) PRIMARY KEY);

CREATE TABLE golf_courses (
    golf_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    location VARCHAR(255),
    website VARCHAR(255),
    description TEXT,
    hole_count INT,
    is_public BOOLEAN
);

CREATE TABLE tennis_courts (
    tennis_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    location VARCHAR(255),
    description TEXT
);

CREATE TABLE boat_ramps (
    ramp_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE fishing_piers (
    pier_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE universities (
    university_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40),
    email VARCHAR(160),
    location VARCHAR(255),
    website VARCHAR(255),
    university_type VARCHAR(120),
    description TEXT
);

CREATE TABLE university_colleges (
    university_id VARCHAR(20) NOT NULL,
    college_name VARCHAR(160) NOT NULL,
    PRIMARY KEY (university_id, college_name),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

CREATE TABLE university_programs (
    university_id VARCHAR(20) NOT NULL,
    program_name VARCHAR(160) NOT NULL,
    PRIMARY KEY (university_id, program_name),
    FOREIGN KEY (university_id) REFERENCES universities(university_id)
);

CREATE TABLE university_departments (
    department_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    phone VARCHAR(40)
);

CREATE TABLE university_department_numbers (
    university_id VARCHAR(20) NOT NULL,
    department_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (university_id, department_id),
    FOREIGN KEY (university_id) REFERENCES universities(university_id),
    FOREIGN KEY (department_id) REFERENCES university_departments(department_id)
);

CREATE TABLE medical_establishments (
    medical_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    specialty VARCHAR(160),
    description TEXT,
    services TEXT,
    location VARCHAR(255),
    operating_hours VARCHAR(160),
    website VARCHAR(255),
    phone VARCHAR(40),
    accepted_payment VARCHAR(160),
    years_in_business INT
);

CREATE TABLE doctors (
    doctor_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL
);

CREATE TABLE doctor_degrees (
    doctor_id VARCHAR(20) NOT NULL,
    degree VARCHAR(120) NOT NULL,
    PRIMARY KEY (doctor_id, degree),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE pest_control (
    pest_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    phone VARCHAR(40),
    operating_hours VARCHAR(160),
    specialty VARCHAR(255),
    accepted_payment VARCHAR(160),
    description TEXT,
    years_in_business INT
);

CREATE TABLE plumbers (
    plumber_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(160) NOT NULL,
    location VARCHAR(255),
    phone VARCHAR(40),
    operating_hours VARCHAR(160),
    specialty VARCHAR(255),
    accepted_payment VARCHAR(160),
    description TEXT,
    years_in_business INT
);

CREATE TABLE business_medical (
    business_id VARCHAR(20) NOT NULL,
    medical_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (business_id, medical_id),
    FOREIGN KEY (business_id) REFERENCES businesses(business_id),
    FOREIGN KEY (medical_id) REFERENCES medical_establishments(medical_id)
);

CREATE TABLE medical_doctors (
    medical_id VARCHAR(20) NOT NULL,
    doctor_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (medical_id, doctor_id),
    FOREIGN KEY (medical_id) REFERENCES medical_establishments(medical_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE business_pest_control (
    business_id VARCHAR(20) NOT NULL,
    pest_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (business_id, pest_id),
    FOREIGN KEY (business_id) REFERENCES businesses(business_id),
    FOREIGN KEY (pest_id) REFERENCES pest_control(pest_id)
);

CREATE TABLE business_plumbers (
    business_id VARCHAR(20) NOT NULL,
    plumber_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (business_id, plumber_id),
    FOREIGN KEY (business_id) REFERENCES businesses(business_id),
    FOREIGN KEY (plumber_id) REFERENCES plumbers(plumber_id)
);

CREATE TABLE attraction_emergencies (attraction_id VARCHAR(20), emergency_id VARCHAR(20), PRIMARY KEY(attraction_id, emergency_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(emergency_id) REFERENCES emergency_agencies(emergency_id));
CREATE TABLE attraction_savannah (attraction_id VARCHAR(20), savannah_attraction_id VARCHAR(20), PRIMARY KEY(attraction_id, savannah_attraction_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(savannah_attraction_id) REFERENCES savannah_attractions(savannah_attraction_id));
CREATE TABLE attraction_tybee (attraction_id VARCHAR(20), tybee_attraction_id VARCHAR(20), PRIMARY KEY(attraction_id, tybee_attraction_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(tybee_attraction_id) REFERENCES tybee_attractions(tybee_attraction_id));
CREATE TABLE attraction_cemeteries (attraction_id VARCHAR(20), cemetery_id VARCHAR(20), PRIMARY KEY(attraction_id, cemetery_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(cemetery_id) REFERENCES historic_cemeteries(cemetery_id));
CREATE TABLE attraction_churches (attraction_id VARCHAR(20), church_id VARCHAR(20), PRIMARY KEY(attraction_id, church_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(church_id) REFERENCES historic_churches(church_id));
CREATE TABLE attraction_squares (attraction_id VARCHAR(20), square_id VARCHAR(20), PRIMARY KEY(attraction_id, square_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(square_id) REFERENCES historic_squares(square_id));
CREATE TABLE attraction_parks (attraction_id VARCHAR(20), park_id VARCHAR(20), PRIMARY KEY(attraction_id, park_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(park_id) REFERENCES parks(park_id));
CREATE TABLE attraction_events (attraction_id VARCHAR(20), event_id VARCHAR(20), PRIMARY KEY(attraction_id, event_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(event_id) REFERENCES calendar_events(event_id));
CREATE TABLE attraction_art (attraction_id VARCHAR(20), art_id VARCHAR(20), PRIMARY KEY(attraction_id, art_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(art_id) REFERENCES art_attractions(art_id));
CREATE TABLE attraction_sports (attraction_id VARCHAR(20), sports_id VARCHAR(20), PRIMARY KEY(attraction_id, sports_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(sports_id) REFERENCES sports_attractions(sports_id));
CREATE TABLE attraction_universities (attraction_id VARCHAR(20), university_id VARCHAR(20), PRIMARY KEY(attraction_id, university_id), FOREIGN KEY(attraction_id) REFERENCES attractions(attraction_id), FOREIGN KEY(university_id) REFERENCES universities(university_id));
CREATE TABLE sports_golf (sports_id VARCHAR(20), golf_id VARCHAR(20), PRIMARY KEY(sports_id, golf_id), FOREIGN KEY(sports_id) REFERENCES sports_attractions(sports_id), FOREIGN KEY(golf_id) REFERENCES golf_courses(golf_id));
CREATE TABLE sports_tennis (sports_id VARCHAR(20), tennis_id VARCHAR(20), PRIMARY KEY(sports_id, tennis_id), FOREIGN KEY(sports_id) REFERENCES sports_attractions(sports_id), FOREIGN KEY(tennis_id) REFERENCES tennis_courts(tennis_id));
CREATE TABLE sports_ramps (sports_id VARCHAR(20), ramp_id VARCHAR(20), PRIMARY KEY(sports_id, ramp_id), FOREIGN KEY(sports_id) REFERENCES sports_attractions(sports_id), FOREIGN KEY(ramp_id) REFERENCES boat_ramps(ramp_id));
CREATE TABLE sports_piers (sports_id VARCHAR(20), pier_id VARCHAR(20), PRIMARY KEY(sports_id, pier_id), FOREIGN KEY(sports_id) REFERENCES sports_attractions(sports_id), FOREIGN KEY(pier_id) REFERENCES fishing_piers(pier_id));

