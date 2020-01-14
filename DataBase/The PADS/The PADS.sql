select concat(Name,'(',substr(OCCUPATION,1,1),')') from OCCUPATIONS order by Name;

select concat('There are a total of ',count(OCCUPATION),' ',lower(OCCUPATION),if(count(OCCUPATION) = 1,'.','s.')) from OCCUPATIONS group by OCCUPATION order by count(OCCUPATION),OCCUPATION asc;
