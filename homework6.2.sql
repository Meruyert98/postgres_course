/* Все фильмы (film) нужно сгруппировать по рейтингу (film.rating). И для каждой группы вывести 3 поля:
- Название рейтинга (film.rating)
- Сколько всего фильмов с данным рейтингом
- Сколько фильмов с данным рейтингом и продолжительностью сдачи в аренду 5 или больше (film.rating_duration >= 5) */

select 
	f.rating,
	count(*),
	count(*) filter(where f.rental_duration >= 5)
from film f 
group by f.rating;

--Задания для повторения и закрепления пройденных тем

/*Запросите топ-3 стран с наибольшим количеством клиентов проката. 
Выведите 2 поля: страна(country.country), количество клиентов. Используйте join, count, limit. */
select
	c3.country,
	count(c.customer_id) as cust_number
from
	customer c
join address a
		using(address_id)
join city c2
		using(city_id)
join country c3
		using (country_id)
group by
	country
order by
	cust_number desc
limit 3;