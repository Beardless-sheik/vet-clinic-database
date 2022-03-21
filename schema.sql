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


