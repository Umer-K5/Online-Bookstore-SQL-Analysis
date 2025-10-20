-- 1) Retrieve total number of books sold per genre
SELECT b.genre, SUM(o.quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.genre;

-- 2) Find average price of books in the "Fantasy" genre
SELECT AVG(price) AS Average_Price
FROM Books
WHERE genre = 'Fantasy';

-- 3) List customers with at least two orders
SELECT o.customer_id, c.name, COUNT(o.order_id) AS Order_Count
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

-- 4) Find most frequently ordered book
SELECT o.book_id, b.title, COUNT(o.order_id) AS Order_Count
FROM Books b
JOIN Orders o ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY Order_Count DESC
LIMIT 1;

-- 5) Top 3 most expensive Fantasy books
SELECT *
FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM Books b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.author;

-- 7) Cities of customers who spent over $30
SELECT DISTINCT c.city, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 30;

-- 8) Customer who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS Total_Spend
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_Spend DESC
LIMIT 1;

-- 9) Stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock,
       COALESCE(SUM(o.quantity), 0) AS Ordered_Quantity,
       b.stock - COALESCE(SUM(o.quantity), 0) AS Remaining_Quantity
FROM Books b
LEFT JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.book_id;
