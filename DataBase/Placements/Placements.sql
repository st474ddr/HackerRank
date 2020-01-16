SELECT NAME
from students a
left JOIN friends b ON a.ID=b.ID
left JOIN packages c ON c.ID=a.ID,
(SELECT p.ID AS c_ID,p.salary AS friend_salary FROM packages p INNER JOIN friends f ON f.ID = p.ID) q
WHERE q.c_ID = b.Friend_ID
AND friend_salary > Salary
ORDER BY friend_salary