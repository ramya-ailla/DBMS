-- query1
select count(distinct f.film_id) from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c.name= "Documentary" and f.special_features like "%Deleted Scenes%";

-- query 2
select count(distinct f.film_id) from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on c.category_id = fc.category_id
inner join inventory i on f.film_id = i.film_id
inner join store s on i.store_id = s.store_id
inner join staff st on s.manager_staff_id = st.staff_id
where c.name= "Sci-fi" and st.first_name = "Jon" and st.last_name = "Stephens";

-- query 3
select c.name,sum(p.amount) as total_sales from payment p
inner join rental r on p.rental_id = r.rental_id
inner join inventory i on r.inventory_id = i.inventory_id
inner join film f on i.film_id = f.film_id
inner join film_category fc on fc.film_id = f.film_id
inner join category c on fc.category_id = c.category_id
where c.name = "Animation";

-- query 4
select cat.name as Category,count(cat.name) as Number_of_Movies
from category cat 
inner join film_category fc on cat.category_id = fc.category_id
inner join film f on fc.film_id = f.film_id
inner join inventory i on f.film_id = i.film_id
inner join rental r on r.inventory_id = i.inventory_id
inner join customer c on r.customer_id = c.customer_id
where c.first_name = "PATRICIA" and c.last_name = "JOHNSON"
group by cat.name 
order by Number_of_Movies desc limit 3;

-- query 5
select f.rating ,count(f.film_id) from film f
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join customer c on r.customer_id = c.customer_id
where c.first_name = "SUSAN" and c.last_name = "WILSON" and f.rating = "R";



