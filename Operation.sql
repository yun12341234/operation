--January
--select * from dbo.jmjm1
--where JobDate between '01-01-2023' and '02-01-2023'
--order by JobDate

-----------------------------------------------------------------------------------------
--select COUNT(Distinct a.jobno) as AMOUNTOFJOB from jmjm1 as a 
--join
--jmjm2 as b on a.jobno = b.JobNo
--where JobDate between '01-01-2023' and '02-01-2023'
--Amount of month that require one 
------------------------------------------------------------------------------------------
--select distinct a.jobno from jmjm1 as a
--join 
--jmjm2 as b on a.jobno = b.JobNo
--where jobdate between'01-01-2023' and '02-01-2023'
-- List of job that occurs between the months
------------------------------------------------------------------------------------------
--select  SUM(Amt) as SalesAmt, sum(Costamt) as CostAmt,SUM(amt)-SUM(Costamt) as Profit,
--((Sum(amt)-Sum(CostAmt))/Sum(AMt))*100 as Profpercent
--from jmjm2 
--where jobno like 'CI23070025'  
-- Calculating SalesAmt, CostAmount, Profit, Profitpercentage 
------------------------------------------------------------------------------------------

--WITH #PROFIT AS (select b.JobDate,a.jobno,a.itemcode,a.description,a.AMT as EachSalesamount,a.Costamt as Eachcostamount, Sum(a.AMT) over (partition by a.jobno) As Salesamount,
--SUM(a.COSTAMT) over (partition by a.jobno) As CostAMT,Sum(a.AMT) over (partition by a.jobno)-SUM(a.COSTAMT) over (partition by a.jobno) as profit
--from jmjm2 as a 
--join jmjm1 as b on a.jobno = b.JobNo
--where b.jobdate between'01-01-2023' and '01-31-2023'
--)
--select Distinct JobDate,Jobno,Salesamount,CostAMT,profit from #PROFIT
--calculating sales amount of each job perday
-----------------------------------------------------------------------------------------
WITH #PROFIT AS (select a.jobno,a.itemcode,a.description,a.AMT as EachSalesamount,a.Costamt as Eachcostamount, Sum(a.AMT) over (partition by a.jobno) As Salesamount,
SUM(a.COSTAMT) over (partition by a.jobno) As CostAMT,Sum(a.AMT) over (partition by a.jobno)-SUM(a.COSTAMT) over (partition by a.jobno) as profit
from jmjm2 as a 
)
select Distinct #profit.JobNo,#profit.Salesamount,#profit.CostAMT,#PROFIT.profit from #PROFIT
join
jmjm1 ON #profit.jobno = jmjm1.JobNo
where jmjm1.JobDate >= '01-01-2023'
-------------------------------------------------------------------------------------------

select* from jmjm2 where jobno = 'CIS23060001'





--Febuary
--select * from dbo.jmjm1 
--where jobdate between '02-01-2023' and '03-01-2023'





--March 
--select * from dbo.jmjm1
--where jobdate between '03-01-2023' and '04-01-2023'





--April
--select * from dbo.jmjm1 
--where jobdate between '04-01-2023' and '05-01-2023'




--May
--select * from dbo.jmjm1 
--where jobdate between '05-01-2023' and '06-01-2023'



--JUNE
--select * from dbo.jmjm1
--where jobdate between '06-01-2023' and '07-01-2023'


--JULY
--select * from dbo.jmjm1 
--where jobdate between '07-01-2023' and '08-01-2023'





