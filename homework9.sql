/* Создать таблицу (internet_film) со списком фильмов, доступных для аренды онлайн.
Список полей:
- internet_film_id - Идентификатор фильма (целое число. Должно проставляться автоматически. Обязательное для заполнения).
- title - Название фильма (строка длиной до 50 символов. Пробелами в конце дополняться не должна. Обязательное для заполнения).
- price - Стоимость сдачи в прокат (число с плавающей точкой. Обязательное для заполнения).
- rental_duration - Кол-во дней, на которое фильм отдается в прокат (Целое число. Обязательное для заполнения).
- description - Описание фильма (строка длиной до 500 символов. Не обязательное для заполнения).*/

create table internet_film(
	internet_film_id serial not null,
	title varchar(50) not null,
	price numeric(10,2) not null,
	rental_duration int not null,
	description varchar(500) 
);

--Добавить в таблицу 3 любых фильма по своему желанию.
insert into internet_film
(title, price, rental_duration, description)
values
		('Titanik', 2, 2, 'Romantic story'),
		('James Bond Part 1', 3, 2, 'Adventure'),
		('Shrek', 3, 3, 'For children');


select * from internet_film;

--Добавить в таблицу все фильмы из таблицы film, у которых рейтинг ‘G’ (ilm.rating = ‘G’). Поставить цену проката - 2. Остальные поля взять из таблицы film.
insert into internet_film
(title, price, rental_duration, description)
select title, 2, rental_duration, description 
from film f
where f.rating = 'G';

select * from internet_film;
