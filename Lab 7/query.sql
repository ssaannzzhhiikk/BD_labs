-- 1
CREATE INDEX idx_employees_last_name ON employees(last_name);

-- 2
CREATE INDEX idx_employees_dept_salary ON employees(department, salary);

-- 3
CREATE UNIQUE INDEX idx_employees_email_unique ON employees(email);

-- 4
CREATE INDEX idx_employees_lower_email ON employees(LOWER(email));

-- 5
CREATE INDEX idx_employees_dept_hash ON employees USING hash (department);

-- 6
CREATE INDEX idx_employees_salary_brin ON employees USING brin (salary);

-- 7
CREATE INDEX idx_employees_salary_partial ON employees(salary)
    WHERE salary > 1000;

-- 8
CREATE INDEX idx_rooms_area_gist ON rooms USING gist (area);

-- 9
CREATE INDEX idx_products_description_gin ON products USING gin (to_tsvector('english', description));

-- 10
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_order_items_quantity ON order_items(quantity);
CREATE INDEX idx_orders_order_total ON orders(order_total);
CREATE INDEX idx_order_items_orderid_quantity ON order_items(order_id, quantity);
