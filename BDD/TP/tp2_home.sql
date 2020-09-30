drop table _friendOf;
drop table _friendrequest;
drop function symetrieFriendOf;
drop trigger symetrie_friendof;
drop function friendableRequest;
drop table _user;
Drop schema fb1;
CREATE SCHEMA fb1;
set schema 'fb1';
CREATE TABLE _user
(
  nickname   VARCHAR(20) not null,
  pass       VARCHAR(20) not null,
  email      VARCHAR(20) not null,
  CONSTRAINT _user_pk PRIMARY KEY (nickname)
);

CREATE TABLE _friendOf
(
  nickname VARCHAR(20) not null,
  friend VARCHAR(20) NOT NULL,
  birth_date DATE NOT NULL,

	CONSTRAINT _friendof_pk
		PRIMARY KEY(nickname, friend),
	CONSTRAINT _friendOf__user_fk1 
		FOREIGN KEY(nickname) REFERENCES _user(nickname),
	CONSTRAINT _friendOf__user_fk2 
		FOREIGN KEY(friend) REFERENCES _user(nickname),
	CONSTRAINT _friendof_noreflex CHECK (nickname != friend)
);

CREATE TABLE _friendrequest(
	targets VARCHAR(20) NOT NULL,
	requesters VARCHAR(20) NOT NULL,
	request_date DATE NOT NULL,

	CONSTRAINT _friendrequest_pk
		PRIMARY KEY(targets, requesters),
	CONSTRAINT _friendrequest__user_fk1 
		FOREIGN KEY(targets) REFERENCES _user(nickname),
	CONSTRAINT _friendrequest__user_fk2 
		FOREIGN KEY(requesters) REFERENCES _user(nickname),
	CONSTRAINT _friendrequest_noreflex CHECK (targets != requesters)
);

--Fonction et trigger sur la symetrie de la relation friendOf
CREATE OR REPLACE FUNCTION symetrieFriendOf()
RETURNS trigger AS $sym$
BEGIN

    PERFORM *
    FROM fb1._friendof fof 
    WHERE fof.nickname=NEW.friend AND NEW.nickname=fof.friend ;
      IF found 
        THEN RAISE EXCEPTION ' % est deja ami avec %',NEW.nickname, NEW.friend;
      END IF;
  NEW.birth_date=CURRENT_DATE;
return NEW;
END
$sym$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS symetrie_friendof ON _friendOf;
CREATE TRIGGER symetrie_friendof
BEFORE INSERT OR UPDATE
ON _friendOf
FOR EACH ROW
EXECUTE PROCEDURE symetrieFriendOf();




--Fonction et trigger sur la capacite qu'ont deux personnes a s'envoyer une "friendrequest" 
CREATE OR REPLACE FUNCTION friendableRequest()
RETURNS trigger AS $ad$
BEGIN

    PERFORM *
    FROM _friendrequest freq 
    WHERE freq.requesters=NEW.targets AND NEW.targets=fof.requesters ;
      IF found 
        THEN RAISE EXCEPTION ' % a deja invite %',NEW.requesters, NEW.targets;
      END IF;

    PERFORM *
    FROM _friendOf fof
    WHERE ((fof.nickname=NEW.targets AND fof.friend=NEW.requesters) OR (fof.friend=NEW.targets AND fof.nickname=NEW.requesters));
      IF found 
        THEN RAISE EXCEPTION ' % et % sont deja amis',NEW.requesters, NEW.targets;
      END IF;
      
  NEW.request_date=CURRENT_DATE;
return NEW;
END
$ad$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS friendable_friendrq ON _friendRequest;
CREATE TRIGGER friendable_friendrq
BEFORE INSERT OR UPDATE
ON _friendRequest
FOR EACH ROW
EXECUTE PROCEDURE friendableRequest();

--fonction et trigger empechant l'update 
create or replace function noUpdateOnFriendRequest()
returns trigger as $noUp$
begin 
  raise exception 'pas d update possible ';
  return 0;
end
$noUp$ language plpgsql;

--fonction et trigger pour la suppression d'un utilisateur
create trigger noUpdate 
before update 
on _friendRequest 
for each row
execute procedure noUpdateOnFriendRequest();

create or replace function supprimerUser()
returns trigger as $sup$
begin
  delete from _friendOf where (nickname=old.nickname) or (friend=old.nickname);
  delete from _friendRequest where (requesters=old.nickname) or (targets=requesters);
  return old;
end
$sup$ language plpgsql;
  

create trigger suppressionUser
before delete 
on _user
for each row
execute procedure supprimerUser();

commit;

-- TP 2 ---------
drop table fb1._Comment;
drop table fb1._Post;
drop table fb1._Document;
CREATE TABLE fb1._Document
(
  IDDoc         serial NOT NULL,
  content       VARCHAR(200) NOT NULL,
  auteur        VARCHAR(20) NOT NULL,
  create_date   DATE NOT NULL DEFAULT CURRENT_DATE,
  CONSTRAINT _Document_pk PRIMARY KEY (IDDoc),
  CONSTRAINT _Document_user_fk FOREIGN KEY (auteur) REFERENCES fb1._user (nickname)
);

CREATE TABLE fb1._Post
(
  IDDoc   INT NOT NULL,
  CONSTRAINT _Post_pk PRIMARY KEY (IDDoc),
  CONSTRAINT _Post_Document_fk1 FOREIGN KEY (IDDoc) REFERENCES fb1._Document (IDDoc)
  
);

CREATE TABLE fb1._Comment
(
  IDDoc      INT NOT NULL,
  ref        INT NOT NULL,
  commente   INT NULL,
  CONSTRAINT _Comment_Document_fk1 FOREIGN KEY (ref) REFERENCES fb1._Document (IDDoc),
  constraint _Comment_Document_fk2 foreign key (IDDoc) references fb1._Document
  
);

CREATE OR REPLACE VIEW fb1.post 
AS
SELECT *
FROM fb1._Document natural join fb1._Post;

CREATE OR REPLACE FUNCTION commentaires (INTEGER) RETURNS setof INTEGER
AS
$$
SELECT IDDoc
FROM fb1._Comment
WHERE ref = $1
ORDER BY IDDoc ASC 

$$ LANGUAGE sql;

--SELECT commentaires('');
-- a revoir
create or replace function fb1.insertionDocumentPost() returns trigger as $doc$
declare
  id int;
begin
    INSERT INTO fb1._Document(content,auteur,create_date) values
    (new.content,new.auteur,new.create_date)returning IDDoc into id;
    insert into fb1._Post values (id);
  RETURN NEW ;
end;
$doc$ language plpgsql;

CREATE OR REPLACE VIEW fb1.post 
AS
SELECT *
FROM fb1._Document natural join fb1._Comment;

create trigger laVueComment 
instead of insert 
on fb1.post 
for each row
execute procedure fb1.insertionDocument();

create or replace function fb1.insertionDocumentComment() returns trigger as $doc$
declare
  id int;
begin
    INSERT INTO fb1._Document values (id)returning IDDoc into id;
    insert into fb1._Post values (id);
  RETURN NEW ;
end;
$doc$ language plpgsql;
