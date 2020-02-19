select contest_id,hacker_id,name,tot_s,tot_as,tot_v,tot_uv
from Contests con
join Colleges col using(contest_id)
join Challenges cha using(college_id)
join (select sum(total_views) as tot_v,sum(total_unique_views)as tot_uv from View_Stats group by challenge_id) v
on (cha.challenge_id = v.challenge_id)
join (select sum(total_submissions) as tot_s,sum(total_accepted_submissions)as tot_as from View_Stats group by challenge_id) s
on (cha.challenge_id = s.challenge_id)