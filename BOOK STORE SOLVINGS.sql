USE bookstore;

SELECT * FROM bookstore.authors;
SELECT * FROM bookstore.books;
SELECT * FROM bookstore.categories;
SELECT * FROM bookstore.customers;
SELECT * FROM bookstore.sale_items;
SELECT * FROM bookstore.sales;


-- List all books
SELECT b.title, a.name AS author, c.name AS category, b.price, b.stock_quantity
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Categories c ON b.category_id = c.category_id;


SELECT * FROM bookstore.categories;

-- All books in "Children Books"
SELECT b.title
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
WHERE c.name = 'Romance Books';

-- All sales with customer name and total amount
SELECT s.sale_id, s.sale_date, cu.name AS customer,
       SUM(si.quantity * b.price) AS total_amount
FROM Sales s
JOIN Customers cu ON s.customer_id = cu.customer_id
JOIN Sale_Items si ON s.sale_id = si.sale_id
JOIN Books b ON si.book_id = b.book_id
GROUP BY s.sale_id;

-- All items in a particular sale (sale_id = 25)
SELECT s.sale_id, b.title, si.quantity
FROM Sale_Items si
JOIN Books b ON si.book_id = b.book_id
JOIN Sales s ON si.sale_id = s.sale_id
WHERE s.sale_id = 25;

-- Total sales on '2025-08-02'
SELECT SUM(si.quantity * b.price) AS total_sales
FROM Sales s
JOIN Sale_Items si ON s.sale_id = si.sale_id
JOIN Books b ON si.book_id = b.book_id
WHERE s.sale_date = '2025-08-02';

-- Top 3 best-selling books
SELECT b.title, SUM(si.quantity) AS total_sold
FROM Sale_Items si
JOIN Books b ON si.book_id = b.book_id
GROUP BY b.book_id
ORDER BY total_sold DESC
LIMIT 3;

-- Customers with more than 1 purchase
SELECT c.name, COUNT(s.sale_id) AS total_purchases
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
HAVING total_purchases > 1;

-- Show stock levels
SELECT title, stock_quantity
FROM Books;


SELECT * FROM bookstore.authors;

-- Books by a specific author
SELECT b.title
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
WHERE a.name = 'Cynthia Reed';