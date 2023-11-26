/* 1. Вывести названия всех языков (language.name), на которых нет фильмов в базе данных. Использовать функцию not exists. */
select
	l."name" as language_name
from
	"language" l
where
	not exists (
	select
		f.language_id
	from
		film f
	where
		f.language_id = l.language_id 
);


/* 2. Вывести названия всех фильмов (film.title), в которых снимались актеры с фамилией (actor.last_name) начинающейся на 'Chase'. 
 * Использовать функцию in. 
 */
select
	f.title
from
	film f
where
	f.film_id in (
	select
		fa.film_id
	from
		film_actor fa
	join actor a on
		fa.actor_id = a.actor_id
	where
		a.last_name like 'Chase%'
);

/* 3. Вывести все фильмы из таблицы film. По каждому фильму отобразить:
- название фильма (film.title).
- название языка, на котором этот язык снят (language.name).
Названия языка получить с помощью подзапроса в select. */
select 
	f.title, 
	(
	select l."name"  from "language" l 
	where f.language_id = l.language_id 
	)
from film f;

/* 4. Вывести список всех фильмов. По каждому фильму вывести:
- название (film.title).
- на сколько дней фильм отдается в сдачу (film.rental_duration).
- сколько всего фильмов с таким же значением rental_duration
С помощью подзапроса в блоке from получить таблицу, в которой для каждого значения rental_duration будет посчитано кол-во фильмов.*/
select
	f.title,
	f.rental_duration,
	fr.cnt as rent_dur_count
from
	film f
join (
	select
		f2.rental_duration,
		count(*) as cnt
	from
		film f2
	group by
		f2.rental_duration 
) fr
on
	f.rental_duration = fr.rental_duration;

--Задания для повторения и закрепления пройденных тем

/* Попробуйте разделить фильмы на категории по описанию фильма.

Выведите 3 поля: название фильма(film.title), описание фильма(film.description), новое поле - категория. (используйте case, like)

-Если в description встречается слово 'drama', в новом поле будет показана категория 'драма'

- Если в description встречается слово 'documentary', в новом поле будет показана категория 'документальный’

-У остальных фильмов в новом поле будет отображаться ‘другие’ */

select 
		f.title,
		f.description,
		case 
			when lower(f.description) like '%drama%' then 'драма'
			when lower(f.description) like '%documentary%' then 'документальный'
			else 'другие'
		end as category
from film f; 