select name, sum(amount) as total_money
from category
	join film_category using (category_id)
	join inventory using (film_id)
	join rental using (inventory_id)
	join payment using (rental_id)
group by category_id
order by total_money desc
limit 1;
