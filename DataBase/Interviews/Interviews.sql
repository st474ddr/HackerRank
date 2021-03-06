set sql_mode = '';
select contest_id,hacker_id,name,all_s,all_as,all_v
from Contests con
join Colleges using (contest_id)
join(
	select college_id,sum(tot_s) as all_s,sum(tot_as) as all_as,sum(tot_v) as all_v,sum(tot_uv) as all_uv
	from Challenges cha
	join (
		select challenge_id,sum(total_views) as tot_v,sum(total_unique_views)as tot_uv 
		from View_Stats 
		group by challenge_id
	) v
	on (cha.challenge_id = v.challenge_id)
	join (
		select challenge_id,sum(total_submissions) as tot_s,sum(total_accepted_submissions)as tot_as 
		from Submission_Stats  
		group by challenge_id
	) s
	on (cha.challenge_id = s.challenge_id)
	group by college_id
) g
group by con.contest_id, con.hacker_id, con.name
having sum(total_submissions)!=0 or 
       sum(total_accepted_submissions)!=0 or
       sum(total_views)!=0 or
       sum(total_unique_views)!=0
order by contest_id;