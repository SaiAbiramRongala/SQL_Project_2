SELECT * FROM dbo.album$

--Q1) Who is the senior most employee as per job title?
SELECT TOP 1 * FROM employee$
ORDER BY levels DESC

--Q2) Which countries have teh most Invoices?
SELECT COUNT(billing_country) AS Count_Con,billing_country FROM invoice$
Group by billing_country
ORDER BY Count_Con DESC

--Q3) What are the top 3 values of Total invoices?
SELECT TOP 3 billing_country,total FROM invoice$
ORDER BY total DESC

--Q4) Which city has the best customers?
SELECT billing_city,SUM(total) as Total_Sum from invoice$
group by billing_city
order by SUM(total) desc

--Q5) Who is the best customer? (in terms of money spent)
SELECT TOP 1 customer$.customer_id, customer$.first_name,customer$.last_name,SUM(invoice$.total) as total_sum FROM customer$
JOIN invoice$ ON customer$.customer_id=invoice$.customer_id
group by customer$.customer_id
order by total_sum desc