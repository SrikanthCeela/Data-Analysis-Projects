-- check all the table and its columns
SELECT * FROM sales.customers; -- customer_code, custmer_name, customer_type
SELECT * FROM sales.date; -- date, cy_date, year, month_name, date_yy_mmm
SELECT * FROM sales.markets; -- markets_code, markets_name, zone
SELECT * FROM sales.products; -- product_code, product_type
SELECT * FROM sales.transactions; -- product_code, customer_code, market_code, order_date, sales_qty, sales_amount, currency

-- Total transaction records
SELECT COUNT(*) FROM sales.transactions;

-- no. of accounts
SELECT COUNT(*) FROM sales.customers;

-- All Transactions only from chennai
SELECT * 
FROM sales.transactions
WHERE market_code IN (SELECT m.markets_code
						FROM sales.markets m
                        WHERE markets_name = 'Chennai');
                        
-- All Transactions performed in year 2020
SELECT t.*
FROM sales.transactions t
JOIN sales.date d ON d.date=t.order_date
WHERE d.year = 2020;

-- Total Sales in year 2020
SELECT sum(t.sales_amount) as total_sales
FROM sales.transactions t
JOIN sales.date d ON d.date=t.order_date
WHERE d.year = 2020;

-- How much business done in Chennai
SELECT sum(t.sales_amount) as total_sales
FROM sales.transactions t
JOIN sales.date d ON d.date=t.order_date
WHERE d.year = 2020 and t.market_code IN (SELECT m.markets_code
											FROM sales.markets m
                                            WHERE m.markets_name = 'Chennai');