-- USUARIOS
--======================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CLIENTES
--======================
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    client_name VARCHAR(50) NOT NULL,
    client_email VARCHAR(150) NOT NULL,
    client_phone VARCHAR(20),

    UNIQUE (user_id, client_name),
    UNIQUE (user_id, client_email),
    UNIQUE (user_id, client_phone)
);

-- PROYECTOS
--======================
CREATE TABLE projects(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    client_id INTEGER NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
    project_title VARCHAR(50) NOT NULL,
    project_description VARCHAR(500),
    project_price DECIMAL(10, 2) NOT NULL DEFAULT 0,
    project_state VARCHAR(20) NOT NULL DEFAULT 'quotation' CHECK (project_state IN ('quotation', 'in_progress', 'revision', 'delivered', 'paid')),

    UNIQUE (user_id, project_title)
);

-- FACTURAS
--======================
CREATE TABLE invoices(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    invoice_name VARCHAR(50) NOT NULL,
    invoice_location VARCHAR(500) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    UNIQUE (project_id, invoice_name),
    UNIQUE (project_id, invoice_location)
);

--psql -U postgres -d freelance_manager -f database/schema.sql