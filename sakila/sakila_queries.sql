-- Use the sakila database
USE sakila;

-- 1a. Display the first and last names of all actors from the table actor.
SELECT first_name, last_name FROM actor;


-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
SELECT UPPER(CONCAT(first_name, " ", last_name)) AS 'Actor Name' from actor;


-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
SELECT actor_id, first_name, last_name FROM actor WHERE UPPER(first_name) = 'JOE';


-- 2b. Find all actors whose last name contain the letters GEN:
SELECT * FROM actor WHERE last_name LIKE '%GEN%';


-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
SELECT last_name, first_name FROM actor WHERE last_name like '%LI%' ORDER BY last_name, first_name;


-- 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');


-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
ALTER TABLE actor ADD COLUMN middle_name VARCHAR (45) AFTER first_name;


-- 3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.
ALTER TABLE actor CHANGE middle_name middle_name BLOB;


-- 3c. Now delete the middle_name column.
ALTER TABLE actor DROP COLUMN middle_name;


-- 4a. List the last names of actors, as well as how many actors have that last name.
SELECT last_name, count(last_name) AS last_name_count FROM actor GROUP BY last_name;


-- 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT a.last_name, a.last_name_count FROM 
	(
	SELECT last_name, count(last_name) AS last_name_count FROM actor GROUP BY last_name
    ) a
    WHERE a.last_name_count = 2;


-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
SELECT * from actor WHERE last_name = 'WILLIAMS' AND first_name = 'GROUCHO';

UPDATE actor SET first_name = 'HARPO' WHERE last_name = 'WILLIAMS' AND first_name = 'GROUCHO';

-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! 
-- In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, 
-- change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. 
-- BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)
UPDATE actor 
SET first_name = (
	CASE first_name
		WHEN 'HARPO' THEN 'GROUCHO'
        ELSE 'MUCHO GROUCHO'
	END
	)
WHERE last_name = 'WILLIAMS' AND first_name = 'HARPO';


-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html
SHOW CREATE TABLE address;


-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
SELECT s.first_name, s.last_name, a.address FROM staff s
INNER JOIN address a 
ON a.address_id = s.address_id

SELECT * FROM payment;

-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_cmount FROM payment p
INNER JOIN staff s
ON p.staff_id = s.staff_id
WHERE p.payment_date LIKE '2005-08%'
GROUP BY p.staff_id
;


-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
SELECT f.film_id, f.title, COUNT(fa.actor_id) AS count_of_actors 
FROM film f 
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY fa.film_id
;


-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT COUNT(*) FROM inventory
WHERE film_id IN (
	SELECT film_id from film WHERE title = 'Hunchback Impossible'
    )
;


-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount) as total_amount_paid
FROM customer c
INNER JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name
;

-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
-- Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT f.title FROM film f
WHERE f.language_id = (
	SELECT language_id FROM language l WHERE l.name = 'English'
    )
AND (f.title like 'K%' OR f.title LIKE 'Q%')
;


-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT a.first_name, a.last_name from actor a
WHERE a.actor_id IN (
	SELECT fa.actor_id FROM film_actor fa
	WHERE film_id IN (
		SELECT film_id FROM film WHERE title = 'Alone Trip'
		)
	)
;


-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. 
-- Use joins to retrieve this information.
SELECT c.first_name, c.last_name, c.email FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
WHERE a.city_id IN (
	SELECT ci.city_id from city ci
	INNER JOIN country co
	ON ci.country_id = co.country_id
	WHERE co.country = 'Canada'
	)
;


-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as famiy films.
SELECT f.title FROM film f
WHERE f.film_id IN (
	SELECT fc.film_id FROM film_category fc WHERE fc.category_id = (
		SELECT c.category_id from category c WHERE c.name = 'Family'
		)
	)
;


-- 7e. Display the most frequently rented movies in descending order.
SELECT f.title, SUM(frequency) AS rental_frequency 
FROM 
	(SELECT r.inventory_id, COUNT(r.inventory_id) AS frequency FROM rental r
	GROUP BY r.inventory_id
	ORDER BY frequency DESC) AS freq, 
    inventory i, 
    film f
WHERE freq.inventory_id = i.inventory_id
AND i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rental_frequency DESC
;

-- 7f. Write a query to display how much business, in dollars, each store brought in.
SELECT store.store_id, sum(sales) AS total_sales 
FROM
	(select staff_id, sum(amount) as sales from payment
	group by staff_id) as sales,
    staff,
    store
WHERE sales.staff_id = staff.staff_id 
AND staff.store_id = store.store_id
GROUP BY store.store_id


-- 7g. Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, c.city, co.country
FROM store s, address a, city c, country co
WHERE s.address_id = a.address_id
AND a.city_id = c.city_id
AND c.country_id = co.country_id


-- 7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: 
-- category, film_category, inventory, payment, and rental.)
SELECT c.name AS genre, SUM(fr.revenue) AS gross_revenue
FROM 
	(SELECT i.film_id, SUM(sales.amount) AS revenue
	FROM 
		(SELECT sum(amount) amount, inventory_id
		FROM payment p, rental r
		WHERE p.rental_id = r.rental_id
		GROUP BY r.inventory_id) AS sales,
		inventory i
	WHERE i.inventory_id = sales.inventory_id
	GROUP BY i.film_id ) AS fr,
    film_category fc,
    category c
WHERE fr.film_id = fc.film_id
AND fc.category_id = c.category_id
GROUP BY c.category_id
ORDER BY gross_revenue DESC
;


-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. 
-- Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
CREATE VIEW top_five_genres (id, genre, revenue)
AS 	
	SELECT c.category_id, c.name AS genre, SUM(fr.revenue) AS gross_revenue
	FROM 
		(SELECT i.film_id, SUM(sales.amount) AS revenue
		FROM 
			(SELECT sum(amount) amount, inventory_id
			FROM payment p, rental r
			WHERE p.rental_id = r.rental_id
			GROUP BY r.inventory_id) AS sales,
			inventory i
		WHERE i.inventory_id = sales.inventory_id
		GROUP BY i.film_id ) AS fr,
		film_category fc,
		category c
	WHERE fr.film_id = fc.film_id
	AND fc.category_id = c.category_id
	GROUP BY c.category_id
	ORDER BY gross_revenue DESC
    LIMIT 5
;


-- 8b. How would you display the view that you created in 8a?
SELECT * FROM top_five_genres;


-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
DROP VIEW top_five_genres;
