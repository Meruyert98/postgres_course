/* 1. Задача: создать представление, в котором будет 2 поля:
- film_id - идентификатор фильма
- actor_cnt - кол-во актеров, снявшихся в фильме
Если в фильме не снялось ни одного актера, то такой фильм должен выводится в этом представлении с 0 актеров.*/
create view film_actor_cnt as
select 
	f.film_id,
	count(fa.actor_id) as actor_cnt
from film f 
left join film_actor fa 
on f.film_id = fa.film_id 
group by f.film_id;

select * from film_actor_cnt;

/* 2. Написать запрос, в котором будет использовано представление из предыдущей задачи. 
 * Вывести список всех фильмов (film) и по каждому фильму отобразить:
- название фильма (film.title)
- кол-во актеров, снявшихся в фильме */
select 
	f.title,
	fc.actor_cnt
from film f 
inner join film_actor_cnt fc
on f.film_id = fc.film_id;

/* Удалить представление, созданное в первой задаче. */
drop view film_actor_cnt;


--Задания для повторения и закрепления пройденных тем

/* Написать запрос, который для каждого актера выведет поля со значениями:

- имя и фамилию актера через пробел

- среднюю сумма продаж про все фильмы, в которых снимался актер. При расчете среднего значения продаж по фильму учесть фильмы, в которых снимался актер, но по которым не было продаж.

- максимальный рейтинг фильма, в котором снимался актер

- минимальный рейтинг фильма, в котором снимался актер */

select distinct 
	a.first_name || ' ' || a.last_name,
	max(f.rating) over(partition by a.first_name || ' ' || a.last_name),
	min(f.rating) over(partition by a.first_name || ' ' || a.last_name)
from actor a 
join film_actor fa on fa.actor_id = a.actor_id 
join film f on fa.film_id = f.film_id;
