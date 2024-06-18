select name, count(*) as amount
from category
	join film_category using (category_id)
group by category_id
order by amount desc;
