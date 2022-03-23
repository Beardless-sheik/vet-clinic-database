/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES
('Agumon','2020-02-03',0,true,'10.23'),
('Gabumon','2018-11-15',2,true,'8'),
('Pikachu', '2021-01-07',1,false, '15.04'),
('Devimon', '2017-05-12', 5, true, '11');

--Add data following instructions
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES
('Charmander.','2020-02-08',0,false,'-11'),
('Plantmon','2022-11-15',2,true,'-5.7'),
('Squirtle', '1993-04-02',3,false, '-12.13'),
('Angemon', '2005-06-12', 1, true, '-45'),
('Boarmon', '2005-06-07', 7, true, '20.4'),
('Blossom', '1998-10-13', 3, true, '17'),
('Ditto', '2022-05-14', 4, true, '22');

-- Add data to owners table
INSERT INTO owners (full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Add data to species table
INSERT INTO species (name) VALUES 
('Pokemon'), 
('Digimon');

-- Modify your inserted animals so it includes the species_id value:
-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals SET species_id = s.id FROM (SELECT id FROM species WHERE name LIKE 'Digimon') s WHERE name LIKE '%mon';
UPDATE animals SET species_id = s.id FROM (SELECT id FROM species WHERE name LIKE 'Pokemon') s WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id)
UPDATE animals SET owners_id = o.id FROM (SELECT id FROM owners WHERE full_name = 'Sam Smith') o WHERE name = 'Agumon';
UPDATE animals SET owners_id = o.id FROM (SELECT id FROM owners WHERE full_name = 'Bob') o WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = o.id FROM (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') o WHERE name IN ('Pikachu', 'Gabumon');
UPDATE animals SET owners_id = o.id FROM (SELECT id FROM owners WHERE full_name = 'Melody Pond') o WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = o.id FROM (SELECT id FROM owners WHERE full_name = 'Dean Winchester') o WHERE name IN ('Angemon', 'Boarmon');

-- Insert data into vets table
INSERT INTO vets(name,age,date_of_graduation) VALUES
('William Tatcher', 45,'2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness', 38,'2008-06-08');

-- Insert data into specialisations table
INSERT INTO specializations (species_id,vets_id) VALUES 
(1,5),
(2,7),
(1,7),
(2,8);

--Insert data into visits table 
INSERT INTO visits (animal_id,vet_id,date_visited) VALUES 
(1, 5, '2020-05-24'),
(1, 7, '2020-07-22'),
(2, 8, '2021-02-02'),
(3, 6, '2020-01-05'),
(3, 6, '2020-03-08'),
(3, 6, '2020-05-14'),
(4, 7, '2021-05-04'),
(9, 8, '2021-02-24'),
(16, 6, '2019-12-21'),
(16, 5, '2020-08-10'),
(16, 6, '2021-04-07'),
(11, 7, '2019-09-29'),
(12, 8, '2020-10-03'),
(12, 8, '2020-11-04'),
(13, 6, '2019-01-24'),
(13, 6, '2019-05-15'),
(13, 6, '2020-02-27'),
(13, 6, '2020-08-03'),
(14, 7, '2020-05-24'),
(14, 5, '2021-01-11');