-- Creation de user sql3 et ses tables space --
CREATE TABLESPACE SQL3_TBS DATAFILE 'sql3_tbs.dbf' SIZE 100M;
CREATE TEMPORARY TABLESPACE SQL3_TempTBS TEMPFILE 'sql3_temp_tbs.dbf' SIZE 100M;


CREATE USER SQL3 IDENTIFIED BY sql3_password
DEFAULT TABLESPACE SQL3_TBS
TEMPORARY TABLESPACE SQL3_TempTBS;

GRANT ALL PRIVILEGES TO SQL3;


-- Creation des types --

CREATE TYPE tStation;/
CREATE TYPE tMoyenTransport;/
CREATE TYPE tLigne;/
CREATE TYPE tNavette;/
CREATE TYPE tVoyage;/
CREATE TYPE tTroncon;/

CREATE TYPE tSetLigne AS TABLE OF REF tLigne; 
CREATE TYPE tSetVoyage AS TABLE OF REF tVoyage; 
CREATE TYPE tSetTroncon AS TABLE OF REF tTroncon;
CREATE TYPE tSetNavette AS TABLE OF REF tNavette;
CREATE TYPE tSetStation AS TABLE OF REF tStation;
CREATE TYPE tSetMoyenTransport AS TABLE OF REF tMoyenTransport;


CREATE OR REPLACE TYPE tStation AS OBJECT (
    codeS VARCHAR2(10),
    nom VARCHAR2(100),
    latitude FLOAT,
    longitude FLOAT,
    type VARCHAR2(20), -- principale ou secondaire
    lignes tSetLigne,
    troncons tSetTroncon,
    moyens tSetMoyenTransport
  );

CREATE OR REPLACE TYPE tMoyenTransport AS OBJECT (
  abreviation VARCHAR2(10),
  heureOuverture VARCHAR2(5),     -- format HH:MI
  heureFermeture VARCHAR2(5),
  NbMoyenVoyageurs INTEGER,

  LigneMT tSetLigne,              -- REF vers lignes
  StationMT tSetStation,          -- REF vers stations
  NavetteMT tSetNavette           -- REF vers navettes
);
/

CREATE OR REPLACE TYPE tLigne AS OBJECT (
  codeL VARCHAR2(10),
  stationDepart VARCHAR2(100),
  stationArrivee VARCHAR2(100),
  MoyenTransportL REF tMoyenTransport,
  NavetteL tSetNavette,
  StationsL tSetStation,
  TronconL tSetTroncon
);
/

CREATE OR REPLACE TYPE tNavette AS OBJECT (
  numeroN INTEGER,
  marque VARCHAR2(50),
  anneeMiseEnCirculation INTEGER,
  MoyenTransportN REF tMoyenTransport,
  LigneN REF tLigne,
  Voyages tSetVoyage
);
/

CREATE OR REPLACE TYPE tTroncon AS OBJECT (
  numeroT INTEGER,
  stationDebut VARCHAR2(100),
  stationFin VARCHAR2(100),
  longueur FLOAT,
  StationsT tSetStation,
  LignesT tSetLigne
);
/

CREATE OR REPLACE TYPE tVoyage AS OBJECT (
  numeroV INTEGER,
  dateVoyage DATE,
  heureDebut VARCHAR2(5),        -- exemple : '08:30'
  duree VARCHAR2(5),             -- exemple : '01:30'
  sens VARCHAR2(10),             -- Aller / Retour
  nombreVoyageurs INTEGER,
  observation VARCHAR2(20),
  Navette REF tNavette
);
/


--Creation des tables--

CREATE TABLE Station OF tStation
   (PRIMARY KEY (codeS))
   NESTED TABLE lignes STORE AS TableLigne
   NESTED TABLE troncons STORE AS TableTroncon
   NESTED TABLE moyens STORE AS TableMoyenTransport;


CREATE TABLE MoyenTransport OF tMoyenTransport
   (PRIMARY KEY (abreviation))
   NESTED TABLE LigneMT STORE AS TableLigneM
   NESTED TABLE StationMT STORE AS TableStationM
   NESTED TABLE NavetteMT STORE AS TableNavetteM;


CREATE TABLE Ligne OF tLigne
   (PRIMARY KEY (codeL))
   NESTED TABLE NavetteL STORE AS TableNavetteL
   NESTED TABLE StationsL STORE AS TableStationL
   NESTED TABLE TronconL STORE AS TableTronconL;


CREATE TABLE Navette OF tNavette
   (PRIMARY KEY (numeroN))
   NESTED TABLE Voyages STORE AS TableVoyageN;


CREATE TABLE Troncon OF tTroncon
   (PRIMARY KEY (numeroT))
   NESTED TABLE StationsT STORE AS TableStationT
   NESTED TABLE LignesT STORE AS TableLigneT;


CREATE TABLE Voyage OF tVoyage
   (PRIMARY KEY (numeroV));



-- Ajout de méthodes aux types  --

ALTER TYPE tNavette ADD MEMBER FUNCTION nbVoyages RETURN INTEGER CASCADE;

CREATE OR REPLACE TYPE BODY tNavette AS
  MEMBER FUNCTION nbVoyages RETURN INTEGER IS
    total INTEGER;
  BEGIN
    SELECT COUNT(*) INTO total
    FROM TABLE(self.Voyages);
    
    RETURN total;
  END;
END;
/


ALTER TYPE tLigne ADD MEMBER FUNCTION listeNavettes RETURN tSetNavette CASCADE;

