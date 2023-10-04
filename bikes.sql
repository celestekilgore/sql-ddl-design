CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_timestamp TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL REFERENCES customers
);

CREATE TABLE models (
    code TEXT PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    base_price NUMERIC(10,2) NOT NULL
);
-- Order items/ different name to make clear
-- NULL means unknown, not empty
CREATE TABLE models_orders (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10,2) NOT NULL,
    note TEXT NOT NULL,
    model_id TEXT NOT NULL REFERENCES models,
    order_id INT NOT NULL REFERENCES orders
);

INSERT INTO models
(code, name, base_price)
VALUES
('FLY', 'The Flyer', 500),
('HAUL', 'The Big Haul', 600),
('SKIN', 'The Skinny', 700),
('BUD', 'Big Buddy', 800);