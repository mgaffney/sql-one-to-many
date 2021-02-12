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
