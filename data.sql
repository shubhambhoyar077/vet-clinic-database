/* Populate database with sample data. */


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-7', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);

-- Owners table 
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);
    
-- Specise Table 
INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

UPDATE animals
SET species_id = CASE
WHEN name LIKE '%mon' THEN (select id from species where name = 'Digimon')
ELSE (select id from species where name = 'Pokemon')
END;

UPDATE animals
SET owner_id = CASE
WHEN name = 'Agumon' THEN (select id from owners where full_name = 'Sam Smith')
WHEN name IN ('Gabumon', 'Pikachu') THEN (select id from owners where full_name = 'Jennifer Orwell')
WHEN name IN ('Devimon', 'Plantmon') THEN (select id from owners where full_name = 'Bob')
WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (select id from owners where full_name = 'Melody Pond')
WHEN name IN ('Angemon', 'Boarmon') THEN (select id from owners where full_name = 'Dean Winchester')
ELSE NULL
END;


INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations (species_id, vet_id)
SELECT species.id AS species_id, vets.id AS vet_id
FROM species, vets
WHERE (vets.name = 'William Tatcher' AND species.name = 'Pokemon')
   OR (vets.name = 'Stephanie Mendez' AND species.name IN ('Digimon','Pokemon'))
   OR (vets.name = 'Jack Harkness' AND species.name = 'Digimon');



INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT CASE
WHEN vets.name = 'William Tatcher' AND animals.name = 'Agumon' THEN animals.id, vets.id, '2020-05-24'
WHEN vets.name = 'Stephanie Mendez' AND animals.name = 'Agumon' THEN animals.id, vets.id, '2020-07-22'
WHEN vets.name = 'Jack Harkness' AND animals.name = 'Gabumon' THEN animals.id, vets.id, '2021-02-02'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Pikachu' THEN animals.id, vets.id, '2020-01-05'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Pikachu' THEN animals.id, vets.id, '2020-03-08'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Pikachu' THEN animals.id, vets.id, '2020-05-14'
WHEN vets.name = 'Stephanie Mendez' AND animals.name = 'Devimon' THEN animals.id, vets.id, '2021-05-04'
WHEN vets.name = 'Jack Harkness' AND animals.name = 'Charmander' THEN animals.id, vets.id, '2021-02-24'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Plantmon' THEN animals.id, vets.id, '2019-12-21'
WHEN vets.name = 'William Tatcher' AND animals.name = 'Plantmon' THEN animals.id, vets.id, '2020-08-10'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Plantmon' THEN animals.id, vets.id, '2021-04-07'
WHEN vets.name = 'Stephanie Mendez' AND animals.name = 'Squirtle' THEN animals.id, vets.id, '2019-09-29'
WHEN vets.name = 'Jack Harkness' AND animals.name = 'Angemon' THEN animals.id, vets.id, '2020-10-03'
WHEN vets.name = 'Jack Harkness' AND animals.name = 'Angemon' THEN animals.id, vets.id, '2020-11-04'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Boarmon' THEN animals.id, vets.id, '2019-01-24'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Boarmon' THEN animals.id, vets.id, '2019-05-15'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Boarmon' THEN animals.id, vets.id, '2020-02-27'
WHEN vets.name = 'Maisy Smith' AND animals.name = 'Boarmon' THEN animals.id, vets.id, '2020-08-03'
WHEN vets.name = 'Stephanie Mendez' AND animals.name = 'Blossom' THEN animals.id, vets.id, '2020-05-24'
WHEN vets.name = 'William Tatcher' AND animals.name = 'Blossom' THEN animals.id, vets.id, '2021-01-11'
FROM animals, vets;