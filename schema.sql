/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg NUMERIC(5,2),
    PRIMARY KEY(id)
);


ALTER TABLE animals
ADD species varchar(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(250),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals
DROP species;

ALTER TABLE animals
ADD species_id INT,
ADD CONSTRAINT fk_species
FOREIGN KEY(species_id) 
REFERENCES species(id);

ALTER TABLE animals
ADD owner_id INT,
ADD CONSTRAINT fk_owners
FOREIGN KEY(owner_id) 
REFERENCES owners(id);