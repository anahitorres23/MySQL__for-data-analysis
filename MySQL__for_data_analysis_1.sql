/*
SELECT -- creating query to pull all payments for cusomters 42, 53, 60, 75 plus payments > $5 from ANY customer
customer_ID, 
rental_ID,
amount,
payment_date
FROM payment
WHERE amount > 5.00 -- customer_id = 42 (incorrect bc first we're doing payments > $5 for ANY customer)
OR customer_id = 42 -- AND customer_id = 53 (incorrect bc we want to query OR bc it's exculding that >$5 rule for those specific customers)
OR customer_id = 53 -- AND customer_id = 60 ("")
OR customer_id = 60 -- AND customer_id = 75  ("")
OR customer_id = 75; -- OR amount >= 5.00; ("") >>> when ran it was successful<<<
-- TO SAVE TIME AND CONDENSE THIS "OR" QUERY WE CAN INSTEAD USE "IN" EX: OR customer_id IN (42,53,60,75)
*/ 

/*
-- create a query to understand the special features in films that include 'behind the scene' special feature.
SELECT
title, special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes%'; -- successful
*/

/*
-- create a query on how long the movies tend to be rented out for, by pulling a 'count of titles' sliced by 'rental duration'
SELECT
rental_duration, -- need to pull info from table
COUNT(title) AS films_with_this_rental_duration -- counting the films so you can do that by title or 'film_id'
FROM film
GROUP BY rental_duration; -- specify how you want your result set to be grouped. 
-- takes rows with the same value, and makes them into piles.
*/

/*
-- create query to see if we charge more for a rental when the replacement cost is higher
SELECT -- pull a count of films, avg, min, max, max rental rate grouped by replacement cost
COUNT(film_id) AS number_of_films,
AVG(rental_rate) AS average_rental,-- AVG(rental_duration) AS average_rental, (we dont care how long it was rented for but for how much$)
MIN(rental_rate) AS cheapest_rental, -- MIN(rental_duration) AS cheapest_rental_duration, ("")
MAX(rental_rate) AS most_expensive_rental, -- MAX(rental_duration) AS most_expensive_rental_duration, ("")
replacement_cost
FROM film
GROUP BY replacement_cost; -- always include your GROUP BY column ex: replacement_cost' in the SELECT function.
*/

/*
-- create query to see what customer who have not rented much from us 
SELECT -- pull a list of customer_ids w/ less than 15 rentals all-time
customer_id, -- the customers
COUNT(rental_id) AS total_rental -- rental_id is how many times each customers rented
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 15; -- comes after GROUP BY & before ORDER BY. limits results to groups "group with in a group".
-- filters the piles
*/

/*
-- create query to see if our longest filmsa slo tend to be the most expensive
SELECT -- pull a list of all film titles plus thier lengths & rental rates, and sort them from longest to shortest
title,
length,
rental_rate
FROM film
ORDER BY length DESC; 
-- How to sort the records in your results
*/
-- s, f, w, g, h, o

/*
CASE WHEN logic1 THEN value1 WHEN logic2 THEN vale2 ELSE value3 END
EX:
CASE --contains at least one then/when pair						-
	WHEN category IN ('horror', 'suspense') THEN 'too scary'     -
    WHEN length > 90 THEN 'too long'							 -   logic1THEN value1 WHEN logic2
    ELSE 'we should see it'									   -
END															-
*/

/*
SELECT DISTINCT
length,
CASE
WHEN length < 60 THEN 'under 1 hr'
WHEN length BETWEEN 6 AND 90 THEN '1-1.5 hrs'
WHEN length >90 THEN 'over 1.5 hrs'
ELSE 'uh oh...check logic!'
END As length_bucket
FROM film;
*/

/*
-- create movie recommendations for my niece
SELECT DISTINCT
title,
CASE
WHEN rental_duration <= 4 THEN 'rental_too_short' -- rental is less than 4 days 
WHEN rental_rate >= 3.99 THEN 'too_expensive'
WHEN rating IN ('NC-17', 'R') THEN 'too_adult'
WHEN length NOT BETWEEN 60 AND 90 THEN 'too_short_or_too_long'
WHEN description LIKE '%Shark%' THEN 'nope_has_sharks'
ELSE 'great_recom_for_my_niece'
END AS fit_for_recommendation
FROM film;
*/

/*
-- create query to know which store each customer goes to, & whether or not they're active.
-- pull a list of first and last names of all customers and label then as either 'store 1 active', 'store 1 inactive', 'store 2 active', or 'store 2 inactive'.
SELECT DISTINCT
first_name,
last_name,
CASE
WHEN store_id = 1 AND active = 1 THEN 'store 1 active'							-- customer_id IN ('store_id', 'active') THEN 'store 1 active'
WHEN store_id = 1 AND active = 0 THEN 'store 1 inactive'						-- customer_id IN ('store_id') THEN 'store 2 active'
WHEN store_id = 2 AND active = 1 THEN 'store 2 active'							-- customer_id IN ('inactive') THEN 'store 2 inactive'
WHEN store_id = 2 AND active = 0 THEN 'store 2 inactive'
ELSE 'uh oh... check logic!'
END AS store_and_status
FROM customer;
*/

/*
-- example of a case pivot in action
SELECT 
film_id,
COUNT(CASE WHEN store_ID = 1 THEN inventory_id ELSE NULL END) AS store_1_copies,			-- for items held at store 1, we'll return thier inventory_id. for items not at store 1, we return NULL
COUNT(CASE WHEN store_ID = 2 THEN inventory_id ELSE NULL END) AS store_2_copies,			-- for items held at store 2, we'll return thier inventory_id. for items not at store 2, we return NULL
COUNT(inventory_id) AS total_copies
FROM inventory
GROUP BY
film_id
ORDER BY film_id;
*/

/*
-- create query on how many inactive customers we have at each store
-- create a table to count the #  of customers broken down by store_id (in rows) and active status (in columns)
SELECT 
store_id,
COUNT(CASE WHEN active = 1 THEN customer_ID ELSE NULL END) AS active,
COUNT(CASE WHEN active = 0 THEN customer_ID ELSE NULL END) AS inactive
FROM customer
GROUP BY
store_id;
*/


