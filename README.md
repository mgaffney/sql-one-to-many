# One to Many Examples

Query 1:

```sql
   select m.id, a.name, b.name, c.name
     from main m
left join child_a a on m.id = a.parent
left join child_b b on m.id = b.parent
left join child_c c on m.id = c.parent
    where m.id = 1
 order by m.id, a.name, b.name, c.name;
```

Output from query 1:

```
 id │ name  │ name  │ name
════╪═══════╪═══════╪═══════
  1 │ 1.a.1 │ 1.b.1 │ 1.c.1
  1 │ 1.a.1 │ 1.b.1 │ 1.c.2
  1 │ 1.a.1 │ 1.b.1 │ 1.c.3
  1 │ 1.a.1 │ 1.b.2 │ 1.c.1
  1 │ 1.a.1 │ 1.b.2 │ 1.c.2
  1 │ 1.a.1 │ 1.b.2 │ 1.c.3
  1 │ 1.a.1 │ 1.b.3 │ 1.c.1
  1 │ 1.a.1 │ 1.b.3 │ 1.c.2
  1 │ 1.a.1 │ 1.b.3 │ 1.c.3
  1 │ 1.a.2 │ 1.b.1 │ 1.c.1
  1 │ 1.a.2 │ 1.b.1 │ 1.c.2
  1 │ 1.a.2 │ 1.b.1 │ 1.c.3
  1 │ 1.a.2 │ 1.b.2 │ 1.c.1
  1 │ 1.a.2 │ 1.b.2 │ 1.c.2
  1 │ 1.a.2 │ 1.b.2 │ 1.c.3
  1 │ 1.a.2 │ 1.b.3 │ 1.c.1
  1 │ 1.a.2 │ 1.b.3 │ 1.c.2
  1 │ 1.a.2 │ 1.b.3 │ 1.c.3
  1 │ 1.a.3 │ 1.b.1 │ 1.c.1
  1 │ 1.a.3 │ 1.b.1 │ 1.c.2
  1 │ 1.a.3 │ 1.b.1 │ 1.c.3
  1 │ 1.a.3 │ 1.b.2 │ 1.c.1
  1 │ 1.a.3 │ 1.b.2 │ 1.c.2
  1 │ 1.a.3 │ 1.b.2 │ 1.c.3
  1 │ 1.a.3 │ 1.b.3 │ 1.c.1
  1 │ 1.a.3 │ 1.b.3 │ 1.c.2
  1 │ 1.a.3 │ 1.b.3 │ 1.c.3
(27 rows)

Time: 0.606 ms
```

Query 2:

```sql
   select m.id, a.name, b.name, c.name
     from (main m left join child_a a on m.id = a.parent)
left join child_b b on m.id = b.parent
left join child_c c on m.id = c.parent
    where m.id = 1
 order by m.id, a.name, b.name, c.name;
```

Output from query 2:

```
 id │ name  │ name  │ name
════╪═══════╪═══════╪═══════
  1 │ 1.a.1 │ 1.b.1 │ 1.c.1
  1 │ 1.a.1 │ 1.b.1 │ 1.c.2
  1 │ 1.a.1 │ 1.b.1 │ 1.c.3
  1 │ 1.a.1 │ 1.b.2 │ 1.c.1
  1 │ 1.a.1 │ 1.b.2 │ 1.c.2
  1 │ 1.a.1 │ 1.b.2 │ 1.c.3
  1 │ 1.a.1 │ 1.b.3 │ 1.c.1
  1 │ 1.a.1 │ 1.b.3 │ 1.c.2
  1 │ 1.a.1 │ 1.b.3 │ 1.c.3
  1 │ 1.a.2 │ 1.b.1 │ 1.c.1
  1 │ 1.a.2 │ 1.b.1 │ 1.c.2
  1 │ 1.a.2 │ 1.b.1 │ 1.c.3
  1 │ 1.a.2 │ 1.b.2 │ 1.c.1
  1 │ 1.a.2 │ 1.b.2 │ 1.c.2
  1 │ 1.a.2 │ 1.b.2 │ 1.c.3
  1 │ 1.a.2 │ 1.b.3 │ 1.c.1
  1 │ 1.a.2 │ 1.b.3 │ 1.c.2
  1 │ 1.a.2 │ 1.b.3 │ 1.c.3
  1 │ 1.a.3 │ 1.b.1 │ 1.c.1
  1 │ 1.a.3 │ 1.b.1 │ 1.c.2
  1 │ 1.a.3 │ 1.b.1 │ 1.c.3
  1 │ 1.a.3 │ 1.b.2 │ 1.c.1
  1 │ 1.a.3 │ 1.b.2 │ 1.c.2
  1 │ 1.a.3 │ 1.b.2 │ 1.c.3
  1 │ 1.a.3 │ 1.b.3 │ 1.c.1
  1 │ 1.a.3 │ 1.b.3 │ 1.c.2
  1 │ 1.a.3 │ 1.b.3 │ 1.c.3
(27 rows)

Time: 0.582 ms
```
---

Query 3
```sql
-- aggregate the one-to-many into columns
select 
  m.id, 
  string_agg(distinct a.name, ',') as aname,
  string_agg(distinct b.name, ',') as bname, 
  string_agg(distinct c.name, ',') cname
from main m 
left join child_a a on m.id = a.parent
left join child_b b on m.id = b.parent
left join child_c c on m.id = c.parent
    where m.id = 1
group by m.id;
```
```
| id  | aname             | bname             | cname             |
| --- | ----------------- | ----------------- | ----------------- |
| 1   | 1.a.1,1.a.2,1.a.3 | 1.b.1,1.b.2,1.b.3 | 1.c.1,1.c.2,1.c.3 |
 
 Time: 2ms
```
## Setup

### Create Database

```zsh
export PG_DB="one-to-many"; export PG_URL="postgres:///${PG_DB}?sslmode=disable"
createdb $PG_DB
```

### Run Up Migrations

```zsh
for f in migrations/*.up.sql; do psql -d $PG_DB -f "$f"; done
```

## Useful Migration Commands

### Run Down Migrations

```zsh
for f in $(ls -r migrations/*.down.sql); do psql -d $PG_DB -f "$f"; done
```


### Run Down then Up Migrations

```zsh
for f in $(ls -r migrations/*.down.sql); do psql -d $PG_DB -f "$f"; done && \
  for f in migrations/*.up.sql; do psql -d $PG_DB -f "$f"; done
```
