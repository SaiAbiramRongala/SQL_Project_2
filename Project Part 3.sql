--Q9) Find how much amount spent by each customer on artists.
-- Write a query to return the customer name, artist name and total spent

WITH best_selling_artist AS (
	SELECT TOP 1 artist$.artist_id AS artist_id, artist$.name AS artist_name, SUM(invoice_line$.unit_price*invoice_line$.quantity) AS total_sales 
	FROM invoice_line$
	JOIN track$ on track$.track_id=invoice_line$.track_id
	JOIN album$ on album$.album_id=track$.album_id
	JOIN artist$ ON artist$.artist_id=album$.artist_id
	GROUP BY 1
	ORDER BY 3 DESC
)
SELECT c.customer_id,c.first_name,c.last_name,bsa.artist_name,SUM(il.unit_price*il.quantity) AS amount
FROM invoice$ i
JOIN customer$ c on c.customer_id=i.customer_id
JOIN invoice_line$ il on il.invoice_id=i.invoice_id
JOIN track$ t on t.track_id=il.track_id
JOIN album$ alb on alb.album_id=t.album_id
JOIN best_selling_artist bsa on bsa.artist_id=alb.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC


--Q10) Most popular genre country wise

WITH popular_genre AS
(
	SELECT TOP 1 COUNT(invoice_line$.quantity) AS purchases, customer$.country,genre$.name,genre$.genre_id
	FROM invoice_line$
	JOIN invoice$ on invoice$.invoice_id=invoice_line$.invoice_id
	JOIN customer$ on customer$.customer_id=invoice$.customer_id
	JOIN track$ on track$.track_id=invoice_line$.track_id
	JOIN genre$ on genre$.genre_id=track$.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC,1 DESC
)
SELECT * FROM popular_genre