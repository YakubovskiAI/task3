select title
from film
	left join inventory using (film_id)
where inventory_id is NULL;
