drop schema if exists fb2 cascade;
create schema fb2;

set schema 'fb2';

create table _user(
   nickname varchar(30) constraint _user_pk primary key,
   pass varchar(20) not null,
   email varchar(40) not null
 );
 
create table _friendof(
   nickname varchar(30) not null constraint _friendof_user_fk1 references _user,
   friend varchar(30) not null constraint _friendof_user_fk2 references _user,
   birth_date date default current_date,
   constraint _friendof_pk primary key (nickname, friend)
);

create table _friendrequest(
   requester varchar(30) not null constraint _friendrequest_user_fk1 references _user,
   target varchar(30) not null constraint _friendrequest_user_fk2 references _user,
   request_date date default current_date,
   constraint _friendrequest_pk primary key (requester, target)
);

alter table _friendof add constraint name_friend_chk check (nickname != friend);
alter table _friendrequest add constraint name_target_chk check (requester != target);

----
-- Data

copy _user (nickname, pass, email) FROM stdin;
Pierre	erreip	pierre@gcris.net
Paul	luap	paul@gcris.net
Jacques	seuqcaj	jacques@gcris.net
Marie	eiram	marie@gcris.net
Donald	dlanod	donald@gcris.net
Félix	xilef	felix@gcris.net
Julie	eiluj	julie@gcris.net
Henriette	etteirneh	henriette@gcris.net
Vladimir	rimidalv	vladimir@gcris.net
Angela	alegna	angela@gcris.net
Kim	mik	kim@gcris.net
\.

copy _friendof (nickname, friend) FROM stdin;
Jacques	Pierre
Paul	Pierre
Pierre	Marie
Paul	Félix
Félix	Julie
Félix	Marie
Henriette	Julie
Vladimir	Donald
Marie	Donald
\.

--- 1) Proposez une extension au schéma de la base de données du TP1 prenant en compte la description précédente ainsi que toutes les contraintes que vous jugerez pertinentes, le tout au sein d'un schéma 'fb2".

CREATE TABLE _document(
  IDDOC         serial NOT NULL,
  content       VARCHAR(128) NOT NULL,
  author        VARCHAR(20) NOT NULL,
  create_date   DATE DEFAULT CURRENT_DATE,
  CONSTRAINT document_pk PRIMARY KEY (IDDOC),
  CONSTRAINT document_user_fk FOREIGN KEY (author) REFERENCES _user (nickname)
);


CREATE TABLE _post(
  IDDOC   INT NOT NULL,
  CONSTRAINT post_pk PRIMARY KEY (IDDOC),
  CONSTRAINT post_document_fk1 FOREIGN KEY (IDDOC) REFERENCES _document (IDDOC) ON UPDATE CASCADE ON DELETE CASCADE
  
);


CREATE TABLE _comment(
  IDDOC      INT NOT NULL,
  ref        INT NOT NULL,
  CONSTRAINT comment_pk PRIMARY KEY (IDDOC),
  CONSTRAINT comment_document_fk1 FOREIGN KEY (ref) REFERENCES _document (IDDOC),
  CONSTRAINT comment_document_fk2 FOREIGN KEY (IDDOC) REFERENCES _document ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT comment_document_check1 CHECK (IDDOC <> ref)
);

--- 2) Définissez la vue "post" matérialisant l'ensemble des billets accompagnés de leurs caractéristiques.

CREATE OR REPLACE VIEW fb2.post AS
SELECT * FROM _document NATURAL JOIN _post;

---3) Définissez la vue "comment" matérialisant l'ensemble des commentaires accompagnés de leurs caractéristiques.

CREATE OR REPLACE VIEW fb2.comment AS
SELECT * FROM _document NATURAL JOIN _comment;


--- 4) Rendez possibles les opérations suivantes.

CREATE OR REPLACE FUNCTION insertPost() RETURNS TRIGGER AS $body$
DECLARE
  id int;
BEGIN
    INSERT INTO _document(content,author) VALUES (NEW.content,NEW.author)RETURNING IDDOC INTO id;
    INSERT INTO _post VALUES (id);
  RETURN NEW ;
END;
$body$ language plpgsql;


CREATE TRIGGER insertPostTrig INSTEAD OF INSERT
ON fb2.post
FOR EACH ROW
EXECUTE PROCEDURE insertPost();


CREATE OR REPLACE FUNCTION insertComment() RETURNS TRIGGER AS $body$
DECLARE
  id int;
BEGIN
    INSERT INTO _document(content,author) VALUES (NEW.content,NEW.author)RETURNING IDDOC INTO id;
    INSERT INTO _comment VALUES (id,NEW.ref);
  RETURN NEW ;
END;
$body$ language plpgsql;


CREATE TRIGGER insertCommentTrig INSTEAD OF INSERT
ON fb2.comment 
FOR EACH ROW
EXECUTE PROCEDURE insertComment();



--- 5) Le contenu d'un document (post ou comment) n'est plus modifiable dès lors qu'il a été commenté. Réalisez cette contrainte.

CREATE OR REPLACE FUNCTION modifiableDocument() RETURNS TRIGGER AS $body$
BEGIN
  PERFORM *
    FROM fb2.comment c
    WHERE c.ref = OLD.IDDOC ;
      IF found 
        THEN RAISE EXCEPTION 'Ce document n est pas modifiable';
      END IF;
    RETURN NEW;
END 
$body$ language plpgsql;

CREATE TRIGGER updateDocTrig BEFORE UPDATE
ON fb2._document 
FOR EACH ROW
EXECUTE PROCEDURE modifiableDocument();



--ajouter un post 
insert into fb2.post(content,author) values('Lorem ipsum dolor sit amet','Vladimir');

-- ajouter un nouveau post
insert into fb2.post(content,author) values('Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet','Paul');

--insert commentaire qui pointe vers le post d'id 1
insert into fb2.comment(ref,content,author) values(1,'Sed venenatis tellus lectus, vel fermentus purus varius ut','Donald');

--test si la constaint comment_document_check1 fonctionne bien
insert into fb2.comment(ref,content,author) values(4,'Sed venenatis tellus Lorem ipsum dolor sit','Donald');

-- ajouter un commentaire qui point sur le commentaire d'id 3
insert into fb2.comment(ref,content,author) values(3,'Commentaire sur commenataire','Donald');

-- essayer de modifier le post d'id 1 qui a deja un commentaire  
update fb2._document SET content = 'hello toi' WHERE IDDOC = 1;

-- modifier le post d'id 2 qui n'a pas de commentaire
update fb2._document SET content = 'hello toi' WHERE IDDOC = 2;

--essayer de modifier le commentaire d'id 3 qui a un commentaire
update fb2._document SET content = 'Test changement de content sur commentaire' WHERE IDDOC = 3;

