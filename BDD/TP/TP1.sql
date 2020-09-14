drop schema if exists fb1 cascade;
create schema fb1;
set schema 'fb1';

create table _user(
  nickname VARCHAR(30) PRIMARY KEY,
  pass VARCHAR(30) not null,
  email VARCHAR(50) not null
);

create table _friendRequest(
  requester VARCHAR(30) not null,
  target VARCHAR(30) not null,
  birth_date date not null,
  constraint friendRequest_pk PRIMARY KEY (requester, target),
  constraint friendRequest_fk_requester FOREIGN KEY (requester) REFERENCES _user(nickname),
  constraint friendRequest_fk_target FOREIGN KEY (target) REFERENCES _user(nickname)
);

create table _friendOf(
  friend VARCHAR(30) not null,
  friendOf VARCHAR(30) not null,
  birth_date date not null,
  constraint friendOf_pk PRIMARY KEY (friend, friendOf),
  constraint friendOf_fk_friend FOREIGN KEY (friend) REFERENCES _user(nickname),
  constraint friendOf_fk_friendOf FOREIGN KEY (friendOf) REFERENCES _user(nickname)
);


INSERT INTO _user (nickname, pass, email) VALUES ('Jacques','passJacques','jacques@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Pierre','passPierre','pierres@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Marie','passMarie','marie@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Donald','passDonald','donald@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Paul','passPaul','paul@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Felix','passFelix','felix@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Vladimir','passVlad','vlad@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Julie','passJulie','julie@email.com');
INSERT INTO _user (nickname, pass, email) VALUES ('Henriette','passHenriette','henriette@email.com');


INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Jacques','Pierre', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Pierre','Marie', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Paul','Pierre', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Paul','Felix', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Felix','Marie', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Felix','Julie', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Marie','Donald', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Vladimir','Donald', NOW());
INSERT INTO _friendRequest (requester, target, birth_date) VALUES ('Henriette','Julie', NOW());

INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Jacques','Pierre', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Pierre','Marie', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Paul','Pierre', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Paul','Felix', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Felix','Marie', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Felix','Julie', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Marie','Donald', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Vladimir','Donald', NOW());
INSERT INTO _friendOf (friend, friendOf, birth_date) VALUES ('Henriette','Julie', NOW());



SELECT friend FROM _friendOf WHERE friendOf = 'Felix';
