--Q6) Write query to return the email, first name, last name 
-- and genre of all rock music listeners. Return the list alphabetically by email

SELECT DISTINCT email,first_name,last_name FROM customer$
JOIN invoice$ ON customer$.customer_id=invoice$.customer_id
JOIN invoice_line$ ON invoice$.invoice_id=invoice_line$.invoice_id
WHERE track_id in(
	SELECT track_id from track$
	JOIN genre$ ON track$.genre_id=genre$.genre_id
	WHERE genre$.name LIKE 'Rock'
)
ORDER BY email 

--Q7) Write a query that returns the Artist name and total track count of the top 10 rock bands

SELECT TOP 10 artist$.artist_id,artist$.name,COUNT(artist$.artist_id) AS number_of_songs FROM track$
JOIN album$ on album$.album_id=track$.album_id
JOIN artist$ on artist$.artist_id=album$.artist_id
JOIN genre$ on genre$.genre_id=track$.genre_id
WHERE genre$.name LIKE 'Rock'
Group by artist$.artist_id
Order by number_of_songs desc

--Q8) Return the Name and Milliseconds for each track. Order by
-- the song length in desc order.

SELECT track$.name,track$.milliseconds FROM track$
ORDER BY track$.milliseconds DESC

