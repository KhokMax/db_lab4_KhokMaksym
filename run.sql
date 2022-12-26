/*

				Функція 

*/

-- Обираємо всі записи з таблиці Customers
select * from customers


-- Виклик функції - SELECT
SELECT clean_customers();

-- Обираємо всі записи з таблиці Customers
select * from customers

-- Повертаємо видалені дані
INSERT INTO Customers(cust_id, full_name, city_name, email)
VALUES(60111, 'Pancoast, Jaimie', 'Washington', 'jaimie.pancoast@shell.com');
INSERT INTO Customers(cust_id, full_name, city_name, email)
VALUES(16163, 'Avila, Renato', 'Washington', 'renato.avila@btinternet.com');

/*

				Процедура 

*/

-- Обираємо всі записи з таблиці Customers
select * from customers

-- Обираємо всі записи з таблиці Cities
select * from cities

-- Виклик процедури
CALL get_cust_count('AZ');

/*

				Тригер 

*/

-- Обираємо всі записи з таблиці Cities
select * from cities

-- додаємо новий рядок
INSERT INTO Cities(city_name, zip, city_state)
VALUES('City', 7357121, 'LA');

-- Виклик процедури
delete from cities where zip = 7357121