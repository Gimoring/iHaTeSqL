CREATE TABLE conversation (
  user_name VARCHAR(100),
  employer_name VARCHAR(100),
  message TEXT,
  date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);