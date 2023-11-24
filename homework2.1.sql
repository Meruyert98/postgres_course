--1. Сделать запрос из таблицы платежей (payment), который получает поля: payment_id, customer_id, amount 
--и дать им названия соответственно: “№ платежа”, “№ покупателя” и “Сумма платежа”.

select 
		payment_id "№ платежа",
		customer_id "№ покупателя", 
		amount "Сумма платежа"
from payment;

/*2. Вывести по каждому платежу их таблицы платежей (payment) 
сумму платежа в долларах (значение из поля amount) 
и сумму платежа в рублях (значение из поля amount, 
умноженное на текущий курс доллара к рублю) и дать им названия: “Сумма в долларах” и “Сумма в рублях”.*/

select 
		amount "Сумма в долларах",
		round(amount * 88.84,2) as "Сумма в рублях"
from payment;

--3. Сделать запрос из таблицы фильмов со следующими столбцами:

/* 1. Для каждого фильма вывести строку в следующем формате: “title: {1}; description: {2}”, 
где вместо {1} будет настоящее название фильма, а вместо {2} - описание фильма. 
Например, для фильма с названием “Chamber Italian” и описанием 
“A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria” 
нужно вывести строку: “title: Chamber Italian; description: A Fateful Reflection of a Moose 
And a Husband who must Overcome a Monkey in Nigeria”. Дать название столбцу: fullTitle.*/

select 
	'title: ' || title || '; description: ' || description as fullTitle,
	concat('title: ', title, '; description: ', description) as fullTitle2
from film;

/*	2. У описания фильма (film.description) удалить подстроку “A ” из начала строки, если такая есть и вывести результат. 
Дать название полученному столбцу: trimmedDescription. */
select 
	trim('A ' from description) trimmedDescription
from film;

/*	3. Из названия фильма вывести только первое слово, которое идет до пробела. 
Например, для фильма с названием “Chamber Italian” нужно вывести “Chamber”. Дать название полученному столбцу: titleFirstWord.
*/
select 
	substring(title, 1,  strpos(title, ' ')-1) as titleFisrtWord
from film;


--Дополнительное задание:

/* С помощью поиска в google найдите, как можно удалить пробелы в конце строки.
Пришлите запрос из таблицы actor с одним столбцом, который получает строку ‘ ‘ || first_name || ‘ ‘ и из этой строки удаляет пробел в конце.
Пример аналогичного запроса, который удаляет пробел в начале строки:
select trim(leading from ' ' || first_name || ' ')
from  actor; */

select 
	trim(trailing from ' ' || first_name || ' '),
	rtrim(' ' || first_name || ' ') 
from actor;
