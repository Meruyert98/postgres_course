--Оптимизируйте запрос с помощью создания индекса:

create index film_rental_duration_idx on film(rental_duration);

explain analyze
select *
from film f
where rental_duration = 7;

--Planning Time: 1.723 ms
--Execution Time: 0.256 ms
 
--Постройте план выполнения запроса до создания индекса и после и посмотрите на сколько изменится время выполнения запроса.

drop index film_rental_duration_idx;

explain analyze
select *
from film f
where rental_duration = 7; 

--Planning Time: 1.343 ms
--Execution Time: 0.530 ms

