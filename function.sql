-- Функція, що видаляє всіх покупців, які не мають замовлень
DROP FUNCTION IF EXISTS clean_customers();
CREATE OR REPLACE FUNCTION clean_customers() RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN 
  delete from customers
	where cust_id in (select customers.cust_id from customers left join orders ON orders.cust_id = customers.cust_id
					  where orders.order_id is null);
END;
$$; 