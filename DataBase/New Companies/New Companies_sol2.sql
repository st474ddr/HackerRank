/* 這方法是在所有員工都有都有上級的情況 並且全部的上級都被包含了*/
select c.company_code, 
    c.founder, 
    count(distinct e.lead_manager_code), 
    count(distinct e.senior_manager_code), 
    count(distinct e.manager_code), 
    count(distinct e.employee_code)
from company c
    inner join employee e on e.company_code = c.company_code
group by c.company_code,c.founder
order by c.company_code;