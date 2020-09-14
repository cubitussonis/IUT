drop schema if exists enfants cascade;

create schema enfants;

set schema 'enfants';

CREATE TABLE enfants._enfant(
   nopers     INTEGER constraint _enfant_pk primary key,
   prenom     VARCHAR(20 )not null,
   points     INTEGER not null,
   classe     VARCHAR(10) not null
);

INSERT INTO enfants._enfant VALUES(1,'Jean',10,'CE1_2');
INSERT INTO enfants._enfant VALUES(2,'Pierre',17,'CE1_2');
INSERT INTO enfants._enfant VALUES(3,'Alfred',15,'CE1_2');
INSERT INTO enfants._enfant VALUES(4,'Aline',9,'CE2_2');

CREATE TABLE enfants.enfant(
   nopers     INTEGER constraint enfant_pk primary key,
   prenom     VARCHAR(20 )not null,
   points     INTEGER not null,
   classe     VARCHAR(10) not null
);



create or replace function enfants.init() returns void as $$
begin
	delete from enfants.enfant;
	insert into enfants.enfant select * from enfants._enfant;
end;
$$ language plpgsql;

commit;

select enfants.init();

commit;
