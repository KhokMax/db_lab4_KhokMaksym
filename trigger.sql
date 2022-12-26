-- Тригер, який при додаванні в таблицю Cities запису 
-- значення поля city_state у верхньому регістрі

DROP TRIGGER IF EXISTS cities_state_insert ON cities;

-- Перший етап: створення тригерної функції
CREATE OR REPLACE FUNCTION upper_city_state() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE Cities 
          SET city_state = upper(city_state) WHERE cities.city_name = NEW.city_name; 
		  RETURN NULL; -- result is ignored since this is an AFTER trigger
     END;
$$;

-- Другий етап: створення тригеру
CREATE TRIGGER cities_state_insert
AFTER INSERT ON cities
FOR EACH ROW EXECUTE FUNCTION upper_city_state()





