select round(LAT_N,4) 
from (
    SELECT (@r := @r + 1) AS r, Lat_N 
    FROM Station,(select @r := -1) as a 
    ORDER BY Lat_N
) as temp
where r in (floor(@r/2),ceil(@r/2))
