select CEILING(avg(Salary)-avg(REPLACE(Salary,0,''))) from EMPLOYEES