-- init.sql for proj1
drop sequence if exists worker_id_seq cascade;
drop sequence if exists workshop_id_seq cascade;
drop table if exists workers cascade;
drop table if exists workshops cascade;
drop table if exists worker_workshop cascade;

create sequence worker_id_seq;
create sequence workshop_id_seq;
create table workers(
  id integer not null default nextval('worker_id_seq'),
  name varchar(100),
  username varchar(30) unique,
  password char(32),
  department varchar(40),
  primary key (id)
);
create table workshops(
  id integer not null default nextval('workshop_id_seq'),
  title varchar(200),
  primary key (id)
);
create table worker_workshop(
  worker_id integer references workers(id) on delete cascade,
  workshop_id integer references workshops(id) on delete cascade
);

create or replace view worker_workshops_view as
  select workers.id as workid,workers.name,
  workers.department,workshops.id as wsid,workshops.title
  from workers inner join worker_workshop on
  workers.id=worker_workshop.worker_id inner join
  workshops on workshops.id=worker_workshop.workshop_id;
