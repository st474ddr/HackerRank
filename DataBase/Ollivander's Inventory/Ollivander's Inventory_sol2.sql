Select w.id, p.age, w.coins_needed, w.power
From Wands w inner join Wands_Property p on
w.code = p.code
Where p.is_evil = 0 and w.coins_needed =
(
Select min(coins_needed) as coins_needed
from Wands w1 inner join Wands_Property p1 on
w1.code = p1.code
Where w.power = w1.power and p.age = p1.age
)
Order by w.power desc, p.age desc;