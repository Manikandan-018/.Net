-- Create tables (hypothetical example)
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert some sample data
INSERT INTO users (user_id, username, email) VALUES
(1, 'JohnDoe', 'john.doe@example.com'),
(2, 'JaneSmith', 'jane.smith@example.com');

INSERT INTO orders (order_id, user_id, order_date, total_amount) VALUES
(101, 1, '2023-01-15', 50.00),
(102, 1, '2023-02-10', 75.50),
(103, 2, '2023-03-05', 30.25);

-- Select data from the tables
SELECT * FROM users;
SELECT * FROM orders;

drop table orders;
