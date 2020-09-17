drop schema if exists fb1 cascade;
create schema fb1;
set schema 'fb1';

create table _user(
  nickname VARCHAR(30) PRIMARY KEY,
  pass VARCHAR(30) not null,
  email VARCHAR(50) not null CHECK(email LIKE '%@%.%')
  --constraint user_email CHECK(email LIKE '%@%')
);

create table _friendRequest(
  requester VARCHAR(30) not null,
  target VARCHAR(30) not null check (target != requester),
  birth_date date default current_date,
  constraint friendRequest_pk PRIMARY KEY (requester, target),
  constraint friendRequest_fk_requester FOREIGN KEY (requester) REFERENCES _user(nickname),
  constraint friendRequest_fk_target FOREIGN KEY (target) REFERENCES _user(nickname)
  
);

create table _friendOf(
  friend VARCHAR(30) not null,
  friendOf VARCHAR(30) not null check (friend != friendOf),
  birth_date date default current_date,
  constraint friendOf_pk PRIMARY KEY (friend, friendOf),
  constraint friendOf_fk_friend FOREIGN KEY (friend) REFERENCES _user(nickname),
  constraint friendOf_fk_friendOf FOREIGN KEY (friendOf) REFERENCES _user(nickname)
);


/*CREATE FUNCTION friend_symetry()
BEGIN
  
END


CREATE TRIGGER new_friend BEFORE INSERT ON _friendOf
FOR EACH ROW
EXECUTE PROCEDURE
friend_symetry();



CREATE FUNCTION amis(a VARCHAR) RETURNS VARCHAR AS $$
  BEGIN
      RETURN ((SELECT friend FROM _friendOf WHERE friendOf = a) UNION (SELECT friendOf FROM _friendOf WHERE friend = a));
  END;
  $$ LANGUAGE plpgsql;
  
--DROP FUNCTION amis;*/

INSERT INTO _user (nickname, pass, email) VALUES ('Jacques','passJacques','jacques@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Pierre','passPierre','pierres@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Marie','passMarie','marie@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Donald','passDonald','donald@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Paul','passPaul','paul@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Felix','passFelix','felix@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Vladimir','passVlad','vlad@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Julie','passJulie','julie@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Henriette','passHenriette','henriette@email.com');


INSERT INTO _friendRequest (requester, target) VALUES ('Jacques','Pierre');
INSERT INTO _friendRequest (requester, target) VALUES ('Pierre','Marie');
INSERT INTO _friendRequest (requester, target) VALUES ('Paul','Pierre');
INSERT INTO _friendRequest (requester, target) VALUES ('Paul','Felix');
INSERT INTO _friendRequest (requester, target) VALUES ('Felix','Marie');
INSERT INTO _friendRequest (requester, target) VALUES ('Felix','Julie');
INSERT INTO _friendRequest (requester, target) VALUES ('Marie','Donald');
INSERT INTO _friendRequest (requester, target) VALUES ('Vladimir','Donald');
INSERT INTO _friendRequest (requester, target) VALUES ('Henriette','Julie');

INSERT INTO _friendOf (friend, friendOf) VALUES ('Jacques','Pierre');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Pierre','Marie');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Paul','Pierre');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Paul','Felix');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Felix','Marie');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Felix','Julie');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Marie','Donald');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Vladimir','Donald');
INSERT INTO _friendOf (friend, friendOf) VALUES ('Henriette','Julie');




--question 1:
--(SELECT friend FROM _friendOf WHERE friendOf = 'Felix') UNION (SELECT friendOf FROM _friendOf WHERE friend = 'Felix');

--qestion 2:
--SELECT friend FROM _friendOf WHERE friendOf = (SELECT friend FROM _friendOf WHERE friendOf = 'Marie');

--question 3
--SELECT amis('Felix');
