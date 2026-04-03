-- Q1: Create Schema
CREATE SCHEMA bookstore;
USE bookstore;

-- Q2 & Q3 & Q4: Create Tables with Constraints

-- Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE
);

-- Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    total_amount DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Sale_Items Table
CREATE TABLE Sale_Items (
    sale_item_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


-- Insert Authors
INSERT INTO Authors (name) VALUES 
('John Walker'),
('Kevin Hill'),
('Kimberly Allen'),
('Brenda Moore'),
('David Johnson'),
('Jennifer Brown'),
('James Davis'),
('Barbara Garcia'),
('Paul Martinez'),
('Nancy Anderson'),
('Jason Hernandez'),
('Sharon Lewis'),
('Christopher Hall'),
('Maria Young'),
('Brian King'),
('Laura Wright'),
('Ronald Lopez'),
('Amy Scott'),
('Mark Green'),
('Sandra Adams'),
('Steven Baker'),
('Carol Nelson'),
('George Carter'),
('Helen Mitchell'),
('Edward Perez'),
('Ruth Roberts'),
('Frank Turner'),
('Kathleen Phillips'),
('Larry Campbell'),
('Pamela Parker'),
('Scott Evans'),
('Katherine Edwards'),
('Eric Collins'),
('Deborah Stewart'),
('Jerry Sanchez'),
('Julie Morris'),
('Dennis Rogers'),
('Cynthia Reed'),
('Patrick Cook'),
('Rachel Morgan');

-- Insert Categories
INSERT INTO Categories (name) VALUES 
('Children Books'),
('Fiction Books'),
('Science Books'),
('Romance Books'),
('Adventure Books'),
('Horror Books'),
('History Books'),
('Technology Books'),
('Poetry Books'),
('Comics Books');

-- Insert Books
INSERT INTO Books (title, author_id, category_id, price, stock_quantity) VALUES 
('Silent Dreams', 2, 8, 27.96, 27),
('Golden Time Lies', 17, 9, 33.08, 11),
('Shadow of Life', 26, 3, 39.15, 20),
('Whispers in Space', 16, 6, 13.15, 21),
('Echoes of Time', 34, 3, 27.46, 14),
('Winds of Power', 20, 1, 27.44, 24),
('Tears of Glass', 9, 6, 13.45, 5),
('Storm and Flame', 8, 7, 38.63, 10),
('Voice of Secrets', 27, 2, 42.66, 9),
('Mystic Dawn', 24, 2, 45.03, 25),
('Rays of Hope', 21, 4, 32.86, 15),
('Ocean’s Whisper', 7, 7, 48.55, 6),
('Shadows Beneath', 10, 2, 21.48, 13),
('Nightfall Echo', 30, 3, 15.59, 12),
('Silent Fate', 15, 1, 16.57, 14),
('Falling Sky', 28, 4, 27.04, 18),
('Lost in Frost', 19, 1, 38.57, 21),
('Frozen Stars', 25, 5, 10.52, 15),
('Thunder Rise', 1, 4, 15.93, 30),
('Fire Within', 33, 6, 47.44, 13),
('Fate Rewritten', 12, 9, 22.68, 11),
('Dragon’s Breath', 38, 7, 48.24, 10),
('Haunted Light', 32, 6, 44.88, 17),
('Valley of Flames', 18, 10, 49.12, 11),
('Ashen Wings', 23, 5, 48.51, 9),
('Cursed Hearts', 13, 4, 24.18, 7),
('Twisted Tales', 6, 2, 46.03, 23),
('Hidden Worlds', 3, 10, 23.18, 12),
('Desert Mist', 4, 1, 48.61, 8),
('Crimson River', 11, 2, 37.21, 18),
('Beneath Waves', 35, 4, 36.83, 26),
('Glowing Embers', 5, 3, 45.08, 16),
('Broken Hour', 36, 8, 26.29, 14),
('Moonlit Trail', 14, 7, 47.73, 19),
('Whispers of Ice', 22, 10, 49.90, 13),
('Tangled Fate', 37, 5, 15.90, 7),
('Lurking Depths', 29, 6, 15.91, 20),
('Bright Sparks', 31, 9, 13.85, 10),
('Cracked Earth', 40, 8, 30.89, 17),
('Magic Veins', 39, 1, 21.54, 22),
('Rising Silence', 31, 10, 39.68, 28);

-- Insert Customers
INSERT INTO Customers (name, email, phone) VALUES 
('Amanda Davis', 'amanda.davis@example.com', '08124567891'),
('Brian Smith', 'brian.smith@example.com', '08124567892'),
('Carol Lee', 'carol.lee@example.com', '08124567893'),
('Daniel Martin', 'daniel.martin@example.com', '08124567894'),
('Eva Green', 'eva.green@example.com', '08124567895'),
('Frank White', 'frank.white@example.com', '08124567896'),
('Grace Moore', 'grace.moore@example.com', '08124567897'),
('Harry Young', 'harry.young@example.com', '08124567898'),
('Irene Hall', 'irene.hall@example.com', '08124567899'),
('Jack Brown', 'jack.brown@example.com', '08124567900'),
('Kelly Adams', 'kelly.adams@example.com', '08124567901'),
('Leo Turner', 'leo.turner@example.com', '08124567902'),
('Mia Lewis', 'mia.lewis@example.com', '08124567903'),
('Noah Clark', 'noah.clark@example.com', '08124567904'),
('Olivia Walker', 'olivia.walker@example.com', '08124567905'),
('Peter Allen', 'peter.allen@example.com', '08124567906'),
('Queen Scott', 'queen.scott@example.com', '08124567907'),
('Ryan King', 'ryan.king@example.com', '08124567908'),
('Sophia Mitchell', 'sophia.mitchell@example.com', '08124567909'),
('Tom Harris', 'tom.harris@example.com', '08124567910'),
('Uma Foster', 'uma.foster@example.com', '08124567911'),
('Victor Collins', 'victor.collins@example.com', '08124567912'),
('Wendy Cooper', 'wendy.cooper@example.com', '08124567913'),
('Xavier Reed', 'xavier.reed@example.com', '08124567914'),
('Yvonne Bailey', 'yvonne.bailey@example.com', '08124567915'),
('Zane Price', 'zane.price@example.com', '08124567916'),
('Amy Powell', 'amy.powell@example.com', '08124567917'),
('Ben Hughes', 'ben.hughes@example.com', '08124567918'),
('Chloe Ross', 'chloe.ross@example.com', '08124567919'),
('Dylan Rivera', 'dylan.rivera@example.com', '08124567920'),
('Ella Ward', 'ella.ward@example.com', '08124567921'),
('Finn Gray', 'finn.gray@example.com', '08124567922'),
('Gina Hayes', 'gina.hayes@example.com', '08124567923'),
('Hank Perry', 'hank.perry@example.com', '08124567924'),
('Isla James', 'isla.james@example.com', '08124567925'),
('Jake Brooks', 'jake.brooks@example.com', '08124567926'),
('Lily West', 'lily.west@example.com', '08124567927'),
('Mason Bell', 'mason.bell@example.com', '08124567928'),
('Nora Burns', 'nora.burns@example.com', '08124567929'),
('Owen Dean', 'owen.dean@example.com', '08124567930');

-- Insert Sales (40 random sales)
INSERT INTO Sales (customer_id, sale_date, total_amount) VALUES
(1, '2025-07-01', 55.92),
(2, '2025-07-02', 33.08),
(3, '2025-07-03', 45.15),
(4, '2025-07-04', 13.15),
(5, '2025-07-05', 80.92),
(6, '2025-07-06', 27.44),
(7, '2025-07-07', 60.63),
(8, '2025-07-08', 42.66),
(9, '2025-07-09', 90.06),
(10, '2025-07-10', 32.86),
(11, '2025-07-11', 97.10),
(12, '2025-07-12', 21.48),
(13, '2025-07-13', 31.18),
(14, '2025-07-14', 38.57),
(15, '2025-07-15', 52.60),
(16, '2025-07-16', 47.44),
(17, '2025-07-17', 22.68),
(18, '2025-07-18', 92.12),
(19, '2025-07-19', 48.51),
(20, '2025-07-20', 24.18),
(21, '2025-07-21', 46.03),
(22, '2025-07-22', 23.18),
(23, '2025-07-23', 48.61),
(24, '2025-07-24', 37.21),
(25, '2025-07-25', 36.83),
(26, '2025-07-26', 45.08),
(27, '2025-07-27', 52.29),
(28, '2025-07-28', 47.73),
(29, '2025-07-29', 49.90),
(30, '2025-07-30', 31.80),
(31, '2025-07-31', 15.91),
(32, '2025-08-01', 13.85),
(33, '2025-08-02', 30.89),
(34, '2025-08-03', 21.54),
(35, '2025-08-04', 79.36),
(36, '2025-08-05', 43.29),
(37, '2025-08-06', 28.68),
(38, '2025-08-07', 65.33),
(39, '2025-08-07', 52.12),
(40, '2025-08-07', 39.68);

-- Insert Sale_Items (matching with sales above)
INSERT INTO Sale_Items (sale_id, book_id, quantity, subtotal) VALUES
(1, 1, 2, 27.96),
(1, 2, 1, 15.99),
(2, 3, 1, 22.50),
(2, 4, 1, 10.58),
(3, 5, 2, 40.30),
(4, 6, 1, 13.15),
(5, 7, 1, 40.46),
(5, 8, 1, 40.46),
(6, 9, 1, 27.44),
(7, 10, 1, 30.31),
(7, 11, 1, 30.32),
(8, 12, 2, 42.66),
(9, 13, 2, 45.03),
(9, 14, 1, 45.03),
(10, 15, 1, 32.86),
(11, 16, 1, 48.55),
(11, 17, 1, 48.55),
(12, 18, 1, 21.48),
(13, 19, 1, 23.18),
(13, 20, 1, 8.00),
(14, 21, 1, 38.57),
(15, 22, 1, 26.30),
(15, 23, 1, 26.30),
(16, 24, 1, 47.44),
(17, 25, 1, 22.68),
(18, 26, 2, 46.06),
(18, 27, 1, 46.06),
(19, 28, 1, 48.51),
(20, 29, 1, 24.18),
(21, 30, 2, 46.03),
(22, 31, 1, 23.18),
(23, 32, 1, 48.61),
(24, 33, 1, 37.21),
(25, 34, 1, 36.83),
(26, 35, 1, 45.08),
(27, 36, 2, 52.29),
(28, 37, 1, 47.73),
(29, 38, 1, 49.90),
(30, 39, 2, 31.80),
(31, 40, 1, 15.91),
(32, 1, 1, 13.98),
(32, 3, 1, 13.87),
(33, 4, 2, 30.89),
(34, 5, 1, 21.54),
(35, 6, 2, 39.68),
(35, 7, 1, 39.68),
(36, 8, 1, 21.65),
(36, 9, 1, 21.64),
(37, 10, 1, 14.34),
(38, 11, 1, 32.66),
(38, 12, 1, 32.67),
(39, 13, 2, 52.12),
(40, 14, 1, 19.84),
(40, 15, 1, 19.84);
