-- when it comes to create a table 
CREATE users (
    full_name VARCHAR(300) NOT NULL,
    yearly_salary INT CHECK (yearly_salary > 0)
)

UPDATE users
SET yearly_salary = NULL
WHERE yearly_salary = 0;

ALTER TABLE users
ADD CONSTRAINT yearly_salary_positive CHECK (yearly_salary > 0);

-- doesn't work because of the CHECK constraint --
INSERT INTO users (full_name, yearly_salary, current_status)
VALUES ('Some User', -1000, 'unemployed');
------------------------------------------------------------