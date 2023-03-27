USE sakila;
#1-Create a query or queries to extract the information you think may be relevant for building the prediction model. It should include some film features and some rental features.

SELECT rental_id,category_id, special_features, title, rental_date, rental_duration, return_date, COUNT(rental_id) OVER (Partition by customer_id) popularity_score, IF(return_date between '2005-09-01' and '2005-09-30', "YES", "NO") AS 'rented_last_month'
FROM rental r
JOIN inventory i
USING(inventory_id)
JOIN film f
USING(film_id)
JOIN film_category
USING(film_id)
ORDER BY return_date DESC;

SELECT * from film_rent;

#Create a query to get the list of films and a boolean indicating if it was rented last month. This would be our target variable.

SELECT IF(return_date between '2005-09-01' and '2005-09-30', "YES", "NO") FROM film_rent;

