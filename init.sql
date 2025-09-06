-- CREATE USER ishhh WITH PASSWORD 'ishhh';
-- ALTER USER ishhh WITH SUPERUSER;
-- CREATE DATABASE postgres;
-- GRANT ALL PRIVILEGES ON DATABASE postgres TO ishhh;

-- Create the ishhh user
CREATE USER ishhh WITH PASSWORD 'ishhh';

-- Make ishhh a superuser
ALTER USER ishhh WITH SUPERUSER;

-- Grant privileges on existing postgres database
GRANT ALL PRIVILEGES ON DATABASE postgres TO ishhh;