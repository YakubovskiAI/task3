with q as (
	select rental_id, city, category.name, return_date - rental_date as rental_interval
	from rental
		join customer using (customer_id)
		join address using (address_id)
		join city using (city_id)
		join inventory using (inventory_id)
		join film_category using (film_id)
		join category using (category_id)
)
select * from (
	select q.name,  justify_hours(sum(rental_interval)) as total
	from q
	where city ILIKE 'a%'
	group by q.name
	order by total desc
	limit 1
) as q1
	
UNION ALL

select * from (
	select q.name,  justify_hours(sum(rental_interval)) as total
	from q
	where city LIKE '%-%'
	group by q.name
	order by total desc
	limit 1
) as q2
