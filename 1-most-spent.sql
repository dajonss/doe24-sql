--1. Who's the customer who has spent the most?
SELECT InvoiceID, SUM(Total), FirstName, LastName 
	FROM Invoice 
	JOIN Customer USING (CustomerId) 
	GROUP BY CustomerId 
	ORDER BY SUM(Total) DESC 
	LIMIT 1;
