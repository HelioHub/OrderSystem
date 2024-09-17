CREATE TABLE tab_clients 
( 
 code_client INT PRIMARY KEY AUTO_INCREMENT,  
 name_client VARCHAR(n) NOT NULL,  
 address_client VARCHAR(n),  
 phone_client VARCHAR(n) NOT NULL,  
 email_client VARCHAR(n),  
); 

CREATE TABLE tab_item 
( 
 code_item INT PRIMARY KEY AUTO_INCREMENT,  
 name_item VARCHAR(n) NOT NULL,  
 description_item VARCHAR(n),  
 price_item FLOAT NOT NULL,  
); 

CREATE TABLE tab_orders 
( 
 code_order INT PRIMARY KEY AUTO_INCREMENT,  
 code_client INT,  
 date_order DATE NOT NULL,  
 value_order FLOAT,  
); 

CREATE TABLE tab_order_item 
( 
 code_order_item INT PRIMARY KEY AUTO_INCREMENT,  
 code_order INT,  
 code_item INT,  
 amount_order_item FLOAT,  
 unitprice_order_item FLOAT,  
); 

ALTER TABLE tab_orders ADD FOREIGN KEY(code_client) REFERENCES tab_clients (code_client)
ALTER TABLE tab_order_item ADD FOREIGN KEY(code_order) REFERENCES tab_clients (code_order)
ALTER TABLE tab_order_item ADD FOREIGN KEY(code_item) REFERENCES tab_clients (code_item)
