select concat(last_name, ' ', first_name) as name, count(*) as rental_count
from actor
	join film_actor using (actor_id)
	join inventory using (film_id)
	join rental using (inventory_id)
group by actor_id
order by rental_count desc
limit 10;
