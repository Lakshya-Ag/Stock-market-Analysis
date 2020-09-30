-- creating a table bajaj1 containing Date, Close Price, 20 Day MA, 50 Day MA
-- creating a view
create view bajaj0 as
with Demo (SNo, Date, Close_Price) as(
select row_number() over () as SNo, Date, Close_Price from bajajauto)
select Date, Close_Price,
if(Sno>19, avg(Close_Price) over (order by Date asc rows 19 preceding), NULL) as `20 Day MA`,
if(SNo>49, avg(Close_Price) over (order by Date asc rows 49 preceding), NULL) as `50 Day MA` from Demo;
-- copying the view data into a table
create table bajaj1 as
select * from bajaj0;
-- fetching whole data from final table
select * from bajaj1;

-- creating a table eicher1 containing Date, Close Price, 20 Day MA, 50 Day MA
-- creating a view
create view eicher0 as
with Demo1 (SNo, Date, Close_Price) as(
select row_number() over () as SNo, Date, Close_Price from EicherMotors)
select Date, Close_Price,
if(Sno>19, avg(Close_Price) over (order by Date asc rows 19 preceding), NULL) as `20 Day MA`,
if(SNo>49, avg(Close_Price) over (order by Date asc rows 49 preceding), NULL) as `50 Day MA` from Demo1;
-- copying the view data into a table
create table eicher1 as
select * from eicher0;
-- fetching whole data from final table
select * from eicher1;

-- creating a table hero1 containing Date, Close Price, 20 Day MA, 50 Day MA
-- creating a view
create view hero0 as
with Demo2 (SNo, Date, Close_Price) as(
select row_number() over () as SNo, Date, Close_Price from HeroMotocorp)
select Date, Close_Price,
if(Sno>19, avg(Close_Price) over (order by Date asc rows 19 preceding), NULL) as `20 Day MA`,
if(SNo>49, avg(Close_Price) over (order by Date asc rows 49 preceding), NULL) as `50 Day MA` from Demo2;
-- copying the view data into a table
create  table hero1 as
select * from hero0;
-- fetching whole data from final table
select * from Hero1;

-- creating a table infosys1 containing Date, Close Price, 20 Day MA, 50 Day MA
-- creating a view
create view infosys0 as
with Demo3 (SNo, Date, Close_Price) as(
select row_number() over () as SNo, Date, Close_Price from Infosys)
select Date, Close_Price,
if(Sno>19, avg(Close_Price) over (order by Date asc rows 19 preceding), NULL) as `20 Day MA`,
if(SNo>49, avg(Close_Price) over (order by Date asc rows 49 preceding), NULL) as `50 Day MA` from Demo3;
-- copying the view data into a table
create table infosys1 as
select * from infosys0;
-- fetching whole data from final table
select * from infosys1;

-- creating a table tcs1 containing Date, Close Price, 20 Day MA, 50 Day MA
-- creating a view
create view tcs0 as
with Demo4 (SNo, Date, Close_Price) as(
select row_number() over () as SNo, Date, Close_Price from TCS)
select Date, Close_Price,
if(Sno>19, avg(Close_Price) over (order by Date asc rows 19 preceding), NULL) as `20 Day MA`,
if(SNo>49, avg(Close_Price) over (order by Date asc rows 49 preceding), NULL) as `50 Day MA` from Demo4;
-- copying the view data into a table
create table tcs1 as
select * from tcs0;
-- fetching whole data from final table
select * from tcs1;

-- creating a table tvs1 containing Date, Close Price, 20 Day MA, 50 Day MA
-- creating a view
create view tvs0 as
with Demo5 (SNo, Date, Close_Price) as(
select row_number() over () as SNo, Date, Close_Price from TVSMotors)
select Date, Close_Price,
if(Sno>19, avg(Close_Price) over (order by Date asc rows 19 preceding), NULL) as `20 Day MA`,
if(SNo>49, avg(Close_Price) over (order by Date asc rows 49 preceding), NULL) as `50 Day MA` from Demo5;
-- copying the view data into a table
create table tvs1 as
select * from tvs0;
-- fetching whole data from final table
select * from tvs1;

