/* ---------------------- Travail Préliminaire ---------------------- */
CREATE SCHEMA fb1;
SET SCHEMA 'fb1';


/* ---------------------- _user ---------------------- */


DROP TABLE _user;
CREATE TABLE _user (
	nom 	VARCHAR(20) NOT NULL,
	email 	VARCHAR(20) NOT NULL,
	pass 	VARCHAR(20) NOT NULL,
	CONSTRAINT _user_pk1 
		PRIMARY KEY (nom)
);

/* Ajout de valeurs */
DELETE FROM _user;
SELECT * FROM _user;

INSERT INTO _user VALUES('Pierre', 'pierre@gmail.com', 'pi');
INSERT INTO _user VALUES('Paul', 'paul@gmail.com', 'pa');
INSERT INTO _user VALUES('Jacques', 'jacques@gmail.com', 'ja');
INSERT INTO _user VALUES('Marie', 'marie@gmail.com', 'ma');
INSERT INTO _user VALUES('Donald', 'donald@gmail.com', 'do');
INSERT INTO _user VALUES('Félix', 'félix@gmail.com', 'fe');
INSERT INTO _user VALUES('Julie', 'julie@gmail.com', 'ju');
INSERT INTO _user VALUES('Henriette', 'henriette@gmail.com', 'he');
INSERT INTO _user VALUES('Vladimir', 'vladimir@gmail.com', 'vl');
INSERT INTO _user VALUES('Angela', 'angela@gmail.com', 'an');
INSERT INTO _user VALUES('Kim', 'kim@gmail.com', 'ki');


/* ---------------------- _friendof ---------------------- */


DROP TABLE _friendof;

CREATE TABLE _friendof (
	nom1		VARCHAR(20) NOT NULL,
	nom2		VARCHAR(20) NOT NULL,
	date_annif	DATE NOT NULL,
	CONSTRAINT _friendof_pk1
		PRIMARY KEY (nom1, nom2),
	CONSTRAINT _friendof_chk
		CHECK (nom1 <> nom2),
	CONSTRAINT _friendof_fk1 FOREIGN KEY (nom1)
		REFERENCES fb1._user(nom),
	CONSTRAINT _friendof_fk2 FOREIGN KEY (nom2)
		REFERENCES fb1._user(nom)
);

/* Drop en cascade */
DROP TRIGGER deja_ami ON fb1._friendof;
DROP FUNCTION _afriends();

CREATE FUNCTION _afriends() RETURNS TRIGGER AS $corps$
	BEGIN
		PERFORM nom1, nom2 FROM fb1._friendof WHERE nom1 = NEW.nom2 AND nom2 = NEW.nom1;
		IF FOUND THEN
			RAISE EXCEPTION 'Ils sont déjà amis';
		END IF;
		RETURN NEW;
	END
$corps$
LANGUAGE plpgsql;

CREATE TRIGGER deja_ami BEFORE INSERT 
ON fb1._friendof FOR EACH ROW EXECUTE PROCEDURE _afriends();

/* Ajout de valeurs */
DELETE FROM _friendof;
SELECT * FROM _friendof;

INSERT INTO fb1._friendof VALUES('Jacques', 'Pierre', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Paul', 'Pierre', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Pierre', 'Marie', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Paul', 'Félix', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Félix', 'Julie', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Félix', 'Marie', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Henriette', 'Julie', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Vladimir', 'Donald', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Marie', 'Donald', CURRENT_DATE);
/* Test de erreurs */
INSERT INTO fb1._friendof VALUES('Pierre', 'Jacques', CURRENT_DATE);
INSERT INTO fb1._friendof VALUES('Pierre', 'Pierre', CURRENT_DATE);


/* ---------------------- MAJ BDD ---------------------- */


DROP TRIGGER modifami ON fb1._friendof;
DROP FUNCTION modif();

CREATE FUNCTION modif() RETURNS TRIGGER AS $corps$
	BEGIN
		RAISE EXCEPTION 'Aucune modification d amitié';
	END
$corps$
LANGUAGE plpgsql;

CREATE TRIGGER modifami BEFORE UPDATE 
ON fb1._friendof FOR EACH ROW EXECUTE PROCEDURE modif();

/**/
/* Deuxième fonction non effectuée par manque de temps */
/**/

DROP TRIGGER suppuser ON fb1._user;
DROP FUNCTION supp();

CREATE OR REPLACE FUNCTION supp() RETURNS TRIGGER AS $corps$
	BEGIN
		DELETE FROM fb1._friendof WHERE nom1 = OLD.nom OR nom2 = OLD.nom;
		RETURN OLD;
	END
$corps$
LANGUAGE plpgsql;

CREATE TRIGGER suppuser BEFORE DELETE 
ON fb1._user FOR EACH ROW EXECUTE PROCEDURE supp();

DELETE FROM fb1._user WHERE nom = 'Vladimir';

/* ---------------------- Expression de requêtes ---------------------- */


/* 1. Listez les amis de Félix */
SELECT nom FROM (
	SELECT nom2 AS nom FROM _friendof WHERE nom1 = 'Félix' 
	UNION 
	SELECT nom1 AS nom FROM _friendof WHERE nom2 = 'Félix'
)_felixfriend;

/* 2.Listez les amis potentiels de Félix. Un ami potentiel d’un usager est un usager qui a un ami en commun avec celui-ci. */
WITH _felixfriend AS (
	SELECT nom2 AS nom FROM _friendof WHERE nom1 = 'Félix' 
	UNION 
	SELECT nom1 AS nom FROM _friendof WHERE nom2 = 'Félix'
)
SELECT nom FROM (
	SELECT nom2 AS nom FROM _friendof, _felixfriend WHERE nom1 = _felixfriend.nom 
	UNION
	SELECT nom1 AS nom FROM _friendof, _felixfriend WHERE nom2 = _felixfriend.nom
)_pfriend WHERE nom <> 'Félix';

/* 3. Définissez la fonction SQL “amis” (cf documentation officielle) qui retourne les amis d’un usager dont le surnom est passé en paramètre. */
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

SELECT * FROM ami('Félix');

/* 4. Définissez la fonction SQL “amis_potentiels” qui retourne l’ensembles des amis potentiels d’un usager dont le surnom est passé en paramètre. 
Réaliser en SQL car je ne n'arrivait pas à la réaliser en PLPGSQL */


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

SELECT * FROM amis_potentiels('Félix');
