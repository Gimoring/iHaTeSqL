DROP TABLE users;
DROP TABLE employers;
DROP TABLE conversations;

-- CREATE TYPE employment_status AS ENUM('self-employed', 'employed', 'unemployed');

CREATE TABLE users (
    -- id SERIAL PRIMARY KEY, -- Postgresql
    id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    full_name VARCHAR(401) GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)),
    -- full_name VARCHAR(300) NOT NULL,
    yearly_salary INT CHECK (yearly_salary > 0),
    current_status ENUM('self-employed', 'employed', 'unemployed') -- MySQL
    -- current_status employment_status
);

CREATE TABLE employers (
    -- id SERIAL PRIMARY KEY, -- Postgresql
    id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
    company_name VARCHAR(300) NOT NULL,
    company_address VARCHAR(300) NOT NULL,
    yearly_revenue FLOAT CHECK(yearly_revenue > 0),
    is_hiring BOOLEAN DEFAULT FALSE
);

CREATE TABLE conversations (
    id SERIAL PRIMARY KEY, -- Postgresql
    -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
    user_id INT,
    employer_id INT,
    message TEXT NOT NULL
);

INSERT INTO employers (company_name, company_address, yearly_revenue, is_hiring)
VALUES ('Some Company Inc', 'Some Street 5, Mycity', 85.91, TRUE);

INSERT INTO employers (company_name, company_address, yearly_revenue, is_hiring)
VALUES ('Our Soft ', 'Some Street 1, cityBounga', 20.91, FALSE);

INSERT INTO users (first_name, last_name, yearly_salary, current_status)
VALUES ('Junpil', 'Byeon', 30000, 'self-employed');

INSERT INTO conversations (user_id, employer_id, message)
VALUES (1, 2, 'Hi there!');