DROP TABLE IF EXISTS space_cowboys;

CREATE TABLE space_cowboys (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  homeworld VARCHAR(255),
  fav_weapon VARCHAR(255)
);
