-- query1
select f.film_id,f.title from film f inner join film_category fc ON f.film_id=fc.film_id
where  f.rating ='PG-13' and fc.category_id =(select category_id from category where name = 'Comedy');


-- query5
select count(f.film_id) as no_films from film f inner join film_actor fa on f.film_id = fa.film_id
									inner join actor a on fa.actor_id = a.actor_id
                                    where a.first_name = "SEAN" and a.last_name = "WILLIAMS";
-- query 3
select distinct c.name,c.address,f.category,c.country from customer_list c 
inner join rental r on c.Id = r.customer_id
inner join inventory i on r.inventory_id = i.inventory_id
inner join film_list f on i.film_id = f.fid
where c.country = "India" and f.category = "Sports";

-- query 4
select distinct c.id,c.name,c.address,c.country,a.first_name,a.last_name 
from customer_list c 
inner join rental r on c.Id = r.customer_id
inner join inventory i on r.inventory_id = i.inventory_id
inner join film_list fl on i.film_id = fl.fid
inner join film_actor fa on fl.fid = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
where c.country = "Canada"
and a.first_name = "NICK"
and a.last_name = "WAHLBERG";

-- query 2
select f.film_id,f.title,count(r.rental_id) as no_rentals 
from film f 
inner join  film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id=c.category_id
inner join inventory i on f.film_id = i.film_id
inner join rental r on r.inventory_id = i.inventory_id
where c.name = "Horror" 
group by f.film_id 
order by no_rentals desc limit 3;


