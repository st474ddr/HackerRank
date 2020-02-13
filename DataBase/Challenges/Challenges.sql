/*先找出最大值 再用union 連接其他不重複的資料*/
SET sql_mode = '';
select c1.hacker_id as h_id,name,count(c1.hacker_id) as cnt from Hackers h1
join Challenges c1 using(hacker_id)
group by c1.hacker_id,name
having count(c1.hacker_id)=(
    select max(challenges_created) 
    from (
        select count(hacker_id) as challenges_created 
        from Challenges
        group by hacker_id
    ) g
)
union
select c2.hacker_id as h_id,name,count(c2.hacker_id) as cnt from Hackers h2
join Challenges c2 using(hacker_id)
group by c2.hacker_id,name
having cnt not in (
    select challenges_created
    from (
        select count(hacker_id) as challenges_created 
        from Challenges
        group by hacker_id
    ) g1
    group by challenges_created 
    having count(challenges_created) > 1
)
order by cnt DESC, h_id
