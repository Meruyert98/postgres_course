/* По каждому фильму (film) вывести поля:
- название фильма (film.title).
- кол-во актеров, снявшихся в фильме (кол-во строк в film_actor).
- сумму продаж по данному фильму (sum(payment.amount)).
Сделать расчет кол-ва актеров в каждом фильме в отдельном запросе cte.  
Сделать расчет общей суммы продаж по каждому фильму в отдельном cte. */
with film_actor as (
	select film_id, count(*) as actor_count
	from  film_actor fa 
	group by film_id
),
total_payment as(
	select i.film_id, sum(p.amount) as total_amount
	from payment p
	join rental r on r.rental_id = p.rental_id 
	join inventory i on r.inventory_id = i.inventory_id 
	group by i.film_id 
)
select 
f.title,
coalesce(fa.actor_count,0) as film_actor_cnt,
coalesce(ta.total_amount,0) as amount
from film f 
left join film_actor fa on f.film_id = fa.film_id 
left join total_payment ta on f.film_id = ta.film_id;

--(задача со *)
/* Вывести по каждому фильму (film):
- название (film.title).
- общую сумму продаж по фильму (sum(payment.amount)).
- общую сумму продаж по всем фильмам (sum(payment.amount)).
- долю продаж данного фильма от всех продаж в процентах, рассчитанную по формуле:
 [продажи по данному фильму] / [продажи по всем фильмам] * 100. 
 Расчет всех продаж по всем фильмам сделать с помощью CTE. */

with film_payment as(
	select i.film_id, sum(p.amount) as total_amount
	from payment p
	join rental r on r.rental_id = p.rental_id 
	join inventory i on r.inventory_id = i.inventory_id 
	group by i.film_id 
),
total_payment as(
	select sum(total_amount) as total from film_payment
)
select 
f.title,
coalesce(fp.total_amount,0),
ta.total,
(coalesce(fp.total_amount,0) / ta.total) *100 as sale_percent
from film f 
join film_payment fp on f.film_id = fp.film_id
cross join total_payment ta;

