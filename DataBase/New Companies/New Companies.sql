select c.company_code,founder,l_num,s_num,m_num,e_num
from Company c
join (
    select company_code, count(distinct lead_manager_code) as l_num
    from Lead_Manager
    group by company_code 
) l on (c.company_code = l.company_code)
join (
    select company_code, count(distinct senior_manager_code) as s_num
    from Senior_Manager
    group by company_code 
) s on (c.company_code = s.company_code)
join (
    select company_code, count(distinct manager_code) as m_num
    from Manager
    group by company_code 
) m on (c.company_code = m.company_code)
join (
    select company_code, count(distinct employee_code) as e_num
    from employee 
    group by company_code 
) e on (c.company_code = e.company_code)
order by c.company_code asc