-- creating master table using joins on all tables to fetch Closing Price of every company from their datasets
create view MasterTable as
select b.Date as Date, b.Close_Price as Bajaj, e.Close_Price as Eicher, h.Close_Price as Hero,
i.Close_Price as Infosys, t.Close_Price as TCS, tv.Close_Price as TVS
from bajajauto b join eichermotors e on b.date=e.date
join heromotocorp h on e.date=h.date
join infosys i on h.date=i.date
join tcs t on i.date=t.date
join tvsmotors tv on t.date=tv.date order by Date;
-- fetching whole data from final Master Table
select * from MasterTable;

-- creating table bajaj2 to generate buy/sell signal
create view bajaj3 as
select Date, Close_Price,
CASE
-- applying when conditions to get the signal output
when SNo > 49 and `20 Day MA` > `50 Day MA` then 'BUY'
when SNo > 49 and `20 Day MA` < `50 Day MA` then 'SELL'
ELSE 'HOLD'
END as TradeSignal
from bajaj1;
create table bajaj2 as
select * from bajaj3;
-- fetching data from second table having date, closing price and signal
select * from bajaj2;

-- creating table eicher2 to generate buy/sell signal
create view eicher3 as
select Date, Close_Price,
CASE
-- applying when conditions to get the signal output
when SNo > 49 and `20 Day MA` > `50 Day MA` then 'BUY'
when SNo > 49 and `20 Day MA` < `50 Day MA` then 'SELL'
ELSE 'HOLD'
END as TradeSignal
from eicher1;
-- fetching data from second table having date, closing price and signal
create table eicher2 as
select * from eicher3;
select * from eicher2;

-- creating table hero2 to generate buy/sell signal
create view hero3 as
select Date, Close_Price,
CASE
-- applying when conditions to get the signal output
when SNo > 49 and `20 Day MA` > `50 Day MA` then 'BUY'
when SNo > 49 and `20 Day MA` < `50 Day MA` then 'SELL'
ELSE 'HOLD'
END as TradeSignal
from hero1;
-- fetching data from second table having date, closing price and signal
create table hero2 as
select * from hero3;
select * from hero2;

-- creating table infosys2 to generate buy/sell signal
create view infosys3 as
select Date, Close_Price,
CASE
-- applying when conditions to get the signal output
when SNo > 49 and `20 Day MA` > `50 Day MA` then 'BUY'
when SNo > 49 and `20 Day MA` < `50 Day MA` then 'SELL'
ELSE 'HOLD'
END as TradeSignal
from infosys1;
-- fetching data from second table having date, closing price and signal
create table infosys2 as
select * from infosys3;
select * from infosys2;

-- creating table tcs2 to generate buy/sell signal
create view tcs3 as
select Date, Close_Price,
CASE
-- applying when conditions to get the signal output
when SNo > 49 and `20 Day MA` > `50 Day MA` then 'BUY'
when SNo > 49 and `20 Day MA` < `50 Day MA` then 'SELL'
ELSE 'HOLD'
END as TradeSignal
from tcs1;
-- fetching data from second table having date, closing price and signal
create table tcs2 as
select * from tcs3;
select * from tcs2;

-- creating table tvs2 to generate buy/sell signal
create view tvs3 as
select Date, Close_Price,
CASE
-- applying when conditions to get the signal output
when SNo > 49 and `20 Day MA` > `50 Day MA` then 'BUY'
when SNo > 49 and `20 Day MA` < `50 Day MA` then 'SELL'
ELSE 'HOLD'
END as TradeSignal
from tvs1;
-- fetching data from second table having date, closing price and signal
create table tvs2 as
select * from tvs3;
select * from tvs2;

-- user defined function for the bajajauto to show the signal for a particular date
-- defining the function in between the delimiter
delimiter $$
create function signal_call_bajaj(d Date)
returns varchar(10) deterministic
begin
-- operand returns the trade signal for the particular date
return(select TradeSignal from bajaj2 where Date=d);
end;
$$
-- calling the function by putting a random date as input
select signal_call_bajaj('2017-10-19');