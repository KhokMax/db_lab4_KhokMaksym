-------------------------
-- Create Customers table
-------------------------
CREATE TABLE Customers
(
  cust_id      int  	 NOT NULL ,
  full_name    char(50)  NOT NULL ,
  city_name    char(50)  NOT NULL ,
  email        char(255) NOT NULL
);

--------------------------
-- Create OrderItems table
--------------------------
CREATE TABLE OrderItems
(
  item_id     integer       NOT NULL,
  order_id    integer       NOT NULL,
  sku         char(100) NOT NULL,
  qty_ordered integer      NOT NULL,
  total       decimal(8,2) NOT NULL
);


----------------------
-- Create Orders table
----------------------
CREATE TABLE Orders
(
   order_id int         NOT NULL,
   status  char(50)     NOT NULL,
   cust_id  int         NOT NULL
);

------------------------
-- Create Products table
------------------------
CREATE TABLE Products
(
   sku 		  char(100) NOT NULL,
   category   char(50)  NOT NULL,
   price      decimal(8,2)   NOT NULL
);

-----------------------
-- Create Cities table
-----------------------
CREATE TABLE Cities
(
    city_name    char(50)  NOT NULL,
    zip          integer        NOT NULL,
    city_state   char(10)  NOT NULL
);


----------------------
-- Define primary keys
----------------------
ALTER TABLE Customers ADD PRIMARY KEY (cust_id);
ALTER TABLE OrderItems ADD PRIMARY KEY (item_id);
ALTER TABLE Orders ADD PRIMARY KEY (order_id);
ALTER TABLE Products ADD PRIMARY KEY (sku);
ALTER TABLE Cities ADD PRIMARY KEY (city_name);


----------------------
-- Define foreign keys
----------------------
ALTER TABLE OrderItems ADD CONSTRAINT FK_OrderItems_Orders FOREIGN KEY (order_id) REFERENCES Orders (order_id);
ALTER TABLE OrderItems ADD CONSTRAINT FK_OrderItems_Products FOREIGN KEY (sku) REFERENCES Products (sku);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (cust_id) REFERENCES Customers (cust_id);
ALTER TABLE Customers ADD CONSTRAINT FK_Customers_Cities FOREIGN KEY (city_name) REFERENCES Cities (city_name);