-- Count records in each table

SELECT 'artist' AS table_name, COUNT(*) AS record_count FROM artist
UNION ALL
SELECT 'album', COUNT(*) FROM album
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'track', COUNT(*) FROM track
UNION ALL
SELECT 'invoice', COUNT(*) FROM invoice;

-- Total revenue from all sales.

SELECT SUM(total) AS total_revenue FROM invoice;

-- Average purchase amount per invoice.

SELECT AVG(total) AS avg_invoice_amount FROM invoice;

-- Monthly revenue trends

SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS invoice_month, 
    SUM(Total) AS monthly_revenue
FROM invoice
GROUP BY invoice_month
ORDER BY invoice_month DESC;

-- Top 5 customers who spent the most.

SELECT 
    c.CustomerId,
	CONCAT(c.FirstName, ' ', c.LastName) AS customer_name,
    SUM(i.Total) AS total_spent
FROM customer c
JOIN invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total_spent DESC
LIMIT 5;

-- Revenue by country

SELECT 
    c.Country, 
    SUM(i.Total) AS total_revenue
FROM customer c
JOIN invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY total_revenue DESC;

-- The most popular genre based on the number of tracks sold.

SELECT 
    g.name AS genre,
    COUNT(il.quantity) AS tracks_sold
FROM genre g
JOIN track t ON g.GenreId = t.GenreId
JOIN invoiceline il ON t.TrackId = il.TrackId
GROUP BY g.GenreId
ORDER BY tracks_sold DESC;

-- Top 5 most sold tracks

SELECT 
    t.Name AS track_name, 
    SUM(il.Quantity) AS total_sales
FROM track t
JOIN invoiceline il ON t.TrackId = il.TrackId
GROUP BY t.TrackId
ORDER BY total_sales DESC
LIMIT 5;

-- Top 5 artists by number of tracks

SELECT 
    ar.Name AS artist_name, 
    COUNT(t.TrackId) AS total_tracks
FROM artist ar
JOIN album al ON ar.ArtistId = al.ArtistId
JOIN track t ON al.AlbumId = t.AlbumId
GROUP BY ar.ArtistId
ORDER BY total_tracks DESC
LIMIT 5;

-- The artist with the highest album sales.

SELECT 
    a.Name AS artist_name,
    SUM(il.quantity) AS total_tracks_sold
FROM artist a
JOIN album al ON a.ArtistId = al.ArtistId
JOIN track t ON al.AlbumId = t.AlbumId
JOIN invoiceline il ON t.TrackId = il.TrackId
GROUP BY a.ArtistId
ORDER BY total_tracks_sold DESC
LIMIT 1;

-- Albums with the highest total sales:

SELECT 
    al.Title AS album_title,
    ar.Name AS artist_name,
    SUM(il.Quantity) AS total_sales
FROM album al
JOIN artist ar ON al.ArtistId = ar.ArtistId
JOIN track t ON al.AlbumId = t.AlbumId
JOIN invoiceline il ON t.TrackId = il.TrackId
GROUP BY al.AlbumId
ORDER BY total_sales DESC
LIMIT 5;

-- Calculate each customer's lifetime value and categorize them into tiers

WITH customer_spending AS (
    SELECT 
        c.CustomerId,
        CONCAT(c.FirstName, ' ', c.LastName) AS customer_name,
        SUM(i.Total) AS total_spent
    FROM customer c
    JOIN invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
)
SELECT 
    customer_name,
    total_spent,
    CASE
        WHEN total_spent > 46 THEN 'High'
        WHEN total_spent BETWEEN 39 AND 46 THEN 'Medium'
        ELSE 'Low'
    END AS spending_tier
FROM customer_spending
ORDER BY total_spent DESC;

-- Determine the best-performing salesperson

SELECT 
    CONCAT(e.FirstName, ' ', e.LastName) AS employee_name,
    COUNT(i.InvoiceId) AS total_sales,
    SUM(i.total) AS total_revenue
FROM employee e
JOIN customer c ON e.EmployeeId = c.SupportRepId
JOIN invoice i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY total_revenue DESC;