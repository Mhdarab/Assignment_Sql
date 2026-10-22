SELECT first_name, last_name
FROM public.actor
WHERE first_name IN ('Nick', 'Ed', 'Jennifer');

-------------

SELECT last_name
FROM public.actor
WHERE first_name IN ('Nick', 'Ed', 'Jennifer');

-------------
SELECT *
FROM address;

-------------

SELECT district, phone
FROM address
ORDER BY district DESC, phone DESC;

-------------

SELECT
    film.film_id,
    film.title,
    inventory.inventory_id
FROM film
JOIN inventory
    ON film.film_id = inventory.film_id;

-------------

SELECT *
FROM inventory
JOIN rental
    ON inventory.inventory_id = rental.inventory_id
LIMIT 5;

-------------

SELECT
    rental.rental_id,
    rental.rental_date,
    payment.payment_id
FROM rental
JOIN payment
    ON rental.rental_id = payment.rental_id
ORDER BY payment.amount DESC
LIMIT 10;

-------------


SELECT *
FROM actor
WHERE actor_id IS NULL;

-------------

SELECT *
FROM actor
WHERE actor_id IS not NULL;

-------------

SELECT COUNT(*) AS total_films
FROM film
where film_id is not null;

-------------

SELECT SUM(amount) AS sum_amt
FROM payment;

-------------

SELECT
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM payment;








