select if(Marks < 70,'NULL',Name), Grade ,Marks from Students,Grades where Marks >= Min_Mark and Marks <= Max_Mark order by Grade desc,Name,Marks