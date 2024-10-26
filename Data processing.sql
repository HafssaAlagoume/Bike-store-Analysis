SELECT
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS customer,
    cus.city,
    cus.state,
    ord.order_date,
    SUM(ite.quantity) AS total_units,
    SUM(ite.quantity * ite.list_price) AS revenue,
    pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS sales_rep,
	bra.brand_name
FROM sales.orders ord
JOIN sales.customers cus 
    ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite 
    ON ite.order_id = ord.order_id
JOIN production.products pro 
    ON pro.product_id = ite.product_id
JOIN production.categories cat
    ON cat.category_id = pro.category_id
JOIN sales.stores sto
    ON sto.store_id = ord.store_id
JOIN sales.staffs sta
    ON ord.staff_id = sta.staff_id
JOIN production.brands bra
    ON bra.brand_id = pro.brand_id
GROUP BY
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name),
    cus.city,
    cus.state,
    ord.order_date,
    pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) ,
	bra.brand_name



