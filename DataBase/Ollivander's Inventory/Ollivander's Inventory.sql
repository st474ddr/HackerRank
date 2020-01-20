select t2.id,t3.age,t1.coins_needed,t2.power 
from
(SELECT code, power, MIN(coins_needed) AS coins_needed FROM Wands GROUP BY code, power) t1
join Wands t2 using(code,power,coins_needed) 
join Wands_Property t3 using(code) 
where is_evil = 0
order by power desc,age desc