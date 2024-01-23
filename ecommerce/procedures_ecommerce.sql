use ecommerce;

delimiter \\
CREATE PROCEDURE new_order(
	IN p_idClient int
)
BEGIN
	INSERT INTO orders (idOrderClient, orderStatus)
    VALUES (p_idClient, 'Em processamento');
END \\
delimiter ;

drop procedure update_order;

delimiter \\
CREATE PROCEDURE update_order(
    IN p_idOrder INT,
    IN p_productList TEXT
)
BEGIN
    DECLARE product_id, quantity INT;
    DECLARE done BOOLEAN DEFAULT FALSE;
    
    DECLARE cur_product CURSOR FOR
        SELECT * FROM json_table(p_productList, '$[*]' COLUMNS(product_id INT PATH '$.product_id', quantity INT PATH '$.quantity')) AS product_data;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur_product;
    
    read_loop: LOOP
        FETCH cur_product INTO product_id, quantity;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Assuming your table structure has idPOproduct, idPOorder, poQuantity, and poStatus columns
        INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
        VALUES (product_id, p_idOrder, quantity, 'Disponível');
    END LOOP;
    
    CLOSE cur_product;
END \\
DELIMITER ;

call new_order(1);
call new_order(3);
select * from orders;

drop procedure print_products;
delimiter \\
CREATE PROCEDURE print_products(
    IN p_idOrder INT,
    IN p_productList TEXT
)
BEGIN
    DECLARE product_id, quantity INT;
	
    SELECT
		product_id.product_data,
		quantity.product_data
	FROM
		json_table(
			p_productList, '$[*]'
            COLUMNS(
				product_id INT PATH '$.product_id',
                quantity INT PATH '$.quantity'
			)
		) AS product_data;    

END \\
DELIMITER ;

call print_products(5, '[{"product_id": 6, "quantity": 2}, {"product_id": 7, "quantity": 3}]');

CALL update_order(6, '[{"product_id": 1, "quantity": 1},
                        {"product_id": 4, "quantity": 1},
                        {"product_id": 8, "quantity": 2}]');

