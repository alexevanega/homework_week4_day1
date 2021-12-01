-- 1. How many actors are there with the last name ‘Wahlberg’?
select first_name, last_name
from actor
WHERE last_name like 'Wahlberg';
--ANSWER - 2

-- 2. How many payments were made between $3.99 and $5.99?
SELECT amount, COUNT(amount)
FROM payment
where amount BETWEEN 3.99 and 5.99
GROUP BY amount
order by amount;
-- Answer - $3.99: 988, $4.99: 3424, $5.98: 7, $5.99: 1188 TOTAL = 5607

-- 3. What film does the store have the most of? (search in inventory)
-- SELECT film_id, count(film_id)
-- FROM inventory
-- group by film_id
-- order by count(film_id) DESC;

SELECT film_id, count(film_id)
from inventory
group by film_id
having count(film_id) = 8;

-- The most inventory there is of any movie is 8 and there are 72 movies in the database with an inventory of 8

-- 4. How many customers have the last name ‘William’?
SELECT count(last_name)
from customer
where last_name like 'William';

-- 0 customers have that last name

-- 5. What store employee (get the id) sold the most rentals?
select staff_id,count(staff_id)
from rental
group by staff_id
order by count(staff_id) desc;

select staff_id, first_name, last_name
from staff
where staff_id = 1;

--Employee #1 sold the most. His name is Mike Hillyer

-- 6. How many different district names are there?
SELECT count(DISTINCT district)
from address;


-- There are 378 different district names

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;

select title
from film
where film_id = 508;

--The film with the id of 508 had the most with 15. The movie is called Lambs Cincinatti

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select store_id, count(last_name)
from customer
where last_name like '%__es'
group by store_id
having store_id = 1;

-- 13 customers from store #1 have a last name ending in 'es'

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount,count(customer_id)
from payment
where customer_id between 380 and 430
group by amount
having count(customer_id) > 250
order by count(customer_id) desc;

-- There are 3 amounts with customer_ids between 380 and 430 with 250+ rentals: $2.99 - 290,
--$4.99 - 281, and $0.99 - 269

-- 10. Within the film table, how many rating categories are there? And what rating has the most 
-- movies total?
SELECT rating, count(rating)
from film
group by rating
order by count(rating) desc;

--There are 5 rating categories (G,PG,PG-13,R,NC-17). PG-13 has the most movies with 223.