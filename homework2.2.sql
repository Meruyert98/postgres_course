--В каждом задании выводим все поля таблицы с помощью *.

--1. Получить все платежи (payment) с суммой (amount) более 7 долларов в период (payment_date) с 2007-03-01 по 2007-03-31.
select *
from payment 
where amount > 7
	and payment_date between '2007-03-01' and '2007-03-31';

--Получить все платежи (payment) c суммой (amount) более 7 долларов или с суммой (amount) попадающей в диапазон от 3.3 доллара до 5.5 доллара.
select *
from payment 
where amount > 7 or amount between 3.3 and 5.5;

--Получить все платежи (payment), исключив платежи с суммой (amount) более 7 долларов, и, исключив платежи, у которых сумма (amount) попадает в диапазон от 3.3 доллара до 5.5 доллара.
select *
from payment 
where not(amount > 7) and not(amount between 3.3 and 5.5);

--Получить все платежи (payment), у которых последняя цифра идентификатора (payment_id) - равна 1 (другими словами - остаток от деления payment_id на 10 равен 1). 
select * 
from payment 
where mod(payment_id,10) = 1;

--Получить всех актеров (actor), чье имя (first_name) начинается на 'R'.
select *
from actor 
where first_name like 'R%';

--Вывести всех актеров (actor), у которых в фамилии (last_name) нет буквы 'a'.
select *
from actor 
where last_name not like '%a%';

--Получить все фильмы (film), у которых продолжительность (length) принимает одно из значений: 87, 116, 184.
select *
from film 
where length in (87,116,184);