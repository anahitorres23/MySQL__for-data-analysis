/* 
Normalization is the process of structuring the tables & columns in a relational database to minimize redundancy and perserve data integrity. Benefits include:
	- eliminating duplicate data
    -reducing errors and anomalies
CARDINALITY refers to the uniqueness of values in a column (or attribute) of a table & is commonly used yto describe how two tables relate ex:
	- one-to-one
    - one-to-many
    - many-to-many
Common JOIN types: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, UNION
	- INNER JOIN: returns records from BOTH tables when there us a match, and excludes unmatched records
    INNER JOIN righTableName ON leftTable.columnName = rightTable.columnName
    EX: 	FROM rental
			INNER JOIN customer
            ON rental.customer_id= customer.customer_id
*/


/*
SELECT DISTINCT
inventory.inventory_id         -- inventory_id must add inventory at the beginning to tell sql what table you're getting iventory_id from
FROM inventory
 INNER JOIN rental
 ON inventory.inventory_id = rental.inventory_id
 LIMIT 5000;
 */
 
 /*
 SELECT DISTINCT
rental_id        -- rental_id worked bc it only exists in the rental table and not inventory but good practice to specify as rental.rental_id
FROM inventory
 INNER JOIN rental
 ON inventory.inventory_id = rental.inventory_id
 LIMIT 5000;
 */
 
 /*
-- pull a list of each film we have in inventory
-- would like to see the film's title, description, and store_id value assoc with each item, and its inventory_id.
SELECT 
inventory.film_id, 			-- film_id column is in inventory table
inventory.store_id,			-- store_id column is in inventory table
film.title,					-- title column is in film table
film.description			-- description column is in film table
FROM inventory
	INNER JOIN film
    ON inventory.film_id = film.film_id 		-- order doesnt matter here
    
*/

/* 
LEFT JOIN  returns all records from the LEFT table, and any matches records from the RIGHT table 
IMPORTANT! what you'll use when you want additioal data from a secod table, and you want to keep ALL records from your first table (even if there is NOT a match)
LEFT JOIN rightTableName ON leftTable.columnName = rightTable.cloumnName
	EX:				FROM rental
					LEFT JOIN customer
                    ON rental.cutomer_id = customer.customer_id
LEFT vs  INNER JOIN
- while INNER JOIN returns results only when there is a match, LEFT JOIN returns any matches PLUS ALL RECORDS FROM THE LEFT TABLE (the first table named)
- INNER JOIN = more restrictive, and LEFT JOIN = more looser
*/

/*
SELECT DISTINCT
	inventory.inventory_id,
    rental.inventory_id
    FROM inventory
    LEFT JOIN rental
    ON inventory.inventory_id = rental.inventory_id
    LIMIT 5000;
    */
    
 /*   
    -- investor is interested in the films we carry and HOW MANY ACTORS are listed for each film title
    -- pull a list of all titles, and figure out how many actors are assoc with each title.
SELECT 															-- DISTINCT is unecessary
film.title,														-- actor.actor_id,
COUNT(film_actor.actor_id) AS count_of_actors
FROM film
LEFT JOIN film_actor 											-- actor
ON film_actor.film_id = film.film_id 							-- film.title = actor.actor_id;
GROUP BY film.title;

*/

/*
FULL JOIN : returns all records from BOTH tables when there is a match in either one of the tables
not really used

"BRIDGING" UNRELATED TABLES
	when need to connect two tables that do no directly relate, must find a third table containing keys
*/


/*
-- bridging tables
SELECT 
film.film_id,
film.title,
category.name AS category_name
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
*/

/*
-- customers often ask which films thier favorite actors appear in
-- create a list of all actors, w/ each title that they appear in.
SELECT
actor.first_name AS actor_first_name,
actor.last_name AS actor_last_name,
film.title AS film_title
FROM actor
INNER JOIN film_actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id;
*/

/*
-- manager from store 2 is working on expanding our film collection there
-- pull a list of distinct titles and their descriptions, currently available in inventory at store 2.
SELECT DISTINCT
film.title,
film.description
FROM film
INNER JOIN inventory
ON inventory.film_id = film.film_id
AND inventory.store_id = 2;
*/

/* 
UNION returns all data from the FIRST table, with all data from the SECOND table appended to the end
EX: 				SELECT first_name, last_name FROM advisor
					UNION 
                    SELECT first_name, last_name FROM investor
UNION allows you to combine the results of two or more SELECT statement into a single result set
"stacking" two results on top of each other to make one longer result set
Each SELECT statement must include the same # of columns, and stacked columns must share compatible formats
*/

/*
SELECT 
'1' AS type,
first_name,
last_name
FROM advisor

UNION

SELECT 'investor' AS type,
first_name,
last_name
FROM investor
*/

/*
-- pull list of all staff and advisor names, and include a column noting whether they are a staff memember or advisor.
SELECT 
'advisor' AS type,
first_name,
last_name
FROM advisor

UNION

SELECT 
'staff' AS type,
first_name,
last_name
FROM staff
*/


    
 
