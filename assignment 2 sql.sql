select actor_id, count(*) from film_actor
group by actor_id limit 5;

select release_year, count(film_id) from film
group by release_year;

select count(title) from film ;

select title, max(rental_rate) from film;
select title, min(rental_rate) from film;

select title, rental_rate from film;

select payment.customer_id, customer.first_name, customer.last_name, sum(amount) from payment
join customer on payment.customer_id = customer.customer_id
group by customer_id;

select title, max(rental_duration) from film;