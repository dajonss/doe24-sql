-- Testdata for table 'users'
USE petshop;

INSERT INTO users VALUES 
(NULL, 'Kalle', 'HeatoN', 'kalle@kalle.se', 1, 'Smultronstigen 12 12154 Luleå', 'Smultronstigen 12 12154 Luleå'),
(NULL, 'Pelle', 'Pelle1337', 'pelle@pelle.se', 0, 'Åkerbärsstigen 15 95234 Hedemora', 'EnAnnanLeveransadress 12 95234 Töre'),
(NULL, 'Olle', 'Ollmeister', 'olle@olle.com', 1, 'Ollonvägen 12 11011 Stockholm', 'Ollonvägen 12 11011 Stockholm');

-- Testdata for table 'common_species'

INSERT INTO common_species VALUES 
(NULL, 'Cat'),
(NULL, 'Gold Fish'),
(NULL, 'Dog');

-- Testdata for table 'sub_species'

INSERT INTO sub_species VALUES
(NULL, 1, 'Katt'),
(NULL, 2, 'Fish'),
(NULL, 3, 'Canis lupus familiaris'),
(NULL, 1, 'Felis Catus');

-- Testdata for table 'pets'

INSERT INTO pets VALUES 
(NULL, 3, 'Felix', '2010-12-30', 'Its a Dog!', 1, 'Dead'),
(NULL, 4, 'Tigger', '1756-05-12', 'Tigger is getting pretty old', 2, 'Alive'),
(NULL, 2, 'Nemo', '1989-12-11', 'He has no memory', 3, 'Alive');

-- Testdata for table 'manufacturers'

INSERT INTO manufacturers VALUES
(NULL, 'PetSounds', 'Skånegatan 53 11637 Stockholm'),
(NULL, 'PetManuFacu', 'Österlånggatan 43 11546 Stockholm'),
(NULL, 'Kalles Djuraffär', 'Gamla Råsundavägen 23 18917 Stockholm');

-- Testdata for table 'products'

INSERT INTO products VALUES
(NULL, 'DOG001', 'Dog leash', 1, 20, 50),
(NULL, 'CAT001', 'Cat leash', 2, 10, 20),
(NULL, 'FIS001', 'Aquarium', 3, 100, 400),
(NULL, 'DOG002', 'Dogfood', 3, 40, 250),
(NULL, 'CAT002', 'Catfood', 3, 35, 400);

-- Testdata for table 'contacts'

INSERT INTO contacts VALUES
(NULL, 1, 1, 'Alice', '+46701112233', 'Alice@Petsounds.com'),
(NULL, 2, 2, 'Bob', '+46702223344', 'bob@PetManuFacu.com'),
(NULL, 3, 3, 'Kalle', '+46703334455', 'Kalle@KallesDjuraffär.com');

INSERT INTO warehouses VALUES
(NULL, "Stockholm"),
(NULL, "Göteborg"),
(NULL, "Malmö");

INSERT INTO orders VALUES
(NULL, 1, "AWAITING", 1),
(NULL, 2, "FULFILLED", 2),
(NULL, 3, "CANCELLED", 2),
(NULL, 2, "AWAITING", 2),
(NULL, 2, "FULFILLED", 2),
(NULL, 1, "AWAITING", 1),
(NULL, 2, "AWAITING", 3),
(NULL, 3, "AWAITING", 3),
(NULL, 1, "AWAITING", 3),
(NULL, 1, "FULFILLED", 3),
(NULL, 1, "CANCELLED", 3);

-- Orders 7-9 will order more products than warehouse #3 (Malmö) has
-- Total order will be  id1: 4, id2: 1, id3: 5, id4: 4
-- Total in inventory   id1: 4, id2: 5, id3: 2, id4: 3

INSERT INTO ordered_products VALUES
(NULL, 1, 1, 1),
(NULL, 2, 1, 3),
(NULL, 3, 1, 2),
(NULL, 4, 1, 1),
(NULL, 5, 1, 3),
(NULL, 6, 1, 2),
(NULL, 7, 1, 3), -- This order and below are part of VG exercise
(NULL, 7, 2, 1),
(NULL, 7, 4, 2),
(NULL, 8, 1, 1),
(NULL, 8, 3, 5),
(NULL, 9, 4, 2),
(NULL, 10, 2, 50),
(NULL, 11, 3, 20);

INSERT INTO inventory VALUES
(NULL, 1, 1, 5),
(NULL, 1, 2, 6),
(NULL, 1, 3, 6),
(NULL, 1, 4, 4),
(NULL, 1, 5, 6),
(NULL, 2, 1, 3),
(NULL, 2, 2, 4),
(NULL, 2, 3, 2),
(NULL, 2, 4, 6),
(NULL, 2, 5, 3),
(NULL, 3, 1, 4), -- This inventory and below are part of VG exercise
(NULL, 3, 2, 5),
(NULL, 3, 3, 2),
(NULL, 3, 4, 3),
(NULL, 3, 5, 5);

INSERT INTO messages VALUES
(NULL, 1, 2, TRUE),
(NULL, 2, 1, TRUE),
(NULL, 1, 2, FALSE),
(NULL, 2, 1, FALSE),
(NULL, 3, 2, TRUE),
(NULL, 1, 1, TRUE);