/* 1. По каждому фильму (film), по которому были платежи, вывести общую сумму вырученных платежей (payment.amount) с проката. 
Вывести 2 колонки: 1. film_title - с названием фильма (film.title). 
Каждый фильм, должен быть указан в этой колонке один раз; 2. amount - общая сумма, 
на которую фильм сдавался в прокат (payment.amount). 
Отсортировать полученный результат в порядке убывания общей суммы сдачи в прокат. 
Связь таблиц происходит следующим образом: film <- inventory; inventory <- rental; rental <- payment. */
select
	f.title,
	sum(p.amount) as amount
from
	film f
join inventory i on
	i.film_id = f.film_id
join rental r on
	r.inventory_id = i.inventory_id
join payment p on
	r.rental_id = p.rental_id
group by
	f.title
order by
	amount desc;


/* 2. По каждому актеру (actor) вывести в скольких фильмах он снимался. 
 * Вывести 2 колонки в результате:
 * 1. actor_name - имя (actor.first_name) и фамилия (actor.last_name) актера через пробел; 
 * 2. film_number - кол-во фильмов (film), в которых снимался актер. 
 * Отобразить только актеров, которые снялись более чем в 20 фильмах.
 */
select
	a.first_name || ' ' || a.last_name as actor_name,
	count(*) as film_number
from
	actor a
join film_actor fa on
	fa.actor_id = a.actor_id
group by
	actor_name
having
	count(*) > 20;

/* 3. Вывести одно число - сколько всего фильмов (film) продолжительностью (film.length) более 120 минут. */
select
	count(*)
from
	film f
where
	f.length > 120;

--Задачи *
/* 1. По каждой категории фильмов (category) вывести кол-во фильмов (film) продолжительностью (film.length) от 180 минут.
Вывести 2 поля: 
1. category_name - название категории (category.name); 
2. film_number - кол-во фильмов продолжительностью от 180 минут.
Если в категории нет фильмов продолжительностью от 180 минут - ее также нужно отобразить, 
но в film_number для нее нужно вывести 0. Отсортировать результат по убыванию кол-ва фильмов в категории. */
select
	c."name" as category_name,
	count(f.film_id) film_number
from
	category c
left join film_category fc on
	fc.category_id = c.category_id
left join film f on
	f.film_id = fc.film_id
	and f.length > 180
group by
	category_name
order by
	film_number desc;

--Задания для повторения и закрепления пройденных тем

/* Из таблицы с актерами (public.actor) запросить все строки и по каждому актеру вывести одно поле,
в котором будут имя (public.actor.first_name) и фамилия (public.actor.last_name) актера через пробел. 
При этом первая буква имени и последняя буква фамилии должны быть заглавными, а остальные буквы строчными. */

select 
*,
upper(substring(concat(first_name, ' ', last_name),1,1)) ||
lower(substring(concat(first_name, ' ', last_name),2, length(concat(first_name, ' ', last_name)))) ||
upper(substring(concat(first_name, ' ', last_name) FROM length(concat(first_name, ' ', last_name)) FOR 1)) as actor_name
from actor a;