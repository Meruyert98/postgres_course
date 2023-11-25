/* 1) Написать запрос, который возвращает 2 колонки:
1. имя и фамилию актера через пробел.
2. кол-во фильмов, в которых снялся актер.

Нужно вывести вторую пятерку актеров (пять актеров, начиная с шестого) в порядке убывания кол-ва фильмов, в которых они снимались. */

select 
	a.first_name || ' ' || a.last_name as actor_name,
	count(*) as film_number
from actor a 
join film_actor fa using(actor_id)
group by 
	actor_name, 
	actor_id 
order by 
	film_number desc, 
	actor_id  
limit 5
offset 5;
