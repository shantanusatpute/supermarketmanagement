-- Create a database
CREATE DATABASE IF NOT EXISTS supermarket;

-- Use the database
USE supermarket;

-- Table for customers
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100)
);

-- Table for products
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    barcode VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    expiry_date DATE,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Table for categories
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Table for orders
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('placed', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'placed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table for order items
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table for payments
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE,
    payment_method ENUM('credit_card', 'debit_card', 'cash', 'paypal'),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Table for employees (optional, if applicable)
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- Table for inventory (optional, if managing inventory)
CREATE TABLE IF NOT EXISTS inventory (
    product_id INT UNIQUE,
    quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table for discounts (optional, if applying discounts)
CREATE TABLE IF NOT EXISTS discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    discount_percentage DECIMAL(5, 2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table for reviews and ratings (optional, if including customer reviews)
CREATE TABLE IF NOT EXISTS reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);





-- Sample data for categories
INSERT INTO categories (name) VALUES
    ('Fruits'),
    ('Vegetables'),
    ('Medicine'),
    ('Baby Care'),
    ('Stationary'),
    ('Beauty'),
    ('Gardening');

-- Sample data for products - Fruits
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('123456', 'Apple', 2.0, 50, '2024-05-01', 1),
    ('123457', 'Banana', 1.5, 100, NULL, 1),
    ('123458', 'Orange', 1.8, 60, '2024-04-20', 1),
    ('123459', 'Grapes', 3.5, 40, '2024-04-25', 1),
    ('123460', 'Strawberry', 2.2, 70, '2024-04-15', 1),
    ('123461', 'Watermelon', 6.0, 20, '2024-04-10', 1),
    ('123462', 'Mango', 2.5, 50, '2024-05-05', 1),
    ('123463', 'Pineapple', 3.0, 30, '2024-05-01', 1),
    ('123464', 'Kiwi', 1.7, 40, '2024-04-20', 1),
    ('123465', 'Peach', 2.3, 60, '2024-04-25', 1),
    ('123466', 'Pear', 1.9, 50, '2024-04-15', 1),
    ('123467', 'Plum', 2.0, 45, '2024-05-10', 1),
    ('123468', 'Cherry', 3.2, 55, '2024-05-05', 1),
    ('123469', 'Lemon', 1.2, 70, '2024-04-30', 1),
    ('123470', 'Lime', 1.4, 65, '2024-04-25', 1),
    ('123471', 'Coconut', 4.0, 25, '2024-05-15', 1),
    ('123472', 'Cranberry', 2.1, 60, '2024-05-20', 1),
    ('123473', 'Raspberry', 3.3, 35, '2024-05-10', 1),
    ('123474', 'Blueberry', 2.8, 40, '2024-05-05', 1),
    ('123475', 'Blackberry', 3.0, 30, '2024-05-10', 1),
    ('123476', 'Apricot', 2.2, 55, '2024-04-30', 1),
    ('123477', 'Guava', 2.1, 40, '2024-05-15', 1),
    ('123478', 'Dragonfruit', 4.5, 20, '2024-05-20', 1),
    ('123479', 'Passion Fruit', 3.8, 25, '2024-05-25', 1),
    ('123480', 'Fig', 2.6, 30, '2024-05-30', 1),
    ('123481', 'Papaya', 2.7, 35, '2024-06-05', 1),
    ('123482', 'Lychee', 3.0, 40, '2024-06-10', 1),
    ('123483', 'Jackfruit', 5.0, 20, '2024-06-15', 1),
    ('123484', 'Starfruit', 3.5, 25, '2024-06-20', 1),
    ('123485', 'Mulberry', 2.8, 30, '2024-06-25', 1),
    ('123486', 'Kiwi', 1.7, 35, '2024-07-01', 1),
    ('123487', 'Tangerine', 1.9, 40, '2024-07-05', 1),
    ('123488', 'Cantaloupe', 4.0, 20, '2024-07-10', 1),
    ('123489', 'Honeydew Melon', 3.5, 25, '2024-07-15', 1),
    ('123490', 'Boysenberry', 3.2, 30, '2024-07-20', 1),
    ('123491', 'Kumquat', 2.3, 35, '2024-07-25', 1),
    ('123492', 'Pomegranate', 3.5, 20, '2024-07-30', 1),
    ('123493', 'Nectarine', 2.6, 25, '2024-08-05', 1),
    ('123494', 'Mandarin Orange', 2.0, 30, '2024-08-10', 1),
    ('123495', 'Gooseberry', 3.0, 20, '2024-08-15', 1),
    ('123496', 'Persimmon', 2.8, 25, '2024-08-20', 1),
    ('123497', 'Blood Orange', 2.2, 30, '2024-08-25', 1),
    ('123498', 'Clementine', 1.5, 35, '2024-08-30', 1),
    ('123499', 'Quince', 3.2, 20, '2024-09-05', 1),
    ('123500', 'Cherimoya', 4.0, 25, '2024-09-10', 1);

-- Sample data for products - Vegetables
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('234567', 'Carrot', 1.0, 80, '2024-04-10', 2),
    ('234568', 'Tomato', 1.2, 70, '2024-04-15', 2),
    ('234568', 'Carrot', 1.0, 80, '2024-04-20', 2),
    ('234569', 'Tomato', 1.2, 70, '2024-04-25', 2),
    ('234570', 'Potato', 0.8, 90, '2024-04-15', 2),
    ('234571', 'Onion', 1.5, 60, '2024-05-10', 2),
    ('234572', 'Cabbage', 1.3, 50, '2024-05-05', 2),
    ('234573', 'Broccoli', 1.8, 40, '2024-05-15', 2),
    ('234574', 'Spinach', 1.6, 45, '2024-05-20', 2),
    ('234575', 'Bell Pepper', 2.0, 55, '2024-06-05', 2),
    ('234576', 'Cucumber', 1.2, 65, '2024-06-10', 2),
    ('234577', 'Lettuce', 1.4, 70, '2024-06-15', 2),
    ('234578', 'Zucchini', 1.7, 45, '2024-06-20', 2),
    ('234579', 'Eggplant', 1.6, 50, '2024-07-05', 2),
    ('234580', 'Garlic', 1.0, 80, '2024-07-10', 2),
    ('234581', 'Ginger', 2.0, 60, '2024-07-15', 2),
    ('234582', 'Radish', 1.1, 70, '2024-07-20', 2),
    ('234583', 'Celery', 1.5, 55, '2024-08-05', 2),
    ('234584', 'Asparagus', 2.2, 40, '2024-08-10', 2),
    ('234585', 'Mushroom', 2.5, 30, '2024-08-15', 2),
    ('234586', 'Green Bean', 1.9, 45, '2024-08-20', 2),
    ('234587', 'Sweet Potato', 1.3, 60, '2024-09-05', 2),
    ('234588', 'Cauliflower', 1.7, 50, '2024-09-10', 2),
    ('234589', 'Artichoke', 2.5, 35, '2024-09-15', 2),
    ('234590', 'Beetroot', 1.2, 65, '2024-09-20', 2),
    ('234591', 'Turnip', 1.1, 70, '2024-10-05', 2),
    ('234592', 'Fennel', 1.8, 40, '2024-10-10', 2),
    ('234593', 'Okra', 1.4, 55, '2024-10-15', 2),
    ('234594', 'Snow Pea', 2.0, 35, '2024-10-20', 2),
    ('234595', 'Kale', 1.6, 50, '2024-11-05', 2),
    ('234596', 'Romaine Lettuce', 1.7, 45, '2024-11-10', 2),
    ('234597', 'Brussels Sprout', 1.9, 40, '2024-11-15', 2),
    ('234598', 'Leek', 1.5, 55, '2024-11-20', 2),
    ('234599', 'Scallion', 1.0, 65, '2024-12-05', 2),
    ('234600', 'Water Spinach', 1.3, 60, '2024-12-10', 2),
    ('234601', 'Arugula', 2.2, 45, '2024-12-15', 2),
    ('234602', 'Rutabaga', 1.6, 50, '2024-12-20', 2),
    ('234603', 'Chard', 1.8, 40, '2025-01-05', 2),
    ('234604', 'Bok Choy', 1.5, 55, '2025-01-10', 2),
    ('234605', 'Collard Greens', 1.6, 50, '2025-01-15', 2),
    ('234606', 'Mustard Greens', 1.7, 45, '2025-01-20', 2),
    ('234607', 'Daikon', 1.4, 60, '2025-02-05', 2),
    ('234608', 'Parsnip', 1.3, 65, '2025-02-10', 2),
    ('234609', 'Radicchio', 1.9, 40, '2025-02-15', 2),
    ('234610', 'Endive', 1.5, 55, '2025-02-20', 2),
    ('234611', 'Jerusalem Artichoke', 2.0, 35, '2025-03-05', 2),
    ('234612', 'Yuca', 1.8, 50, '2025-03-10', 2),
    ('234613', 'Jicama', 1.7, 45, '2025-03-15', 2),
    ('234614', 'Yam', 1.4, 60, '2025-03-20', 2),
    ('234615', 'Rhubarb', 2.2, 35, '2025-04-05', 2),
    ('234616', 'Lotus Root', 1.9, 40, '2025-04-10', 2);

-- Sample data for products - Medicine
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('345678', 'Paracetamol', 5.0, 120, '2025-01-01', 3),
    ('345679', 'Ibuprofen', 7.0, 100, '2024-12-01', 3),
    ('345678', 'Paracetamol', 3.5, 100, '2024-06-01', 3),
    ('345679', 'Ibuprofen', 4.0, 80, '2024-06-10', 3),
    ('345680', 'Aspirin', 2.8, 90, '2024-07-05', 3),
    ('345681', 'Amoxicillin', 6.0, 50, '2024-07-15', 3),
    ('345682', 'Ciprofloxacin', 7.5, 60, '2024-08-01', 3),
    ('345683', 'Loratadine', 5.2, 70, '2024-08-10', 3),
    ('345684', 'Omeprazole', 8.0, 40, '2024-09-05', 3),
    ('345685', 'Metformin', 4.5, 80, '2024-09-15', 3),
    ('345686', 'Atorvastatin', 9.0, 45, '2024-10-01', 3),
    ('345687', 'Losartan', 6.8, 60, '2024-10-10', 3),
    ('345688', 'Simvastatin', 8.5, 50, '2024-11-05', 3),
    ('345689', 'Levothyroxine', 7.2, 55, '2024-11-15', 3),
    ('345690', 'Metoprolol', 6.5, 65, '2024-12-01', 3),
    ('345691', 'Prednisone', 5.7, 70, '2024-12-10', 3),
    ('345692', 'Cephalexin', 7.0, 60, '2025-01-05', 3),
    ('345693', 'Gabapentin', 6.3, 75, '2025-01-15', 3),
    ('345694', 'Albuterol', 4.8, 80, '2025-02-01', 3),
    ('345695', 'Hydrochlorothiazide', 5.5, 70, '2025-02-10', 3),
    ('345696', 'Tramadol', 8.2, 55, '2025-03-05', 3),
    ('345697', 'Fluticasone', 7.0, 65, '2025-03-15', 3),
    ('345698', 'Meloxicam', 6.5, 70, '2025-04-01', 3),
    ('345699', 'Doxycycline', 9.0, 50, '2025-04-10', 3),
    ('345700', 'Naproxen', 6.8, 60, '2025-05-05', 3),
    ('345701', 'Warfarin', 8.5, 45, '2025-05-15', 3),
    ('345702', 'Escitalopram', 7.2, 55, '2025-06-01', 3),
    ('345703', 'Furosemide', 5.9, 70, '2025-06-10', 3),
    ('345704', 'Venlafaxine', 6.5, 65, '2025-07-05', 3),
    ('345705', 'Citalopram', 7.0, 60, '2025-07-15', 3),
    ('345706', 'Amlodipine', 8.0, 55, '2025-08-01', 3),
    ('345707', 'Duloxetine', 9.2, 50, '2025-08-10', 3),
    ('345708', 'Pregabalin', 7.5, 60, '2025-09-05', 3),
    ('345709', 'Sildenafil', 6.0, 70, '2025-09-15', 3),
    ('345710', 'Montelukast', 5.7, 75, '2025-10-01', 3),
    ('345711', 'Tamsulosin', 6.3, 65, '2025-10-10', 3),
    ('345712', 'Fluoxetine', 5.8, 70, '2025-11-05', 3),
    ('345713', 'Metronidazole', 7.0, 60, '2025-11-15', 3),
    ('345714', 'Mirtazapine', 8.5, 45, '2025-12-01', 3),
    ('345715', 'Bupropion', 7.2, 55, '2025-12-10', 3),
    ('345716', 'Clonazepam', 6.5, 60, '2026-01-05', 3),
    ('345717', 'Alprazolam', 9.0, 50, '2026-01-15', 3),
    ('345718', 'Pantoprazole', 8.2, 55, '2026-02-01', 3),
    ('345719', 'Risperidone', 7.0, 65, '2026-02-10', 3),
    ('345720', 'Budesonide', 6.5, 70, '2026-03-05', 3),
    ('345721', 'Olanzapine', 8.0, 60, '2026-03-15', 3),
    ('345722', 'Quetiapine', 9.0, 55, '2026-04-01', 3),
    ('345723', 'Seroquel', 7.5, 50, '2026-04-10', 3),
    ('345724', 'Methylphenidate', 6.8, 60, '2026-05-05', 3),
    ('345725', 'Lisdexamfetamine', 8.5, 45, '2026-05-15', 3),
    ('345726', 'Dextroamphetamine', 7.2, 55, '2026-06-01', 3),
    ('345727', 'Aripiprazole', 6.5, 60, '2026-06-10', 3),
    ('345728', 'Zolpidem', 9.0, 50, '2026-07-05', 3),
    ('345729', 'Carvedilol', 8.2, 55, '2026-07-15', 3),
    ('345730', 'Lamotrigine', 7.0, 65, '2026-08-01', 3),
    ('345731', 'Topiramate', 6.5, 70, '2026-08-10', 3);
-- Sample data for products - Baby Care
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('456789', 'Diapers', 10.0, 200, NULL, 4),
    ('456790', 'Baby Shampoo', 8.0, 150, '2025-06-01', 4),
    ('456789', 'Baby Diapers (Small)', 7.5, 100, '2024-06-01', 4),
    ('456790', 'Baby Diapers (Medium)', 8.0, 80, '2024-06-10', 4),
    ('456791', 'Baby Diapers (Large)', 8.5, 90, '2024-07-05', 4),
    ('456792', 'Baby Wipes', 3.5, 120, '2024-07-15', 4),
    ('456793', 'Baby Powder', 4.0, 100, '2024-08-01', 4),
    ('456794', 'Baby Shampoo', 5.2, 110, '2024-08-10', 4),
    ('456795', 'Baby Soap', 3.0, 130, '2024-09-05', 4),
    ('456796', 'Baby Lotion', 4.5, 120, '2024-09-15', 4),
    ('456797', 'Baby Oil', 4.8, 110, '2024-10-01', 4),
    ('456798', 'Baby Cream', 5.0, 100, '2024-10-10', 4),
    ('456799', 'Baby Rash Cream', 6.0, 90, '2024-11-05', 4),
    ('456800', 'Baby Bath Tub', 15.0, 40, '2024-11-15', 4),
    ('456801', 'Baby Nail Clippers', 2.5, 80, '2024-12-01', 4),
    ('456802', 'Baby Hair Brush', 2.0, 90, '2024-12-10', 4),
    ('456803', 'Baby Thermometer', 10.0, 50, '2025-01-05', 4),
    ('456804', 'Baby Monitor', 30.0, 30, '2025-01-15', 4),
    ('456805', 'Baby Carrier', 25.0, 35, '2025-02-01', 4),
    ('456806', 'Baby Stroller', 50.0, 20, '2025-02-10', 4),
    ('456807', 'Baby Car Seat', 80.0, 25, '2025-03-05', 4),
    ('456808', 'Baby High Chair', 40.0, 30, '2025-03-15', 4),
    ('456809', 'Baby Playpen', 60.0, 15, '2025-04-01', 4),
    ('456810', 'Baby Swing', 70.0, 20, '2025-04-10', 4),
    ('456811', 'Baby Bouncer', 45.0, 25, '2025-05-05', 4),
    ('456812', 'Baby Crib', 100.0, 10, '2025-05-15', 4),
    ('456813', 'Baby Blanket', 12.0, 50, '2025-06-01', 4),
    ('456814', 'Baby Swaddle', 8.0, 60, '2025-06-10', 4),
    ('456815', 'Baby Bibs', 3.5, 70, '2025-07-05', 4),
    ('456816', 'Baby Socks', 2.0, 80, '2025-07-15', 4),
    ('456817', 'Baby Shoes', 10.0, 40, '2025-08-01', 4),
    ('456818', 'Baby Onesies', 7.0, 50, '2025-08-10', 4),
    ('456819', 'Baby Rompers', 8.0, 45, '2025-09-05', 4),
    ('456820', 'Baby Hats', 3.0, 60, '2025-09-15', 4),
    ('456821', 'Baby Mittens', 2.5, 70, '2025-10-01', 4),
    ('456822', 'Baby Booties', 4.0, 60, '2025-10-10', 4),
    ('456823', 'Baby Feeding Bottle (Small)', 5.0, 90, '2025-11-05', 4),
    ('456824', 'Baby Feeding Bottle (Medium)', 6.0, 80, '2025-11-15', 4),
    ('456825', 'Baby Feeding Bottle (Large)', 7.0, 70, '2025-12-01', 4),
    ('456826', 'Baby Pacifier', 3.0, 100, '2025-12-10', 4),
    ('456827', 'Baby Bottle Sterilizer', 20.0, 30, '2026-01-05', 4),
    ('456828', 'Baby Bottle Warmer', 15.0, 35, '2026-01-15', 4),
    ('456829', 'Baby Food Maker', 25.0, 25, '2026-02-01', 4),
    ('456830', 'Baby Diaper Bag', 18.0, 40, '2026-02-10', 4),
    ('456831', 'Baby Bath Seat', 12.0, 45, '2026-03-05', 4),
    ('456832', 'Baby Bath Thermometer', 8.0, 50, '2026-03-15', 4),
    ('456833', 'Baby Nasal Aspirator', 5.0, 60, '2026-04-01', 4),
    ('456834', 'Baby Medicine Dropper', 2.5, 70, '2026-04-10', 4),
    ('456835', 'Baby Teething Gel', 6.0, 55, '2026-05-05', 4),
    ('456836', 'Baby Teether', 4.0, 65, '2026-05-15', 4),
    ('456837', 'Baby Nail Scissors', 3.0, 70, '2026-06-01', 4),
    ('456838', 'Baby Bath Towel', 6.5, 60, '2026-06-10', 4),
    ('456839', 'Baby Bathrobe', 8.0, 55, '2026-07-05', 4),
    ('456840', 'Baby Bath Sponge', 2.0, 75, '2026-07-15', 4);

-- Sample data for products - Stationary
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('567890', 'Notebook', 2.5, 300, NULL, 5),
    ('567891', 'Pens', 1.0, 500, NULL, 5),
     ('556789', 'Ballpoint Pens (Pack of 10)', 5.0, 200, NULL, 5),
    ('556790', 'Gel Pens (Pack of 5)', 3.5, 150, NULL, 5),
    ('556791', 'Highlighter Pens (Pack of 4)', 4.0, 120, NULL, 5),
    ('556792', 'Permanent Marker Pens (Pack of 3)', 4.5, 130, NULL, 5),
    ('556793', 'Whiteboard Markers (Pack of 6)', 6.0, 100, NULL, 5),
    ('556794', 'Pencil Set (12 pencils)', 3.0, 180, NULL, 5),
    ('556795', 'Color Pencil Set (24 pencils)', 5.5, 150, NULL, 5),
    ('556796', 'Mechanical Pencils (Pack of 10)', 6.0, 120, NULL, 5),
    ('556797', 'Eraser (Pack of 6)', 2.5, 200, NULL, 5),
    ('556798', 'Correction Tape (Pack of 3)', 4.0, 150, NULL, 5),
    ('556799', 'Glue Stick (Pack of 4)', 3.0, 180, NULL, 5),
    ('556800', 'Liquid Glue (100ml)', 2.5, 150, NULL, 5),
    ('556801', 'Scissors', 3.0, 130, NULL, 5),
    ('556802', 'Ruler (30 cm)', 1.5, 200, NULL, 5),
    ('556803', 'Geometry Box Set', 8.0, 100, NULL, 5),
    ('556804', 'Compass', 2.0, 150, NULL, 5),
    ('556805', 'Protractor', 1.0, 200, NULL, 5),
    ('556806', 'Calculator', 10.0, 80, NULL, 5),
    ('556807', 'Stapler', 4.0, 120, NULL, 5),
    ('556808', 'Staple Pins (Pack of 1000)', 1.5, 150, NULL, 5),
    ('556809', 'Paper Clips (Pack of 200)', 2.0, 180, NULL, 5),
    ('556810', 'Binder Clips (Pack of 50)', 3.0, 150, NULL, 5),
    ('556811', 'Notebooks (Pack of 3)', 6.0, 120, NULL, 5),
    ('556812', 'Spiral Bound Notebooks (Pack of 5)', 8.0, 100, NULL, 5),
    ('556813', 'Composition Books (Pack of 2)', 5.0, 130, NULL, 5),
    ('556814', 'Drawing Sketchbooks (Pack of 2)', 7.0, 100, NULL, 5),
    ('556815', 'Legal Pads (Pack of 3)', 4.5, 150, NULL, 5),
    ('556816', 'Graph Paper (Pack of 100 sheets)', 3.0, 180, NULL, 5),
    ('556817', 'Construction Paper (Pack of 50 sheets)', 4.0, 150, NULL, 5),
    ('556818', 'Printer Paper (Pack of 500 sheets)', 7.0, 120, NULL, 5),
    ('556819', 'Sticky Notes (Pack of 8 pads)', 3.5, 180, NULL, 5),
    ('556820', 'Index Cards (Pack of 100)', 2.5, 150, NULL, 5),
    ('556821', 'Envelopes (Pack of 50)', 5.0, 120, NULL, 5),
    ('556822', 'Address Labels (Pack of 1000)', 3.0, 150, NULL, 5),
    ('556823', 'Shipping Labels (Pack of 500)', 4.0, 130, NULL, 5),
    ('556824', 'Whiteboard (Large)', 25.0, 60, NULL, 5),
    ('556825', 'Bulletin Board (Medium)', 20.0, 70, NULL, 5),
    ('556826', 'Cork Board (Small)', 15.0, 80, NULL, 5),
    ('556827', 'Desk Organizer', 10.0, 90, NULL, 5),
    ('556828', 'File Organizer', 8.0, 100, NULL, 5),
    ('556829', 'Desk Calendar', 5.0, 110, NULL, 5),
    ('556830', 'Wall Calendar', 7.0, 120, NULL, 5),
    ('556831', 'Desk Lamp', 15.0, 80, NULL, 5),
    ('556832', 'Desk Chair', 50.0, 40, NULL, 5),
    ('556833', 'Storage Box (Large)', 12.0, 90, NULL, 5),
    ('556834', 'Storage Box (Medium)', 8.0, 100, NULL, 5),
    ('556835', 'Storage Box (Small)', 5.0, 110, NULL, 5),
    ('556836', 'Desk Fan', 20.0, 70, NULL, 5),
    ('556837', 'USB Flash Drive (16GB)', 8.0, 100, NULL, 5),
    ('556838', 'USB Flash Drive (32GB)', 12.0, 80, NULL, 5),
    ('556839', 'External Hard Drive (1TB)', 50.0, 50, NULL, 5),
    ('556840', 'Wireless Mouse', 15.0, 80, NULL, 5);

-- Sample data for products - Beauty
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('678901', 'Shampoo', 4.0, 100, '2025-03-01', 6),
    ('678902', 'Face Cream', 6.0, 80, '2024-08-01', 6),
    ('656789', 'Moisturizing Cream', 10.0, 150, '2024-12-01', 6),
    ('656790', 'Facial Cleanser', 8.5, 200, '2024-11-01', 6),
    ('656791', 'Toner', 7.0, 180, '2024-10-01', 6),
    ('656792', 'Serum', 15.0, 120, '2024-09-01', 6),
    ('656793', 'Eye Cream', 12.0, 130, '2024-08-01', 6),
    ('656794', 'Face Oil', 18.0, 100, '2024-07-01', 6),
    ('656795', 'Sunscreen SPF 50+', 12.5, 150, '2024-06-01', 6),
    ('656796', 'Lip Balm', 5.0, 200, '2024-05-01', 6),
    ('656797', 'Cleansing Wipes (Pack of 30)', 6.0, 180, '2024-04-01', 6),
    ('656798', 'Makeup Remover', 8.0, 150, '2024-03-01', 6),
    ('656799', 'Micellar Water', 7.5, 200, '2024-02-01', 6),
    ('656800', 'Facial Scrub', 9.0, 150, '2024-01-01', 6),
    ('656801', 'Face Mask', 10.0, 120, '2023-12-01', 6),
    ('656802', 'Hair Shampoo', 12.0, 130, '2023-11-01', 6),
    ('656803', 'Hair Conditioner', 10.0, 150, '2023-10-01', 6),
    ('656804', 'Hair Mask', 15.0, 100, '2023-09-01', 6),
    ('656805', 'Hair Serum', 8.0, 180, '2023-08-01', 6),
    ('656806', 'Hair Oil', 10.0, 150, '2023-07-01', 6),
    ('656807', 'Hair Gel', 7.0, 120, '2023-06-01', 6),
    ('656808', 'Hair Spray', 8.0, 130, '2023-05-01', 6),
    ('656809', 'Hair Styling Cream', 9.0, 150, '2023-04-01', 6),
    ('656810', 'Hair Mousse', 6.0, 180, '2023-03-01', 6),
    ('656811', 'Hair Wax', 8.0, 150, '2023-02-01', 6),
    ('656812', 'Hair Color (Black)', 10.0, 120, '2023-01-01', 6),
    ('656813', 'Hair Color (Brown)', 10.0, 130, '2022-12-01', 6),
    ('656814', 'Hair Color (Blonde)', 10.0, 100, '2022-11-01', 6),
    ('656815', 'Hair Color (Red)', 10.0, 180, '2022-10-01', 6),
    ('656816', 'Nail Polish (Red)', 5.0, 150, '2022-09-01', 6),
    ('656817', 'Nail Polish (Pink)', 5.0, 200, '2022-08-01', 6),
    ('656818', 'Nail Polish (Purple)', 5.0, 180, '2022-07-01', 6),
    ('656819', 'Nail Polish (Blue)', 5.0, 100, '2022-06-01', 6),
    ('656820', 'Nail Polish Remover', 3.0, 130, '2022-05-01', 6),
    ('656821', 'Nail Care Kit', 8.0, 150, '2022-04-01', 6),
    ('656822', 'Eyeshadow Palette', 15.0, 180, '2022-03-01', 6),
    ('656823', 'Blush Palette', 12.0, 120, '2022-02-01', 6),
    ('656824', 'Highlighter Palette', 12.0, 130, '2022-01-01', 6),
    ('656825', 'Lipstick (Red)', 8.0, 100, '2024-12-01', 6),
    ('656826', 'Lipstick (Pink)', 8.0, 150, '2024-11-01', 6),
    ('656827', 'Lipstick (Nude)', 8.0, 180, '2024-10-01', 6),
    ('656828', 'Lipstick (Brown)', 8.0, 120, '2024-09-01', 6),
    ('656829', 'Lip Gloss', 6.0, 130, '2024-08-01', 6),
    ('656830', 'Mascara', 10.0, 100, '2024-07-01', 6),
    ('656831', 'Eyeliner', 7.0, 180, '2024-06-01', 6),
    ('656832', 'Eyebrow Pencil', 5.0, 150, '2024-05-01', 6),
    ('656833', 'Makeup Brushes Set', 20.0, 130, '2024-04-01', 6),
    ('656834', 'Makeup Sponges (Pack of 5)', 8.0, 100, '2024-03-01', 6),
    ('656835', 'Makeup Setting Spray', 12.0, 180, '2024-02-01', 6),
    ('656836', 'Makeup Primer', 10.0, 150, '2024-01-01', 6),
    ('656837', 'Makeup Fixer', 8.0, 130, '2023-12-01', 6),
    ('656838', 'False Eyelashes', 8.0, 180, '2023-11-01', 6),
    ('656839', 'Facial Steamer', 25.0, 100, '2023-10-01', 6),
    ('656840', 'Hair Straightener', 30.0, 150, '2023-09-01', 6);

-- Sample data for products - Gardening
INSERT INTO products (barcode, name, price, quantity, expiry_date, category_id) VALUES
    ('789012', 'Potting Soil', 8.0, 50, NULL, 7),
    ('789013', 'Plant Seeds', 3.5, 120, '2025-05-01', 7),
    ('756789', 'Garden Soil (5 kg)', 10.0, 200, NULL, 7),
    ('756790', 'Compost (Organic)', 8.5, 150, NULL, 7),
    ('756791', 'Potting Mix (All Purpose)', 7.0, 180, NULL, 7),
    ('756792', 'Fertilizer (NPK 20-20-20)', 15.0, 120, NULL, 7),
    ('756793', 'Pesticide (Organic)', 12.0, 130, NULL, 7),
    ('756794', 'Insecticide (Natural)', 18.0, 100, NULL, 7),
    ('756795', 'Fungicide (Biological)', 12.5, 150, NULL, 7),
    ('756796', 'Herbicide (Weed Killer)', 5.0, 200, NULL, 7),
    ('756797', 'Seeds (Vegetables)', 3.0, 300, NULL, 7),
    ('756798', 'Seeds (Flowers)', 4.0, 250, NULL, 7),
    ('756799', 'Seeds (Herbs)', 3.5, 280, NULL, 7),
    ('756800', 'Seedlings (Tomato)', 2.0, 200, NULL, 7),
    ('756801', 'Seedlings (Chili)', 2.5, 180, NULL, 7),
    ('756802', 'Seedlings (Lettuce)', 2.0, 220, NULL, 7),
    ('756803', 'Seedlings (Carrot)', 2.5, 200, NULL, 7),
    ('756804', 'Seedlings (Spinach)', 2.0, 180, NULL, 7),
    ('756805', 'Seedlings (Onion)', 2.5, 220, NULL, 7),
    ('756806', 'Seedlings (Potato)', 2.0, 200, NULL, 7),
    ('756807', 'Seedlings (Broccoli)', 2.5, 180, NULL, 7),
    ('756808', 'Seedlings (Cabbage)', 2.0, 220, NULL, 7),
    ('756809', 'Seedlings (Cauliflower)', 2.5, 200, NULL, 7),
    ('756810', 'Seedlings (Pepper)', 2.0, 180, NULL, 7),
    ('756811', 'Seedlings (Eggplant)', 2.5, 220, NULL, 7),
    ('756812', 'Seedlings (Zucchini)', 2.0, 200, NULL, 7),
    ('756813', 'Seedlings (Pumpkin)', 2.5, 180, NULL, 7),
    ('756814', 'Seedlings (Watermelon)', 2.0, 220, NULL, 7),
    ('756815', 'Seedlings (Cucumber)', 2.5, 200, NULL, 7),
    ('756816', 'Seedlings (Lemon)', 2.0, 180, NULL, 7),
    ('756817', 'Seedlings (Orange)', 2.5, 220, NULL, 7),
    ('756818', 'Seedlings (Apple)', 2.0, 200, NULL, 7),
    ('756819', 'Seedlings (Peach)', 2.5, 180, NULL, 7),
    ('756820', 'Seedlings (Pear)', 2.0, 220, NULL, 7),
    ('756821', 'Gardening Tools Set (5-piece)', 25.0, 100, NULL, 7),
    ('756822', 'Pruning Shears', 10.0, 150, NULL, 7),
    ('756823', 'Garden Hose (50 ft)', 20.0, 120, NULL, 7),
    ('756824', 'Watering Can (2 Gallon)', 15.0, 130, NULL, 7),
    ('756825', 'Garden Trowel', 8.0, 150, NULL, 7),
    ('756826', 'Garden Rake', 12.0, 180, NULL, 7),
    ('756827', 'Garden Fork', 10.0, 130, NULL, 7),
    ('756828', 'Garden Spade', 12.0, 150, NULL, 7),
    ('756829', 'Garden Hoe', 10.0, 120, NULL, 7),
    ('756830', 'Garden Gloves', 5.0, 180, NULL, 7),
    ('756831', 'Garden Kneeler Pad', 8.0, 150, NULL, 7),
    ('756832', 'Garden Apron', 7.0, 180, NULL, 7),
    ('756833', 'Garden Cart', 50.0, 100, NULL, 7),
    ('756834', 'Garden Wheelbarrow', 40.0, 130, NULL, 7),
    ('756835', 'Garden Sprayer', 15.0, 150, NULL, 7),
    ('756836', 'Garden Trellis', 18.0, 180, NULL, 7),
    ('756837', 'Garden Netting (5ft x 10ft)', 10.0, 120, NULL, 7),
    ('756838', 'Garden Fence (10ft)', 20.0, 150, NULL, 7),
    ('756839', 'Garden Bench', 30.0, 100, NULL, 7),
    ('756840', 'Garden Swing', 60.0, 130, NULL, 7);
