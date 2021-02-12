   select m.id, a.name, b.name, c.name
     from main m
left join child_a a on m.id = a.parent
left join child_b b on m.id = b.parent
left join child_c c on m.id = c.parent
    where m.id = 1
 order by m.id, a.name, b.name, c.name;

   select m.id, a.name, b.name, c.name
     from (main m left join child_a a on m.id = a.parent)
left join child_b b on m.id = b.parent
left join child_c c on m.id = c.parent
    where m.id = 1
 order by m.id, a.name, b.name, c.name;


-- aggregate the one-to-many into columns
select m.id, string_agg(distinct a.name, ',') as aname,string_agg(distinct b.name, ',') as bname, string_agg(distinct c.name, ',') cname
     from main m 
left join child_a a on m.id = a.parent
left join child_b b on m.id = b.parent
left join child_c c on m.id = c.parent
    where m.id = 1
group by m.id;