select t.hacker_id, name,sum(all_score) as total_score 
from (select hacker_id,max(score) as all_score from Submissions group by hacker_id,challenge_id) t,Hackers h
where t.hacker_id = h.hacker_id
group by t.hacker_id,name
having total_score <> 0
order by total_score desc,t.hacker_id