begin;

  insert into main (id) values
    (1), (2), (3);

  insert into child_a (parent, name) values
    (1, '1.a.1'),
    (1, '1.a.2'),
    (1, '1.a.3'),
    (2, '2.a.1'),
    (2, '2.a.2'),
    (2, '2.a.3'),
    (3, '3.a.1'),
    (3, '3.a.2'),
    (3, '3.a.3');

  insert into child_b (parent, name) values
    (1, '1.b.1'),
    (1, '1.b.2'),
    (1, '1.b.3'),
    (2, '2.b.1'),
    (2, '2.b.2'),
    (2, '2.b.3'),
    (3, '3.b.1'),
    (3, '3.b.2'),
    (3, '3.b.3');

  insert into child_c (parent, name) values
    (1, '1.c.1'),
    (1, '1.c.2'),
    (1, '1.c.3'),
    (2, '2.c.1'),
    (2, '2.c.2'),
    (2, '2.c.3'),
    (3, '3.c.1'),
    (3, '3.c.2'),
    (3, '3.c.3');

commit;
