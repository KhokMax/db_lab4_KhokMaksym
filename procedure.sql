-- Процедура, що розраховує кількість покупців, що проживають за заданим штатом,
-- назва якого передається в процедуру в якості аргумента.

DROP PROCEDURE IF EXISTS get_cust_count(varchar(50), integer);
CREATE OR REPLACE PROCEDURE get_cust_count(IN country_state varchar(50), INOUT x integer DEFAULT 0)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    select count(distinct(customers.cust_id)) into x  from customers inner join cities using(city_name) 
		where city_state = country_state;
END;
$$;