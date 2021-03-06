/*Queries that provide answers to the questions from all projects.
  COMMENTS ARE RESULTS RUN on data inserted form schema only.
*/

SELECT * FROM animals WHERE name LIKE '%mon';

--  id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
-- ----+---------+---------------+-----------------+----------+-----------
--   1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--   2 | Gabumon | 2018-11-15    |               2 | t        |         8
--   4 | Devimon | 2017-05-12    |               5 | t        |        11
-- (3 rows)

SELECT name FROM animals WHERE CAST(to_char(date_of_birth, 'YYYY') AS INTEGER) BETWEEN 2016 AND 2019;

-- ---------
--  Gabumon
--  Devimon
-- (2 rows)

SELECT name FROM animals WHERE  neutered IS TRUE AND escape_attempts < 3;

--   name   
-- ---------
--  Agumon
--  Gabumon
-- (2 rows)

SELECT date_of_birth FROM animals WHERE name LIKE 'Agumon' OR name LIKE 'Pikachu';

--  date_of_birth 
-- ---------------
--  2020-02-03
--  2021-01-07
-- (2 rows)

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

--   name   | escape_attempts 
-- ---------+-----------------
--  Pikachu |               1
--  Devimon |               5
-- (2 rows)

SELECT * FROM animals WHERE neutered IS TRUE;

--  id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
-- ----+---------+---------------+-----------------+----------+-----------
--   1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--   2 | Gabumon | 2018-11-15    |               2 | t        |         8
--   4 | Devimon | 2017-05-12    |               5 | t        |        11
-- (3 rows)

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

--  id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
-- ----+---------+---------------+-----------------+----------+-----------
--   1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--   3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
--   4 | Devimon | 2017-05-12    |               5 | t        |        11
-- (3 rows)

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

--  id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
-- ----+---------+---------------+-----------------+----------+-----------
--   3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
--   4 | Devimon | 2017-05-12    |               5 | t        |        11
-- (2 rows)


-- Transactions

BEGIN;
UPDATE animals SET species =' unspecified';
-- UPDATE 11

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg |   species    
-- ----+-------------+---------------+-----------------+----------+-----------+--------------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 |  unspecified
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 |  unspecified
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 |  unspecified
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 |  unspecified
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 |  unspecified
--  10 | Plantmon    | 2022-11-15    |               2 | t        |      -5.7 |  unspecified
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 |  unspecified
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 |  unspecified
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 |  unspecified
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 |  unspecified
--  15 | Ditto       | 2022-05-14    |               4 | t        |        22 |  unspecified
-- (11 rows)

ROLLBACK;

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | 
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | 
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | 
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | 
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 | 
--  10 | Plantmon    | 2022-11-15    |               2 | t        |      -5.7 | 
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 | 
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 | 
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | 
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | 
--  15 | Ditto       | 2022-05-14    |               4 | t        |        22 | 
-- (11 rows)


BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- UPDATE 6

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | 
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 | 
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 | 
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | 
--  15 | Ditto       | 2022-05-14    |               4 | t        |        22 | 
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | digimon
--  10 | Plantmon    | 2022-11-15    |               2 | t        |      -5.7 | digimon
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | digimon
-- (11 rows)

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
-- UPDATE 5

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | digimon
--  10 | Plantmon    | 2022-11-15    |               2 | t        |      -5.7 | digimon
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | digimon
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | pokemon
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 | pokemon
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 | pokemon
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | pokemon
--  15 | Ditto       | 2022-05-14    |               4 | t        |        22 | pokemon
-- (11 rows)

COMMIT;
-- COMMIT

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | digimon
--  10 | Plantmon    | 2022-11-15    |               2 | t        |      -5.7 | digimon
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | digimon
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | pokemon
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 | pokemon
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 | pokemon
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | pokemon
--  15 | Ditto       | 2022-05-14    |               4 | t        |        22 | pokemon
-- (11 rows)

BEGIN;

DELETE FROM animals;
-- DELETE 11

SELECT * FROM animals;
--  id | name | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+------+---------------+-----------------+----------+-----------+---------
-- (0 rows)

ROLLBACK;
-- ROLLBACK

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | digimon
--  10 | Plantmon    | 2022-11-15    |               2 | t        |      -5.7 | digimon
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | digimon
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | pokemon
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 | pokemon
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 | pokemon
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | pokemon
--  15 | Ditto       | 2022-05-14    |               4 | t        |        22 | pokemon
-- (11 rows)

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';
-- DELETE 2

SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | digimon
--  12 | Angemon     | 2005-06-12    |               1 | t        |       -45 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | digimon
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | pokemon
--   9 | Charmander. | 2020-02-08    |               0 | f        |       -11 | pokemon
--  11 | Squirtle    | 1993-04-02    |               3 | f        |    -12.13 | pokemon
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | pokemon
-- (9 rows)