CREATE OR REPLACE TYPE BODY tLigne AS
  MEMBER FUNCTION listeNavettes RETURN tSetNavette IS
    resultat tSetNavette := tSetNavette();
  BEGIN
    
    SELECT CAST(COLLECT(REF(n)) AS tSetNavette)
    INTO resultat
    FROM Navette n
    WHERE DEREF(n.LigneN) = SELF;  

    RETURN resultat;
  END;
END;
/


ALTER TYPE tLigne ADD MEMBER FUNCTION nbVoyagesPeriode(date_debut DATE, date_fin DATE) RETURN INTEGER CASCADE;

CREATE OR REPLACE TYPE BODY tLigne AS
  MEMBER FUNCTION nbVoyagesPeriode(date_debut DATE, date_fin DATE) RETURN INTEGER IS
    total INTEGER := 0;
  BEGIN
    -- Comptage des voyages dans la période spécifiée
    SELECT COUNT(*)
    INTO total
    FROM Navette n
    , TABLE(n.Voyages) v -- 'Voyages' est une collection
    WHERE REF(n) = SELF -- La ligne actuelle est liée à la navette via REF
    AND v.dateVoyage BETWEEN date_debut AND date_fin; -- Filtrer sur la période

    RETURN total;
  END;
END;
/

ALTER TYPE tLigne ADD MEMBER PROCEDURE majNomStation CASCADE;

CREATE OR REPLACE TYPE BODY tLigne AS
  MEMBER PROCEDURE majNomStation IS
  BEGIN
    -- Mise à jour des noms dans StationsL
    FOR s IN (
      SELECT VALUE(st)
      FROM TABLE(SELF.StationsL) st
      WHERE st.nom = 'BEZ'
    )
    LOOP
      s.nom := 'Univ';
    END LOOP;

    -- Mise à jour des noms dans les tronçons associés
    FOR t IN (
      SELECT VALUE(tr)
      FROM TABLE(SELF.TronconL) tr
    )
    LOOP
      FOR st IN (
        SELECT VALUE(st2)
        FROM TABLE(t.StationsT) st2
        WHERE st2.nom = 'BEZ'
      )
      LOOP
        st.nom := 'Univ';
      END LOOP;
    END LOOP;
  END;
END;
/


CREATE OR REPLACE TYPE tStatMT AS OBJECT (
  total_voyages INTEGER,
  total_voyageurs INTEGER
);
/
ALTER TYPE tMoyenTransport ADD MEMBER FUNCTION VoyageVoyageur(nomMT VARCHAR2, date_cible DATE) RETURN tStatMT CASCADE;
CREATE OR REPLACE FUNCTION VoyageVoyageur(nomMT VARCHAR2, date_cible DATE)
    RETURN tStatMT IS
        total_voyages INTEGER := 0;
        total_voyageurs INTEGER := 0;
    BEGIN
        -- Solution alternative avec sous-requête
        SELECT COUNT(v.numeroV), NVL(SUM(v.nombreVoyageurs), 0)
        INTO total_voyages, total_voyageurs
        FROM Voyage v
        WHERE v.dateVoyage = date_cible
        AND EXISTS (
            SELECT 1
            FROM MoyenTransport mt, TABLE(mt.NavetteMT) n
            WHERE mt.abreviation = nomMT
            AND v.Navette = REF(n)
        );

        RETURN tStatMT(total_voyages, total_voyageurs);
    END;
/



-- requette sql3 --

SELECT v.numeroV AS num_voyage,
       v.dateVoyage AS date_voyage,
       mt.abreviation AS moyen_transport,
       DEREF(v.Navette).numeroN AS num_navette,
       v.observation AS probleme
FROM Voyage v,
     MoyenTransport mt
WHERE v.observation IS NOT NULL
AND v.observation != 'RAS'
AND DEREF(v.Navette).MoyenTransportN = REF(mt)


SELECT DISTINCT
    l.codeL AS "Numéro Ligne",
    l.stationDepart AS "Station Départ",
    l.stationArrivee AS "Station Arrivée"
FROM 
    Ligne l
WHERE 
    l.stationDepart IN (SELECT nom FROM Station WHERE type = 'principale')
    OR l.stationArrivee IN (SELECT nom FROM Station WHERE type = 'principale')
ORDER BY l.codeL



WITH StatsVoyages AS (
    SELECT 
        DEREF(v.Navette).numeroN AS num_navette,
        DEREF(DEREF(v.Navette).MoyenTransportN).abreviation AS type_transport,
        DEREF(v.Navette).anneeMiseEnCirculation AS annee_mise_service,
        COUNT(*) AS nb_voyages
    FROM Voyage v
    WHERE v.dateVoyage BETWEEN TO_DATE('01/01/2025', 'DD/MM/YYYY') 
                          AND TO_DATE('31/01/2025', 'DD/MM/YYYY')
    GROUP BY 
        DEREF(v.Navette).numeroN,
        DEREF(DEREF(v.Navette).MoyenTransportN).abreviation,
        DEREF(v.Navette).anneeMiseEnCirculation
)
SELECT num_navette, type_transport, annee_mise_service, nb_voyages
FROM StatsVoyages
WHERE nb_voyages = (SELECT MAX(nb_voyages) FROM StatsVoyages);


SELECT 
    s.codeS AS code_station,
    s.nom AS nom_station,
    (SELECT LISTAGG(mt.abreviation, ', ') WITHIN GROUP (ORDER BY mt.abreviation)
    FROM MoyenTransport mt
    WHERE REF(mt) IN (SELECT COLUMN_VALUE FROM TABLE(s.moyens))) AS moyens_transport,
    CARDINALITY(s.moyens) AS nombre_moyens
FROM Station s
WHERE CARDINALITY(s.moyens) >= 2
ORDER BY nombre_moyens DESC;

