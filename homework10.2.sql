/* Создать таблицу (internet_film) со списком фильмов, доступных для аренды онлайн. Список полей:
- internet_film_id - Идентификатор фильма (целое число. Должно проставляться автоматически. Первичный ключ).
- title - Название фильма (строка длиной до 50 символов. Обязательное для заполнения. Уникальное).
- price - Стоимость сдачи в прокат (число с плавающей точкой. Обязательное для заполнения. Должно быть больше 0 и меньше или равно 100).
- rental_duration - Кол-во дней, на которое фильм отдается в прокат (Целое число. Обязательное для заполнения. Больше 0.).
- description - Описание фильма (строка длиной до 500 символов. Не обязательное для заполнения). */

create table internet_film (
	internet_film_id serial primary key,
	title varchar(50) not null unique,
	price numeric(10,2) not null check(price > 0 and price <= 100),
	rental_duration int not null check(rental_duration > 0),
	description varchar(500) 
);
