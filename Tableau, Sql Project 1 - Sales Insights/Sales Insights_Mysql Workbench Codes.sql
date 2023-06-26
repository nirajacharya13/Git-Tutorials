SELECT * FROM sales.transactions;

-- How many records in the transaction table has USD currency?
select * from transactions
where currency="USD"; 

-- When we build our Tableau dashboard, we need to convert this USD to INR

-- Showing transactions in 2020 joined by the date table. No of transactions in 2020?
select * from sales.transactions t 
inner join sales.date d 
on t.order_date = d.date
where d.year = 2020;

select count(*) from sales.transactions t 
inner join sales.date d 
on t.order_date = d.date
where d.year = 2020;

-- Total Year-wise Revenue
select d.year,sum(sales_amount) as revenue from sales.transactions t 
inner join sales.date d 
on t.order_date = d.date
group by d.year;

-- How much business we did in different markets in the year 2020?
select d.year,sum(sales_amount) as revenue from sales.transactions t 
inner join sales.date d 
on t.order_date = d.date
where t.market_code="Mark001"
group by d.year;
