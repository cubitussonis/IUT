
drop schema if exists fb1 cascade;
CREATE SCHEMA fb1;
SET SCHEMA 'fb1';


/* ---------------------- _user ---------------------- */


--DROP TABLE _user;
CREATE TABLE _user (
	nom 	VARCHAR(20) NOT NULL,
	email 	VARCHAR(20) NOT NULL,
	pass 	VARCHAR(20) NOT NULL,
	CONSTRAINT _user_pk1 
		PRIMARY KEY (nom)
);



--DELETE FROM _user WHERE nom = 'Felix';
SELECT * FROM _user;

INSERT INTO _user VALUES('Pierre', 'pierre@gmail.com', 'pi');
INSERT INTO _user VALUES('Paul', 'paul@gmail.com', 'pa');
INSERT INTO _user VALUES('Jacques', 'jacques@gmail.com', 'ja');
INSERT INTO _user VALUES('Marie', 'marie@gmail.com', 'ma');
INSERT INTO _user VALUES('Donald', 'donald@gmail.com', 'do');
INSERT INTO _user VALUES('Felix', 'félix@gmail.com', 'fe');
INSERT INTO _user VALUES('Julie', 'julie@gmail.com', 'ju');
INSERT INTO _user VALUES('Henriette', 'henriette@gmail.com', 'he');
INSERT INTO _user VALUES('Vladimir', 'vladimir@gmail.com', 'vl');
INSERT INTO _user VALUES('Angela', 'angela@gmail.com', 'an');
INSERT INTO _user VALUES('Kim', 'kim@gmail.com', 'ki');


/* ---------------------- _friendof ---------------------- */


--DROP TABLE _friendof;

create table _friendOf(
  nom1 VARCHAR(30) not null,
  nom2 VARCHAR(30) not null check (nom1 <> nom2),
  birth_date date default current_date,
  constraint friendOf_pk PRIMARY KEY (nom1, nom2),
  constraint friendOf_fk_nom1 FOREIGN KEY (nom1) REFERENCES _user(nom) ON UPDATE CASCADE ON DELETE CASCADE,
  constraint friendOf_fk_nom2 FOREIGN KEY (nom2) REFERENCES _user(nom) ON UPDATE CASCADE ON DELETE CASCADE
);


--DROP FUNCTION symetrieFriendOf;
CREATE OR REPLACE FUNCTION symetrieFriendOf()
RETURNS trigger AS $sym$
BEGIN

    PERFORM *
    FROM fb1._friendof f 
    WHERE f.nom1=NEW.nom2 AND NEW.nom1=f.nom2 ;
      IF found 
        THEN RAISE EXCEPTION ' Ils sont deja amis !';
      END IF;
  NEW.birth_date=CURRENT_DATE;
return NEW;
END
$sym$ LANGUAGE plpgsql;

--DROP TRIGGER IF EXISTS symetrie_friendof ON _friendOf;
CREATE TRIGGER symetrie_friendof
BEFORE INSERT OR UPDATE
ON _friendOf
FOR EACH ROW
EXECUTE PROCEDURE symetrieFriendOf();

/* Ajout de valeurs */
--DELETE FROM _friendof;
SELECT * FROM _friendof;

INSERT INTO _friendOf (nom1, nom2) VALUES ('Jacques','Pierre');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Pierre','Marie');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Paul','Pierre');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Paul','Felix');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Felix','Marie');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Felix','Julie');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Marie','Donald');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Vladimir','Donald');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Henriette','Julie');
INSERT INTO _friendOf (nom1, nom2) VALUES ('Vladimir','Julie');
--INSERT INTO _friendOf (nom1, nom2) VALUES ('Julie','Vladimir');




/* ---------------------- _friendRequest ---------------------- */



--DROP TABLE _friendRequest;
CREATE TABLE _friendRequest(
  requester VARCHAR(30) not null,
  target VARCHAR(30) not null check (target <> requester),
  birth_date date default current_date,
  constraint friendRequest_pk PRIMARY KEY (requester, target),
  constraint friendRequest_fk_requester FOREIGN KEY (requester) REFERENCES _user(nom) ON UPDATE CASCADE ON DELETE CASCADE,
  constraint friendRequest_fk_target FOREIGN KEY (target) REFERENCES _user(nom) ON UPDATE CASCADE ON DELETE CASCADE
  
);

