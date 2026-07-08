--DROP DATABASE IF EXISTS freelance_manager

CREATE DATABASE freelance_manager
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TEMPLATE = template0;

\c freelance_manager;

--psql -U postgres -f database/database.sql