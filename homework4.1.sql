/* 1. Нам известно название фильма (значение поля title таблицы film) - "Chamber Italian". 
Задача: получить список всех актеров, снявшихся в этом фильме. 
По каждому актеру (запись из таблица actor) нужно вывести 2 поля: имя (first_name) и фамилию (last_name). 
Связь между таблицами фильмов и актером производится посредствам промежуточной таблицы film_actor.  */
select
	a.first_name || ' ' || a.last_name
from
	film f
inner join film_actor fa 
on
	f.film_id = fa.film_id
inner join actor a 
on
	fa.actor_id = a.actor_id
where
	f.title = 'Chamber Italian';

/* 2. Получить список всех фильмов (film) из категории (category) 'Comedy' (значение поля "name"). 
По каждому найденному фильму нужно вывести название из поля "title". 
Связь между фильмами и категориями осуществляется с помощью промежуточной таблицы film_category.*/
select
	f.title
from
	film f
join film_category fc 
on
	f.film_id = fc.film_id
join category c 
on
	fc.category_id = c.category_id
where
	c.name = 'Comedy';

/* 3. Вывести список пар: название фильма (film.title) - название категории (category.name). 
Если один фильм попадает в несколько категорий, то вывести несколько строк для этого фильма. 
Связь между таблицами фильмов (film) и категорий (category) осуществляется посредствам промежуточной таблицы film_category.*/
select
	f.title,
	c.name
from
	film f
join film_category fc 
on
	f.film_id = fc.film_id
join category c
on
	fc.category_id = c.category_id;

--Задачи *

/* 1. Вывести список всех пар: название фильма (film.title) и название категории (category.name) 
 (сделать декартово произведение фильмов и категория). 
 Для каждой пары вывести true в 3ьей колонке, если данный фильм относится к указанной категории. 
 Иначе вывести false.*/
select
	f.title,
	c.name,
	fc.film_id is not null
from
	film f
cross join category c
left join film_category fc 
on
	fc.film_id = f.film_id
	and fc.category_id = c.category_id;

/* 2. Вывести названия всех фильмов (film.title), по которым в магазине нет дисков и кассет
(то есть по таким фильмам нет записей в таблице inventory). */
select
	f.title
from
	film f
left join inventory i 
on
	f.film_id = i.film_id
where
	i.film_id is null;

--Задания для повторения и закрепления пройденных тем

/* Запросить из таблицы платежей public.payment все строки и для каждой строки вывести 2 поля:

- сумма платежа в рублях (значение из поля public.payment.amount без преобразований);

- сумма платежа в биткоинах. 1 рубль стоить 0,00000004 биткоина. 
Чтобы получить сумму в биткоинах нужно умножить сумму в рублях (public.payment.amount) 
на стоимость одного рубля к биткоину и у результата умножения отбросить дробную часть после 9 знака после запятой.*/

select
	amount,
	round(amount * 0.00000004, 9) as amountBTC
from
	payment p;
