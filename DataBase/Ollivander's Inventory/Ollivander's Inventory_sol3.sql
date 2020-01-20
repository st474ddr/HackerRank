SELECT
good.id,
good.age,
cheap.coins_needed,
good.power
FROM (
    SELECT
    WP.age,
    MIN(W.coins_needed) as coins_needed,
    W.power
    FROM Wands as W
    LEFT JOIN Wands_Property as WP
    ON W.Code=WP.Code
    WHERE WP.is_evil = 0
    GROUP BY W.power,WP.age
    ) as cheap
NATURAL JOIN (
    SELECT
    W2.id,
    W2.coins_needed,
    W2.power,
    WP2.age
    FROM Wands as W2
    LEFT JOIN Wands_Property as WP2
    ON W2.Code = WP2.Code
    WHERE WP2.is_evil = 0
    ) as good
ORDER BY good.power DESC,good.age DESC;