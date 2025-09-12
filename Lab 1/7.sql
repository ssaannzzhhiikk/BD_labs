CREATE TABLE orders(
    order_id SERIAL,
    order_name VARCHAR(100),
    client_id INT,
    CONSTRAINT fk_client FOREIGN KEY (client_id)
            REFERENCES clients(client_id)
);