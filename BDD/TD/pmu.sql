drop schema if exists pmu cascade;
create schema pmu;
set schema 'pmu';

create table cheval (
  nomC VARCHAR(30) PRIMARY KEY,
  an_naiss numeric(4) not null);
 
create table course(
  no_course numeric(3) not null,
  distance numeric(5) not null,
  constraint course_pk primary key(no_course));
  
create table engagement(
  no_course numeric(3) not null,
  nomC varchar(30) not null,
  no_cheval numeric(3) not null,
  constraint engagement_pk primary key (no_course, nomC),
  constraint engagement_ak unique (no_course,no_cheval),
  constraint engagement_fk_course foreign key (no_course) references course(no_course),
  constraint engagement_fk_cheval foreign key (nomC) references cheval(nomC)
 );

create table classement(
  no_course numeric(3) not null,
  no_cheval numeric(3) not null,
  place numeric(3) not null,
  constraint classement_pk primary key (no_course, no_cheval),
  constraint classement_fk_course foreign key  (no_course,no_cheval) references engagement(no_course, no_cheval)
 );



  


