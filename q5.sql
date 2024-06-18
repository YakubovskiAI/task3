with filmings_dense_rank as (
	select concat(last_name, ' ', first_name) as name,
		dense_rank() over (
			order by count(*) desc
		) as dense_rank_number
	from actor
		join film_actor using (actor_id)
		join film_category using (film_id)
		join category using (category_id)
	where category.name = 'Children'
	group by actor_id
	order by dense_rank_number
)
select name, dense_rank_number
from filmings_dense_rank
where dense_rank_number <=3;
