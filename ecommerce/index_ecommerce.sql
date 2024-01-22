use ecommerce;
show tables;

desc clientsAddress;

show index from clientsAddress;

create index inx_city on clientsAddress (city);

desc orders;
show index from orders;

-- Query para agrupar os clientes por numero de compras.
SELECT
	c.idClient,
    COUNT(o.idOrder) as total_sales
FROM
	clients c
LEFT JOIN
	orders o ON c.idClient = o.idOrderClient
GROUP BY
	c.idClient
ORDER BY
	total_sales DESC;

-- Query para agrupar os clientes por ticket
desc product;
SELECT
	o.idOrder,
    o.idOrderClient,
    po.idPOproduct,
    po.poQuantity,
    p.price * po.poQuantity AS total_value
FROM
	orders o
JOIN
	productOrder po ON o.idOrder = po.idPOorder
JOIN
	product p ON po.idPOproduct = p.idProduct;


-- ALTER TABLE nome_tabela ADD UNIQUE index_name(coluna);
-- create index index_name on .ecommerce (coluna) using hash; 