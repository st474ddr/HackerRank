select max(months * salary),count(*) from Employee where (months*salary) in (select max(months * salary) from Employee)