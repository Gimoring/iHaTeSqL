CREATE TABLE addresses (
  id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
  -- id SERIAL PRIMARY KEY, -- Postgresql
  street VARCHAR(300) NOT NULL,
  house_number VARCHAR(50) NOT NULL,
  city_id INT NOT NULL
);

-- When using MySQL, adding REFERENCES directly in the line where you define a column will not work correctly (it will basically be ignored).
-- USE
-- CREATE TABLE some_table (
--   some_column_name VARCHAR(200),
--   FOREIGN KEY (some_column_name) REFERENCES other_table (other_column) ON DELETE ...
-- );
-- when working with MySQL and adding foreign key constraints.


CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
  -- id SERIAL PRIMARY KEY, -- Postgresql
  first_name VARCHAR(300) NOT NULL,
  last_name VARCHAR(300) NOT NULL,
  email VARCHAR(300) NOT NULL,
  -- address_id INT REFERENCES addresses (id)
  address_id INT, --MySQL
  FOREIGN KEY (address_id) REFERENCES addresses (id) -- MySQL
);

CREATE TABLE cities (
  id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
  -- id SERIAL PRIMARY KEY, -- Postgresql
  name VARCHAR(300) NOT NULL
);