CREATE TABLE employers (
  company_name VARCHAR(100),
  company_address VARCHAR(250),
  -- yearly_revenue FLOAT(5, 2)  -- Approximation, 123.12 max, 12.1 lower than 5 digits still allowed 1234.12 is not allowed.
  yearly_revenue NUMERIC(5,2), -- Exact value, Allowed : 123.12, Not allowed : 12345.123
  is_hiring BOOLEAN DEFAULT FALSE
);