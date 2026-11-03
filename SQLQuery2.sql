
                         ----Assigment-2-----

Q1:--Show all product names along with their brand name. Sort by brand name, then by product name alphabetically.
ANS:
select product_name,brand_name
from [production].[brands]B
inner join [production].[products] P
ON B.brand_id = p.brand_id
ORDER BY product_name,brand_name

Q2:--List all products with their category name and list price. Sort by category name, then by price from cheapest to most expensive.
ANS:
select category_name,list_price
from [production].[products] P
inner join [production].[categories] C
ON P.category_id = C.category_id 
ORDER BY category_name,list_price ASC


Q3:--Show all orders with the customer's full name and order date. Sort by order date from newest to oldest.
ANS:
select C.first_name+''+last_name,order_date
from [sales].[customers] C
inner join [sales].[orders] O
ON C.customer_id = O.customer_id
ORDER BY order_date DESC

Q4:--Show each order along with the store name where it was placed and the order date. Sort by store name.
ANS:
select store_name,order_date
from [sales].[orders] O
inner join [sales].[stores] S
ON S.store_id =O.store_id
ORDER BY store_name

Q5:--Show each order with: order ID, customer full name, store name, and the staff member's full name who handled it.
ANS:
select o.order_id,
CONCAT(C.first_name,'',C.last_name) AS customer_name,
CONCAT(s.first_name ,'',s. last_name) AS staff_member,
st.store_name
from [sales].[orders] O
inner join [sales].[customers] C
ON O.customer_id = C.customer_id
inner join [sales].[staffs] S 
ON O.staff_id = S.staff_id
inner join [sales].[stores]ST
ON O.store_id = ST.store_id

Q6:--Show all completed orders (order_status = 4) from the store "Rowlett Bikes". Display order ID, customer full name, and order date.
Ans:
select order_id,order_date,
CONCAT( c.first_name,'',c.last_name)AS customer_full_name
from [sales].[customers]C
inner join [sales].[orders] O
ON c.customer_id = o.customer_id
inner join [sales].[stores] ST
ON o.store_id = st.store_id
WHERE order_status=4
AND store_name='Rowlett Bikes';

Q7:-- Find all customers who have NEVER placed an order. Show their full name and email.
ANS:
select c.first_name+''+c.last_name,email
from [sales].[customers]C
left join [sales].[orders] O
ON c.customer_id=o.customer_id
WHERE o.customer_id IS NULL;

Q8:-- Find all products that have NEVER been ordered (no record in order_items). Show product name and list price
ANS:
select p.product_name, p.list_price
from [production].[products]P
left join [sales].[order_items]OI
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

Q9:--Display each order item with the product name, quantity, unit price, and a computed column called "Line Total" (quantity × list_price). Sort by order ID.
ANS:
select p.product_name,
oi.quantity,
oi.list_price as uniteprice,
oi.quantity*oi.list_price as linetotal
from [production].[products]p
inner join [sales].[order_items]oi
ON oi.product_id=p.product_id
ORDER BY oi.order_id
Q10:--Find all customers from the state of "NY" who have placed at least one order. Show customer full name, city, and order date.
ANS:
select c.first_name,'',c.last_name as full_name,
c.city ,
o.order_date
from[sales].[customers]c
inner join [sales].[orders]o
ON c.customer_id=o.customer_id
where state ='NY'

-----------Assigment 2 Completed----------------