SAVEPOINT save1

UPDATE animals SET weight_kg = (weight_kg * -1);
SELECT * FROM animals;
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     -10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |        -8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |       -11 | digimon
--  12 | Angemon     | 2005-06-12    |               1 | t        |        45 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |     -20.4 | digimon
--   3 | Pikachu     | 2021-01-07    |               1 | f        |    -15.04 | pokemon
--   9 | Charmander. | 2020-02-08    |               0 | f        |        11 | pokemon
--  11 | Squirtle    | 1993-04-02    |               3 | f        |     12.13 | pokemon
--  14 | Blossom     | 1998-10-13    |               3 | t        |       -17 | pokemon
-- (9 rows)

ROLLBACK TO save1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
-- UPDATE 3

SELECT * FROM animals;                                            
--  id |    name     | date_of_birth | escape_attempts | neutered | weight_kg | species 
-- ----+-------------+---------------+-----------------+----------+-----------+---------
--   1 | Agumon      | 2020-02-03    |               0 | t        |     10.23 | digimon
--   2 | Gabumon     | 2018-11-15    |               2 | t        |         8 | digimon
--   4 | Devimon     | 2017-05-12    |               5 | t        |        11 | digimon
--  13 | Boarmon     | 2005-06-07    |               7 | t        |      20.4 | digimon
--   3 | Pikachu     | 2021-01-07    |               1 | f        |     15.04 | pokemon
--  14 | Blossom     | 1998-10-13    |               3 | t        |        17 | pokemon
--  12 | Angemon     | 2005-06-12    |               1 | t        |        45 | digimon
--   9 | Charmander. | 2020-02-08    |               0 | f        |        11 | pokemon
--  11 | Squirtle    | 1993-04-02    |               3 | f        |     12.13 | pokemon
-- (9 rows)

COMMIT;

-- Querries to answer the given questions

-- How many animals are there
SELECT COUNT(*) total_animals FROM animals;
-- ---------------
--              9
-- (1 row)

-- How many animals have never tried to escape?
SELECT COUNT(*) as never_escpaed FROM animals WHERE escape_attempts = 0;
--  never_escpaed 
-- ---------------
--              2
-- (1 row)

-- What is the average weight of animals?
SELECT AVG(weight_kg) as average_weight FROM animals;
--    average_weight    
-- ---------------------
--  16.6444444444444444
-- (1 row)

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered,SUM(escape_attempts) as Sum FROM animals GROUP BY neutered; 
--  neutered | sum 
-- ----------+-----
--  f        |   4
--  t        |  18
-- (2 rows)

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg) as max_weigth, MIN(weight_kg) AS min_weight FROM animals GROUP by species;
--  species | max_weigth | min_weight 
-- ---------+------------+------------
--  pokemon |         17 |         11
--  digimon |         45 |          8
-- (2 rows)

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) AS avg_escapes  FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;
--  species |    avg_escapes     
-- ---------+--------------------
--  pokemon | 3.0000000000000000
-- (1 row)

-- What animals belong to Melody Pond?
SELECT a.name AS animal, o.full_name AS owner FROM animals a LEFT JOIN owners o ON a.owners_id = o.id WHERE o.full_name = 'Melody Pond';
--   animal   |    owner    
-- ------------+-------------
--  Blossom    | Melody Pond
--  Squirtle   | Melody Pond
--  Charmander | Melody Pond
-- (3 rows)

-- List of all animals that are pokemon (their type is Pokemon).
SELECT a.name AS animal, s.name AS belongs_to FROM animals a LEFT JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon'; 
--    animal   | belongs_to 
-- ------------+------------
--  Pikachu    | Pokemon
--  Blossom    | Pokemon
--  Squirtle   | Pokemon
--  Charmander | Pokemon
-- (4 rows)

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT o.full_name AS owner, a.name AS animal FROM animals a RIGHT JOIN owners o ON a.owners_id = o.id;
--       owner      |   animal   
-- -----------------+------------
--  Sam Smith       | Agumon
--  Jennifer Orwell | Pikachu
--  Jennifer Orwell | Gabumon
--  Bob             | Devimon
--  Bob             | Plantmon
--  Melody Pond     | Charmander
--  Melody Pond     | Squirtle
--  Melody Pond     | Blossom
--  Dean Winchester | Angemon
--  Dean Winchester | Boarmon
--  Jodie Whittaker | 
-- (11 rows)

-- How many animals are there per species?
SELECT s.name AS specie, COUNT(a.*) AS total FROM animals a LEFT JOIN species s ON a.species_id = s.id GROUP BY s.name;
--  specie  | total 
-- ---------+-------
--  Pokemon |     4
--  Digimon |     6
-- (2 rows)

