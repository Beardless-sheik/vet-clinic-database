/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT  PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT,
  neutered BOOLEAN,   
  weight_kg DECIMAL
);

-- Add species column to animals table
ALTER TABLE animals
ADD species varchar(255);

-- Create owners table
DROP TABLE IF EXISTS owners;

CREATE TABLE owners(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INT
);

-- Create Species table
DROP TABLE IF EXISTS species;
CREATE TABLE species(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255)
);

-- Modify animals table:
-- Make sure that id is set as autoincremented PRIMARY KEY
-- Remove column species
ALTER TABLE animals DROP species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES species (id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD  owners_id INT;
ALTER TABLE animals ADD CONSTRAINT owners_id FOREIGN KEY (owners_id) REFERENCES owners(id);

