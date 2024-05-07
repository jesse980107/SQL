(select name as results
from Users
join MovieRating using(user_id)
group by user_id
order by count(rating) desc,name
limit 1)

union all

(select title as results
from Movies
join MovieRating using(movie_id)
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
group by title
order by avg(rating) desc,title
limit 1)