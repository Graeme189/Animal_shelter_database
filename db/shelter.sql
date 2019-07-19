DROP TABLE animals
DROP TABLE owners

CREATE TABLE owners(
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
)

CREATE TABLE animals(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  admission_date INT4,
  owner_id REFERENCES owners(id) ON DELETE CASCADE
)
