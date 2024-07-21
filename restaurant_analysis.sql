--number of items in the menu
select  count(distinct item_name) from menu_items
----least and most expensive items
select * from menu_items
where price =(select max(price) from menu_items)
select * from menu_items
where price =(select min(price) from menu_items)

--how many italian dishes are on the menu and max price and min price
select count(*) from menu_items
where category='italian'

select max(price) from (select * from menu_items
where category='italian') x

select min(price) from (select * from menu_items
where category='italian') x

--how many dishes are in each category what is the avg price in each category
select category, count(*) No_of_dishes,
avg(price) avg_price from menu_items
group by category
--wahat is the daterange of the table?
select min(order_date),max(order_date)from order_details
--how many orders were ordered within this daterange?
select  count(distinct order_id) from order_details
--how many items were ordered within this daterange?
select  count(item_id) from order_details
--which orders had the most number of items?
select order_id,count(item_id) no_of_items from order_details
group by order_id
order by no_of_items desc
--orders had more than 12 items
select count(*)from(select order_id,count(item_id) no_of_items from order_details
group by order_id
having count(item_id) >12
)x
--combine the menu and order details tablse into a single table
select * from order_details od
left join menu_items mi on od.item_id=mi.menu_item_id
--what is the least and most orderd item? what category were they in?
select mi.item_name,mi.category,count(mi.menu_item_id) No_times_ordered
from order_details od
left join menu_items mi on od.item_id=mi.menu_item_id
group by mi.item_name,mi.category
order by No_times_ordered desc
--for least
select  mi.item_name,mi.category,count(mi.menu_item_id) No_times_ordered
from order_details od
left join menu_items mi on od.item_id=mi.menu_item_id
group by mi.item_name,mi.category
order by No_times_ordered
--what were the top 5 orders that spent the most money
select mi.item_name,mi.category,count(mi.menu_item_id)No_times_ordered,sum(mi.price)amount
from order_details od
left join menu_items mi on od.item_id=mi.menu_item_id
group by mi.item_name,mi.category
order by amount desc

select * from menu_items
select * from order_details

