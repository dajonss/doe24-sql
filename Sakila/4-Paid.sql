--	4. Have all rentals been paid?
SELECT count(payment_id) as betalt, count(rental_id) as hyrt 
	FROM payment;
