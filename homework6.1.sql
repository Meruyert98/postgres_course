/* 1. Получить список названий всех фильмов (film.title), рекомендованных для просмотра самыми маленькими зрителями.
Для этого нужно объединить результаты выполнения двух запросов:
	1. получить все фильмы (film) с рейтингом G (film.rating = 'G')
	2. получить все фильмы (film), в которых снимался актер с фамилией Grant (actor.last_name = 'Grant'), 
	поскольку этот актер по умолчанию снимается только в фильмах для самых маленьких вне зависимости от проставленного рейтинга.

Если какой-то фильм попадет в оба запроса, то его нужно вывести дважды. Решить задачу с использованием union/union all/except/intersect */
select
	f.title,
	f.rating
from
	film f
where
	f.rating = 'G'
union all 
select
	f.title,
	f.rating
from
	actor a
join film_actor fa
		using(actor_id)
join film f
		using(film_id)
where
	a.last_name = 'Grant';


/* 2. Получить список названий всех фильмов (film.title) с рейтингом G (film.rating = 'G'), 
 в которых снимался актер с фамилией Grant (actor.last_name = 'Grant'). 
 Решить задачу с использованием union/union all/except/intersect*/
select
	f.title
from
	film f
where
	rating = 'G'
intersect 
select
	f.title
from
	actor a
join film_actor fa
		using(actor_id)
join film f
		using(film_id)
where
	a.last_name = 'Grant';

---


/* Получить список названий всех фильмов (film.title) с рейтингом НЕ G (film.rating <> 'G'),
 * в которых снимался актер с фамилией Grant (actor.last_name = 'Grant'). 
 Решить задачу с использованием union/union all/except/intersect */

select
	f.title
from
	actor a
join film_actor fa
		using(actor_id)
join film f
		using(film_id)
where
	a.last_name = 'Grant'
except 
select
	f.title
from
	film f
where
	rating <> 'G';

--Задания для повторения и закрепления пройденных тем

/* 1.Запросите список клиентов проката(customer), которые проживают в Калифорнии (address.district)

Выведите 3 поля: фамилия клиента(customer.last_name), адрес(address.address), район(address.district) Используйте join, where. */
select
	c.last_name,
	a.address,
	a.district
from
	customer c
join address a
		using(address_id)
where
	a.district = 'California';