-- List all Digimon owned by Jennifer Orwell.
SELECT o.full_name AS owner , a.name AS animal, s.name AS specie FROM animals a RIGHT JOIN species s  ON s.id = a.species_id RIGHT JOIN owners o ON a.owners_id = o.id WHERE s.name LIKE 'Digimon' AND o.full_name LIKE 'Jennifer Orwell';
--       owner      | animal  | specie  
-- -----------------+---------+---------
--  Jennifer Orwell | Gabumon | Digimon
-- (1 row)

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name AS animal, o.full_name AS owned_by FROM animals a JOIN owners o ON a.owners_id = o.id WHERE o.full_name LIKE 'Dean Winchester' AND a.escape_attempts <= 0;
--  animal | owned_by 
-- --------+----------
-- (0 rows)

-- Who owns the most animals?
SELECT o.full_name AS owner, COUNT(a.*) AS total_animals FROM animals a RIGHT JOIN owners o ON a.owners_id = o.id GROUP BY o.full_name ORDER BY total_animals DESC LIMIT 1;
--     owner    | total_animals 
-- -------------+---------------
--  Melody Pond |             3
-- (1 row)

-- Who was the last animal seen by William Tatcher?
SELECT vets.name, animals.name, date_visited FROM vets JOIN visits ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id WHERE vets.name ='William Tatcher' ORDER BY visits.date_visited DESC LIMIT 1;
--       name       |  name   | date_visited 
-- -----------------+---------+--------------
--  William Tatcher | Blossom | 2021-01-11
-- (1 row)

--How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as total_animals from vets JOIN visits ON vets.id = visits.vet_id WHERE name='Stephanie Mendez';
--  total_animals 
-- ---------------
--              4
-- (1 row)

--List all vets and their specialties, including vets with no specialties.
SELECT 
	vets.name,
	species.name as specialization
from vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;
--        name       | specialization 
-- ------------------+----------------
--  William Tatcher  | Pokemon
--  Stephanie Mendez | Digimon
--  Stephanie Mendez | Pokemon
--  Jack Harkness    | Digimon
--  Maisy Smith      | 
-- (5 rows)

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name ,date_visited from animals 
JOIN visits ON animals.id= visits.animal_id JOIN vets ON vets.id=visits.vet_id
 WHERE vets.name= 'Stephanie Mendez' AND visits.date_visited BETWEEN '2020-04-01' AND '2020-08-30';
--   name   | date_visited 
-- ---------+--------------
--  Agumon  | 2020-07-22
--  Blossom | 2020-05-24
-- (2 rows)

--What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as total_visit from animals
JOIN visits ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY total_visit DESC
LIMIT 1;
--   name   | total_visit 
-- ---------+-------------
--  Boarmon |           4
-- (1 row)


--Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, date_visited FROM vets JOIN visits ON vets.id=visits.vet_id
JOIN animals ON animals.id= visits.animal_id WHERE vets.name ='Maisy Smith' ORDER BY visits.date_visited ASC LIMIT 1;
--     name     |  name   | date_visited 
-- -------------+---------+--------------
--  Maisy Smith | Boarmon | 2019-01-24
-- (1 row)

--Details for most recent visit: animal information, vet information, and date of visit.
SELECT
	date_visited,
	animals.date_of_birth as animal_dob,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg as animal_weight,
	vets.name as vet_name,
	vets.age as vet_age,
	vets.date_of_graduation
from visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
ORDER BY date_visited DESC
LIMIT 1;
--  date_visited | animal_dob | escape_attempts | neutered | animal_weight |     vet_name     | vet_age | date_of_graduation 
-- --------------+------------+-----------------+----------+---------------+------------------+---------+--------------------
--  2021-05-04   | 2017-05-12 |               5 | t        |            11 | Stephanie Mendez |      64 | 1981-05-04
-- (1 row)

--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
JOIN specializations ON specializations.vets_id = visits.vet_id
WHERE animals.species_id != specializations.species_id;
--  count 
-- -------
--      7
-- (1 row)


--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as specialization , COUNT(visits.animal_id) from visits
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY species.name ASC 
LIMIT 1;
--  specialization | count 
-- ----------------+-------
--  Digimon        |     6
-- (1 row)

-- First Query
EXPLAIN ANALYSE SELECT COUNT(*) FROM visits where animal_id = 4;

-- Added index on animal_id for visits table
CREATE INDEX vistsAnimal_Id_ascending ON visits(animal_id ASC);

--Second Query
EXPLAIN ANALYSE SELECT * FROM visits where vet_id = 2;

-- Added index on vet_id for visits table
CREATE INDEX vistsVet_Id_ascending ON visits(vet_id ASC);

--Third Query
EXPLAIN ANALYSE SELECT * FROM owners where email = 'owner_18327@mail.com';

-- Added index on email for owners table
CREATE INDEX owners_Email_ascending ON owners(email ASC);