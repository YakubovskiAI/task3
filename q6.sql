select city_id, city, sum(active) as active_count,
	count(active) - sum(active) as inactive_count
from customer
	join address using (address_id)
	join city using (city_id)
group by city_id, city
order by inactive_count desc;
