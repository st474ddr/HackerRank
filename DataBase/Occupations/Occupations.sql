SET sql_mode = '';
SELECT max(Doctor), max(Professor), max(Singer), max(Actor)
FROM (
    select 
    case when Occupation = 'Doctor' then @num_D := @num_D + 1
         when Occupation = 'Professor' then @num_P := @num_P + 1
         when Occupation = 'Singer' then @num_S := @num_S + 1
         when Occupation = 'Actor' then @num_A := @num_A + 1
    end
    as row_show,
    (case when Occupation = 'Doctor' then Name else NULL end) as Doctor,
    (case when Occupation = 'Professor' then Name else NULL end) as Professor,
    (case when Occupation = 'Singer' then Name else NULL end) as Singer,
    (case when Occupation = 'Actor' then Name else NULL end) as Actor
    from OCCUPATIONS, (select @num_D := 0) D,(select @num_P := 0) P,(select @num_S := 0) S,(select @num_A := 0) A
    order by Name
) t
group by row_show