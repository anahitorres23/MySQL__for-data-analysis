/* Project 
The company's insurance project is up for renewal and uderwriters need some updated info before they issue new policy.
*/

/*
-- 1. Need a list if all staff members, inluding their first and last names, email addresses, and the store identification where they work.
SELECT
first_name,
Last_name,
email,
store_id
FROM staff;
*/

/*
-- 2. Need seperate counts of inventory items held at each of your two stores
SELECT
store_id,
COUNT(inventory_id) AS count_inventory_items
FROM inventory
GROUP BY store_id;
*/

/*
-- 3. Need a count of active customers for each of the stores. separately.
SELECT
store_id,
COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active			-- COUNT(active) AS count_active,
FROM customer
GROUP BY store_id																-- WHERE active = 1 
																				-- ORDER BY store_id;
*/
/*
-- OR OTHER SOLUTION FOR #3
SELECT 																				
store_id,
COUNT(customer_id) AS active_customers
FROM customer
WHERE active = 1
GROUP BY store_id;
*/


/*
-- 4. Need to provide a count of all customer email addresses stored in the database
SELECT
COUNT(email) AS count_email
FROM customer;
*/

/*
NEED HELP
-- 5. Company interested on how diverse your film offering is as a means of understanding how likely you are to keep each customers engaged in the future. 
-- Provide a count of unique film titles you have in inventory at each store, then provide a count of the unique categories of films you provide.
SELECT 
COUNT(film.title) AS count_film_title,
inventory.store_id,
inventory.inventory_id
FROM film
INNER JOIN inventory
ON film.title = inventory.inventory_id
GROUP BY inventory.store_id;
*/
/*
-- solution for #5 they created two tables and did not merged
SELECT 
store_id,
COUNT(DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY store_id;

SELECT 
COUNT(DISTINCT name) AS unique_categories
FROM category;
/*

/*
-- 7. provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, and the avg all films you carry.
SELECT
ROUND(MIN(replacement_cost),2) as min_replacement_cost,
ROUND(MAX(replacement_cost),2) as max_replacement_cost,
ROUND(AVG(replacement_cost),2) as avg_replacement_cost
FROM film;
*/

/*
-- 6. provide the avg payment you process, as well as MAX payment you have processesd
SELECT 
ROUND(AVG(amount),2) AS avg_amount,
ROUND(MAX(amount),2) AS max_amount
FROM payment;
*/

/*
-- 8. provide a list of all customer identification values, with a count of rentals they have made all-time, with your highest volume customers at the top of the list.
SELECT DISTINCT customer_id,
COUNT(rental_id) AS count_rental
FROM rental
GROUP BY customer_id
ORDER BY COUNT(rental_id) DESC;
*/



