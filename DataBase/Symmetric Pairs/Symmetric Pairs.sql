select distinct a.x,a.y from
    (select @id := @id+1 as id1,x,y 
    from Functions, (select @id := 0) rank1 order by x asc, y asc) a
    join 
    (select @_id := @_id+1 as id2,x,y from Functions,(select @_id := 0) rank2 order by x asc, y asc) b
    on a.id1 <> b.id2 and a.x = b.y and a.y = b.x and a.x <= a.y