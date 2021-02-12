begin;

  create table main (
    id integer primary key
  );

  create table child_a (
    parent integer not null
      references main (id)
      on delete cascade
      on update cascade,
    name text not null,
    primary key (parent, name)
  );

  create table child_b (
    parent integer not null
      references main (id)
      on delete cascade
      on update cascade,
    name text not null,
    primary key (parent, name)
  );

  create table child_c (
    parent integer not null
      references main (id)
      on delete cascade
      on update cascade,
    name text not null,
    primary key (parent, name)
  );

commit;
