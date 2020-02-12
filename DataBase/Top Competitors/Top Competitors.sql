select s.hacker_id,name from Challenges c
join Difficulty d using(difficulty_level)
join Submissions s on (c.challenge_id = s.challenge_id and s.score = d.score)
join Hackers h on(s.hacker_id = h.hacker_id)
group by s.hacker_id,name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc,s.hacker_id asc