INSERT INTO _friendRequest (requester, target) VALUES ('Jacques','Pierre');
INSERT INTO _friendRequest (requester, target) VALUES ('Pierre','Marie');
INSERT INTO _friendRequest (requester, target) VALUES ('Paul','Pierre');
INSERT INTO _friendRequest (requester, target) VALUES ('Paul','Felix');
INSERT INTO _friendRequest (requester, target) VALUES ('Felix','Marie');
INSERT INTO _friendRequest (requester, target) VALUES ('Felix','Julie');
INSERT INTO _friendRequest (requester, target) VALUES ('Marie','Donald');
INSERT INTO _friendRequest (requester, target) VALUES ('Vladimir','Donald');
INSERT INTO _friendRequest (requester, target) VALUES ('Henriette','Julie');



/* ---------------------- Update BDD ---------------------- */


--DROP TRIGGER updatefriend ON fb1._friendof;
--DROP FUNCTION modif();

CREATE FUNCTION modif() RETURNS TRIGGER AS $corps$
	BEGIN
		RAISE EXCEPTION 'Aucune modification d amitié';
	END
$corps$
LANGUAGE plpgsql;

CREATE TRIGGER updatefriend BEFORE UPDATE 
ON fb1._friendof FOR EACH ROW EXECUTE PROCEDURE modif();



--DROP TRIGGER deleteuser ON fb1._user;
--DROP FUNCTION supp();

/*CREATE OR REPLACE FUNCTION supp() RETURNS TRIGGER AS $corps$
	BEGIN
		DELETE FROM fb1._friendof WHERE nom1 = OLD.nom OR nom2 = OLD.nom;
		DELETE FROM fb1._friendrequest WHERE requester = OLD.nom OR target = OLD.nom;
		RETURN OLD;
	END
$corps$
LANGUAGE plpgsql;

CREATE TRIGGER deleteuser BEFORE DELETE 
ON fb1._user FOR EACH ROW EXECUTE PROCEDURE supp();

*/


/* ---------------------- Expression de requêtes ---------------------- */


/* 1. Listez les amis de Félix */
SELECT nom FROM (
	SELECT nom2 AS nom FROM _friendof WHERE nom1 = 'Felix' 
	UNION 
	SELECT nom1 AS nom FROM _friendof WHERE nom2 = 'Felix'
)_felixfriend;

/* 2.Listez les amis potentiels de Félix. Un ami potentiel d’un usager est un usager qui a un ami en commun avec celui-ci. */
WITH _felixfriend AS (
	SELECT nom2 AS nom FROM _friendof WHERE nom1 = 'Felix' 
	UNION 
	SELECT nom1 AS nom FROM _friendof WHERE nom2 = 'Felix'
)
SELECT nom FROM (
	SELECT nom2 AS nom FROM _friendof, _felixfriend WHERE nom1 = _felixfriend.nom 
	UNION
	SELECT nom1 AS nom FROM _friendof, _felixfriend WHERE nom2 = _felixfriend.nom
)_pfriend WHERE nom <> 'Felix';

/* 3. Définissez la fonction SQL "amis" (cf documentation officielle) qui retourne les amis d'un usager dont le surnom est passé en paramètre. */
CREATE OR REPLACE FUNCTION ami(namis VARCHAR) RETURNS SETOF VARCHAR(20) AS $corps$
	DECLARE
    	nomde VARCHAR(20);
	BEGIN
    	FOR nomde IN SELECT nom FROM (
            SELECT nom2 AS nom FROM _friendof WHERE nom1 = namis 
            UNION
            SELECT nom1 AS nom FROM _friendof WHERE nom2 = namis
        )_namisfriend
        	LOOP
            	RETURN NEXT nomde;
            END LOOP;
        RETURN;
	END
$corps$
LANGUAGE plpgsql;

SELECT * FROM ami('Felix');

/* 4. Définissez la fonction SQL “amis_potentiels” qui retourne l’ensembles des amis potentiels d’un usager dont le surnom est passé en paramètre.*/


CREATE OR REPLACE FUNCTION amis_potentiels(text) RETURNS SETOF text AS $corps$
	WITH _myfriend AS (
		SELECT nom2 AS nom FROM _friendof WHERE nom1 = $1 
		UNION 
		SELECT nom1 AS nom FROM _friendof WHERE nom2 = $1
	)
	SELECT nom FROM (
		SELECT nom2 AS nom FROM _friendof, _myfriend WHERE nom1 = _myfriend.nom 
		UNION
		SELECT nom1 AS nom FROM _friendof, _myfriend WHERE nom2 = _myfriend.nom
	)_pfriend WHERE nom <> $1;
	
$corps$ LANGUAGE sql;

SELECT * FROM amis_potentiels('Felix');
