-- Script d'insertion de données pour le système de transport d'Alger
-- Période couverte: 01-01-2025 au 01-03-2025

-- Nettoyage des tables existantes (si nécessaire)
DELETE FROM Voyage;
DELETE FROM Troncon;
DELETE FROM Navette;
DELETE FROM Ligne;
DELETE FROM Station;
DELETE FROM MoyenTransport;

-- ===================================================
-- 1. INSERTION DES MOYENS DE TRANSPORT
-- ===================================================
INSERT INTO MoyenTransport (abreviation, heureOuverture, heureFermeture, NbMoyenVoyageurs)
VALUES ('BUS', '05:00', '23:00', 50);

INSERT INTO MoyenTransport (abreviation, heureOuverture, heureFermeture, NbMoyenVoyageurs)
VALUES ('MET', '05:30', '23:30', 120);

INSERT INTO MoyenTransport (abreviation, heureOuverture, heureFermeture, NbMoyenVoyageurs)
VALUES ('TRA', '06:00', '22:30', 80);

INSERT INTO MoyenTransport (abreviation, heureOuverture, heureFermeture, NbMoyenVoyageurs)
VALUES ('TRN', '04:30', '22:00', 150);

-- ===================================================
-- 2. INSERTION DES STATIONS
-- ===================================================

-- Stations principales
INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S001', 'Alger Centre', 36.7539, 3.0589, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S002', 'El Harrach', 36.7167, 3.1500, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S003', 'BEZ', 36.7222, 3.1811, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S004', 'Hussein Dey', 36.7400, 3.1078, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S005', 'Ain Naadja', 36.7019, 3.0547, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S016', 'Kouba', 36.7106, 3.0886, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S017', 'Ben Aknoun', 36.7583, 3.0131, 'principale');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S018', 'Mohammadia', 36.7344, 3.1417, 'principale');

-- Stations secondaires
INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S006', 'Les Fusillés', 36.7514, 3.0631, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S007', 'Place des Martyrs', 36.7758, 3.0597, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S008', 'Jardin d''Essai', 36.7456, 3.0731, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S009', 'Bachdjerrah', 36.7242, 3.1039, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S010', 'Baraki', 36.6742, 3.0978, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S011', 'Dar El Beida', 36.7156, 3.2167, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S012', 'Réghaia', 36.7500, 3.3333, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S013', 'Bordj El Kiffan', 36.7500, 3.1917, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S014', 'Birtouta', 36.6500, 3.0167, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S015', 'Haï El Badr', 36.7214, 3.0871, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S019', 'Oued Smar', 36.7083, 3.1667, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S020', 'Bab El Oued', 36.7869, 3.0533, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S021', 'Bouzareah', 36.8033, 3.0211, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S022', 'Cheraga', 36.7706, 2.9581, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S023', 'Zeralda', 36.7119, 2.8428, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S024', 'Rouiba', 36.7392, 3.2806, 'secondaire');

INSERT INTO Station (codeS, nom, latitude, longitude, type)
VALUES ('S025', 'BEZ', 36.7233, 3.1844, 'secondaire');

-- ===================================================
-- 3. INSERTION DES LIGNES
-- ===================================================

-- Lignes de Bus
INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('B001', 'Alger Centre', 'El Harrach');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('B002', 'Alger Centre', 'Dar El Beida');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('B003', 'Hussein Dey', 'Baraki');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('B004', 'Ben Aknoun', 'Kouba');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('B005', 'Alger Centre', 'Bab El Oued');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('B006', 'Mohammadia', 'Oued Smar');

-- Lignes de Métro
INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('M001', 'Les Fusillés', 'El Harrach');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('M002', 'Place des Martyrs', 'Ain Naadja');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('M003', 'Bab El Oued', 'Kouba');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('M004', 'Alger Centre', 'Ben Aknoun');

-- Lignes de Tramway
INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TR001', 'Hussein Dey', 'Bordj El Kiffan');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TR002', 'Alger Centre', 'BEZ');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TR003', 'Mohammadia', 'Dar El Beida');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TR004', 'Hussein Dey', 'Oued Smar');

-- Lignes de Train
INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TN001', 'Alger Centre', 'Réghaia');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TN002', 'Alger Centre', 'Birtouta');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TN003', 'El Harrach', 'Rouiba');

INSERT INTO Ligne (codeL, stationDepart, stationArrivee)
VALUES ('TN004', 'Alger Centre', 'Zeralda');

-- ===================================================
-- 4. MISE À JOUR DES RÉFÉRENCES ENTRE LES MOYENS DE TRANSPORT ET LES LIGNES
-- ===================================================

-- Associer les lignes de bus au moyen de transport BUS
DECLARE
  mt_ref REF tMoyenTransport;
BEGIN
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'BUS';
  
  UPDATE Ligne l SET l.MoyenTransportL = mt_ref WHERE l.codeL LIKE 'B%';
END;
/

-- Associer les lignes de métro au moyen de transport METRO
DECLARE
  mt_ref REF tMoyenTransport;
BEGIN
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'MET';
  
  UPDATE Ligne l SET l.MoyenTransportL = mt_ref WHERE l.codeL LIKE 'M%';
END;
/

-- Associer les lignes de tramway au moyen de transport TRAM
DECLARE
  mt_ref REF tMoyenTransport;
BEGIN
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'TRA';
  
  UPDATE Ligne l SET l.MoyenTransportL = mt_ref WHERE l.codeL LIKE 'TR%';
END;
/

-- Associer les lignes de train au moyen de transport TRAIN
DECLARE
  mt_ref REF tMoyenTransport;
BEGIN
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'TRN';
  
  UPDATE Ligne l SET l.MoyenTransportL = mt_ref WHERE l.codeL LIKE 'TN%';
END;
/

-- ===================================================
-- 5. INSERTION DES TRONÇONS
-- ===================================================

-- Tronçons pour la ligne de bus B001
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (1, 'Alger Centre', 'Hussein Dey', 5.3);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (2, 'Hussein Dey', 'El Harrach', 4.2);

-- Tronçons pour la ligne de bus B002
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (3, 'Alger Centre', 'Hussein Dey', 5.3);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (4, 'Hussein Dey', 'BEZ', 6.1);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (5, 'BEZ', 'Dar El Beida', 7.4);

-- Tronçons pour la ligne de bus B003
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (6, 'Hussein Dey', 'Bachdjerrah', 3.8);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (7, 'Bachdjerrah', 'Baraki', 7.2);

-- Tronçons pour la ligne de bus B004
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (27, 'Ben Aknoun', 'Alger Centre', 5.8);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (28, 'Alger Centre', 'Kouba', 4.7);

-- Tronçons pour la ligne de bus B005
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (29, 'Alger Centre', 'Bab El Oued', 3.2);

-- Tronçons pour la ligne de bus B006
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (30, 'Mohammadia', 'Oued Smar', 4.5);

-- Tronçons pour la ligne de métro M001
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (8, 'Les Fusillés', 'Jardin d''Essai', 2.5);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (9, 'Jardin d''Essai', 'Hussein Dey', 3.1);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (10, 'Hussein Dey', 'El Harrach', 4.2);

-- Tronçons pour la ligne de métro M002
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (11, 'Place des Martyrs', 'Alger Centre', 1.8);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (12, 'Alger Centre', 'Haï El Badr', 4.3);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (13, 'Haï El Badr', 'Ain Naadja', 3.6);

-- Tronçons pour la ligne de métro M003
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (31, 'Bab El Oued', 'Alger Centre', 3.2);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (32, 'Alger Centre', 'Kouba', 4.7);

-- Tronçons pour la ligne de métro M004
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (33, 'Alger Centre', 'Ben Aknoun', 5.8);

-- Tronçons pour la ligne de tramway TR001
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (14, 'Hussein Dey', 'BEZ', 6.1);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (15, 'BEZ', 'Bordj El Kiffan', 5.3);

-- Tronçons pour la ligne de tramway TR002
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (16, 'Alger Centre', 'Hussein Dey', 5.3);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (17, 'Hussein Dey', 'BEZ', 6.1);

-- Tronçons pour la ligne de tramway TR003
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (34, 'Mohammadia', 'BEZ', 4.1);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (35, 'BEZ', 'Dar El Beida', 7.4);

-- Tronçons pour la ligne de tramway TR004
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (36, 'Hussein Dey', 'Mohammadia', 3.9);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (37, 'Mohammadia', 'Oued Smar', 4.5);

-- Tronçons pour la ligne de train TN001
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (18, 'Alger Centre', 'El Harrach', 9.5);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (19, 'El Harrach', 'Dar El Beida', 6.8);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (20, 'Dar El Beida', 'Réghaia', 12.5);

-- Tronçons pour la ligne de train TN002
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (21, 'Alger Centre', 'Haï El Badr', 4.3);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (22, 'Haï El Badr', 'Birtouta', 9.8);

-- Tronçons pour la ligne de train TN003
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (38, 'El Harrach', 'Dar El Beida', 6.8);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (39, 'Dar El Beida', 'Rouiba', 8.7);

-- Tronçons pour la ligne de train TN004
INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (40, 'Alger Centre', 'Ben Aknoun', 5.8);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (41, 'Ben Aknoun', 'Cheraga', 7.2);

INSERT INTO Troncon (numeroT, stationDebut, stationFin, longueur)
VALUES (42, 'Cheraga', 'Zeralda', 15.3);

-- ===================================================
-- 6. INSERTION DES NAVETTES
-- ===================================================

-- Navettes de Bus
INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (1, 'Hyundai Algérie', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (2, 'Hyundai Algérie', 2023);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (3, 'Isuzu', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (4, 'Mercedes-Benz', 2020);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (5, 'Isuzu', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (15, 'Mercedes-Benz', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (16, 'Iveco', 2023);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (17, 'Hyundai Algérie', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (18, 'Isuzu', 2021);

-- Navettes de Métro
INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (6, 'Alstom', 2020);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (7, 'Alstom', 2020);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (8, 'Alstom', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (19, 'Alstom', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (20, 'CAF', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (21, 'CAF', 2023);

-- Navettes de Tramway
INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (9, 'Citadis', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (10, 'Citadis', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (11, 'Citadis', 2023);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (22, 'Alstom', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (23, 'Alstom', 2023);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (24, 'Citadis', 2021);

-- Navettes de Train
INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (12, 'Siemens', 2019);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (13, 'SNTF', 2020);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (14, 'Siemens', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (25, 'SNTF', 2021);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (26, 'Siemens', 2022);

INSERT INTO Navette (numeroN, marque, anneeMiseEnCirculation)
VALUES (27, 'SNTF', 2020);

-- ===================================================
-- 7. ASSOCIATION DES NAVETTES AUX MOYENS DE TRANSPORT ET LIGNES
-- ===================================================

-- Mise à jour des références pour les navettes de Bus
DECLARE
  mt_ref REF tMoyenTransport;
  ligne_ref REF tLigne;
BEGIN
  -- Récupération de la référence du moyen de transport BUS
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'BUS';
  
  -- Navette 1 -> Ligne B001
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'B001';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 1;

  -- Navette 2 -> Ligne B001
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 2;
  
  -- Navette 3 -> Ligne B002
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'B002';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 3;
  
  -- Navette 4 -> Ligne B002
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 4;
  
  -- Navette 5 -> Ligne B003
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'B003';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 5;
  
  -- Navette 15 -> Ligne B004
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'B004';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 15;
  
  -- Navette 16 -> Ligne B004
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 16;
  
  -- Navette 17 -> Ligne B005
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'B005';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 17;
  
  -- Navette 18 -> Ligne B006
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'B006';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 18;
END;
/

-- Mise à jour des références pour les navettes de Métro
DECLARE
  mt_ref REF tMoyenTransport;
  ligne_ref REF tLigne;
BEGIN
  -- Récupération de la référence du moyen de transport METRO
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'MET';
  
  -- Navette 6 -> Ligne M001
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'M001';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 6;
  
  -- Navette 7 -> Ligne M001
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 7;
  
  -- Navette 8 -> Ligne M002
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'M002';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 8;
  
  -- Navette 19 -> Ligne M002
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 19;
  
  -- Navette 20 -> Ligne M003
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'M003';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 20;
  
  -- Navette 21 -> Ligne M004
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'M004';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 21;
END;
/

-- Mise à jour des références pour les navettes de Tramway
DECLARE
  mt_ref REF tMoyenTransport;
  ligne_ref REF tLigne;
BEGIN
  -- Récupération de la référence du moyen de transport TRAM
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'TRA';
  
  -- Navette 9 -> Ligne TR001
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'TR001';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 9;
  
  -- Navette 10 -> Ligne TR001
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 10;
  
  -- Navette 11 -> Ligne TR002
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'TR002';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 11;
  
  -- Navette 22 -> Ligne TR002
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 22;
  
  -- Navette 23 -> Ligne TR003
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'TR003';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 23;
  
  -- Navette 24 -> Ligne TR004
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'TR004';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 24;



  -- Script d'insertion de données pour la table Voyage


-- Mise à jour des références pour les navettes de Train
DECLARE
  mt_ref REF tMoyenTransport;
  ligne_ref REF tLigne;
BEGIN
  -- Récupération de la référence du moyen de transport TRAIN
  SELECT REF(mt) INTO mt_ref FROM MoyenTransport mt WHERE mt.abreviation = 'TRAIN';
  
  -- Navette 12 -> Ligne TN001
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'TN001';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 12;
  
  -- Navette 13 -> Ligne TN001
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 13;
  
  -- Navette 14 -> Ligne TN002
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = 'TN002';
  UPDATE Navette n SET n.MoyenTransportN = mt_ref, n.LigneN = ligne_ref WHERE n.numeroN = 14;
END;
/


-- Nettoyage de la table Voyage (si nécessaire)
DELETE FROM Voyage;

-- ===================================================
-- INSERTION DES VOYAGES
-- ===================================================

-- Voyages pour les navettes de bus (Ligne B001, Navettes 1 et 2)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 1 (Ligne B001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 1;
  
  -- Voyages aller (Alger Centre -> El Harrach)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (1, TO_DATE('05-01-2025', 'DD-MM-YYYY'), '07:00', '00:45', 'Aller', 42, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (2, TO_DATE('05-01-2025', 'DD-MM-YYYY'), '09:30', '00:50', 'Aller', 38, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (3, TO_DATE('06-01-2025', 'DD-MM-YYYY'), '07:00', '00:45', 'Aller', 45, 'Normal', nav_ref);
  
  -- Voyages retour (El Harrach -> Alger Centre)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (4, TO_DATE('05-01-2025', 'DD-MM-YYYY'), '08:00', '00:40', 'Retour', 40, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (5, TO_DATE('05-01-2025', 'DD-MM-YYYY'), '10:30', '00:45', 'Retour', 47, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (6, TO_DATE('06-01-2025', 'DD-MM-YYYY'), '08:00', '00:40', 'Retour', 43, 'Normal', nav_ref);
  
  -- Navette 2 (Ligne B001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 2;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (7, TO_DATE('05-01-2025', 'DD-MM-YYYY'), '08:15', '00:45', 'Aller', 39, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (8, TO_DATE('06-01-2025', 'DD-MM-YYYY'), '08:15', '00:48', 'Aller', 44, 'Retard', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (9, TO_DATE('05-01-2025', 'DD-MM-YYYY'), '09:15', '00:40', 'Retour', 41, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (10, TO_DATE('06-01-2025', 'DD-MM-YYYY'), '09:15', '00:40', 'Retour', 48, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de bus (Ligne B002, Navettes 3 et 4)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 3 (Ligne B002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 3;
  
  -- Voyages aller (Alger Centre -> Dar El Beida)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (11, TO_DATE('10-01-2025', 'DD-MM-YYYY'), '07:30', '01:15', 'Aller', 37, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (12, TO_DATE('11-01-2025', 'DD-MM-YYYY'), '07:30', '01:20', 'Aller', 42, 'Retard', nav_ref);
  
  -- Voyages retour (Dar El Beida -> Alger Centre)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (13, TO_DATE('10-01-2025', 'DD-MM-YYYY'), '09:00', '01:10', 'Retour', 40, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (14, TO_DATE('11-01-2025', 'DD-MM-YYYY'), '09:00', '01:15', 'Retour', 39, 'Normal', nav_ref);

  -- Navette 4 (Ligne B002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 4;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (15, TO_DATE('12-01-2025', 'DD-MM-YYYY'), '07:30', '01:15', 'Aller', 45, 'Normal', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (16, TO_DATE('12-01-2025', 'DD-MM-YYYY'), '09:00', '01:10', 'Retour', 43, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de bus (Ligne B003, Navette 5)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 5 (Ligne B003)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 5;
  
  -- Voyages aller (Hussein Dey -> Baraki)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (17, TO_DATE('15-01-2025', 'DD-MM-YYYY'), '08:00', '00:55', 'Aller', 38, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (18, TO_DATE('16-01-2025', 'DD-MM-YYYY'), '08:00', '01:10', 'Aller', 42, 'Incident', nav_ref);
  
  -- Voyages retour (Baraki -> Hussein Dey)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (19, TO_DATE('15-01-2025', 'DD-MM-YYYY'), '09:15', '00:50', 'Retour', 36, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (20, TO_DATE('16-01-2025', 'DD-MM-YYYY'), '09:20', '00:55', 'Retour', 41, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de métro (Ligne M001, Navettes 6 et 7)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 6 (Ligne M001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 6;
  
  -- Voyages aller (Les Fusillés -> El Harrach)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (21, TO_DATE('20-01-2025', 'DD-MM-YYYY'), '06:30', '00:25', 'Aller', 98, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (22, TO_DATE('20-01-2025', 'DD-MM-YYYY'), '07:30', '00:25', 'Aller', 115, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (23, TO_DATE('20-01-2025', 'DD-MM-YYYY'), '08:30', '00:30', 'Aller', 120, 'Retard', nav_ref);
  
  -- Voyages retour (El Harrach -> Les Fusillés)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (24, TO_DATE('20-01-2025', 'DD-MM-YYYY'), '07:00', '00:25', 'Retour', 85, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (25, TO_DATE('20-01-2025', 'DD-MM-YYYY'), '08:00', '00:25', 'Retour', 110, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (26, TO_DATE('20-01-2025', 'DD-MM-YYYY'), '09:05', '00:25', 'Retour', 105, 'Normal', nav_ref);

  -- Navette 7 (Ligne M001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 7;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (27, TO_DATE('21-01-2025', 'DD-MM-YYYY'), '06:30', '00:25', 'Aller', 90, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (28, TO_DATE('21-01-2025', 'DD-MM-YYYY'), '07:30', '00:25', 'Aller', 118, 'Normal', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (29, TO_DATE('21-01-2025', 'DD-MM-YYYY'), '07:00', '00:25', 'Retour', 88, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (30, TO_DATE('21-01-2025', 'DD-MM-YYYY'), '08:00', '00:25', 'Retour', 105, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de métro (Ligne M002, Navettes 8 et 19)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 8 (Ligne M002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 8;
  
  -- Voyages aller (Place des Martyrs -> Ain Naadja)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (31, TO_DATE('25-01-2025', 'DD-MM-YYYY'), '07:00', '00:30', 'Aller', 105, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (32, TO_DATE('25-01-2025', 'DD-MM-YYYY'), '08:00', '00:35', 'Aller', 117, 'Retard', nav_ref);
  
  -- Voyages retour (Ain Naadja -> Place des Martyrs)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (33, TO_DATE('25-01-2025', 'DD-MM-YYYY'), '07:35', '00:30', 'Retour', 98, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (34, TO_DATE('25-01-2025', 'DD-MM-YYYY'), '08:40', '00:30', 'Retour', 110, 'Normal', nav_ref);

  -- Navette 19 (Ligne M002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 19;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (35, TO_DATE('26-01-2025', 'DD-MM-YYYY'), '07:00', '00:30', 'Aller', 108, 'Normal', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (36, TO_DATE('26-01-2025', 'DD-MM-YYYY'), '07:35', '00:30', 'Retour', 102, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de tramway (Ligne TR001, Navettes 9 et 10)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 9 (Ligne TR001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 9;
  
  -- Voyages aller (Hussein Dey -> Bordj El Kiffan)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (37, TO_DATE('01-02-2025', 'DD-MM-YYYY'), '06:45', '00:40', 'Aller', 68, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (38, TO_DATE('01-02-2025', 'DD-MM-YYYY'), '07:45', '00:40', 'Aller', 75, 'Normal', nav_ref);
  
  -- Voyages retour (Bordj El Kiffan -> Hussein Dey)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (39, TO_DATE('01-02-2025', 'DD-MM-YYYY'), '07:30', '00:38', 'Retour', 65, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (40, TO_DATE('01-02-2025', 'DD-MM-YYYY'), '08:30', '00:38', 'Retour', 72, 'Normal', nav_ref);

  -- Navette 10 (Ligne TR001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 10;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (41, TO_DATE('02-02-2025', 'DD-MM-YYYY'), '06:45', '00:45', 'Aller', 70, 'Retard', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (42, TO_DATE('02-02-2025', 'DD-MM-YYYY'), '07:35', '00:38', 'Retour', 67, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de tramway (Ligne TR002, Navettes 11 et 22)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 11 (Ligne TR002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 11;
  
  -- Voyages aller (Alger Centre -> BEZ)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (43, TO_DATE('05-02-2025', 'DD-MM-YYYY'), '07:15', '00:35', 'Aller', 72, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (44, TO_DATE('05-02-2025', 'DD-MM-YYYY'), '08:15', '00:40', 'Aller', 78, 'Retard', nav_ref);
  
  -- Voyages retour (BEZ -> Alger Centre)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (45, TO_DATE('05-02-2025', 'DD-MM-YYYY'), '07:55', '00:35', 'Retour', 68, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (46, TO_DATE('05-02-2025', 'DD-MM-YYYY'), '09:00', '00:35', 'Retour', 75, 'Normal', nav_ref);

  -- Navette 22 (Ligne TR002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 22;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (47, TO_DATE('06-02-2025', 'DD-MM-YYYY'), '07:15', '00:35', 'Aller', 70, 'Normal', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (48, TO_DATE('06-02-2025', 'DD-MM-YYYY'), '07:55', '00:35', 'Retour', 65, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de train (Ligne TN001, Navettes 12 et 13)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 12 (Ligne TN001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 12;
  
  -- Voyages aller (Alger Centre -> Réghaia)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (49, TO_DATE('10-02-2025', 'DD-MM-YYYY'), '06:00', '01:10', 'Aller', 135, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (50, TO_DATE('10-02-2025', 'DD-MM-YYYY'), '07:30', '01:15', 'Aller', 142, 'Retard', nav_ref);
  
  -- Voyages retour (Réghaia -> Alger Centre)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (51, TO_DATE('10-02-2025', 'DD-MM-YYYY'), '07:20', '01:10', 'Retour', 128, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (52, TO_DATE('10-02-2025', 'DD-MM-YYYY'), '08:55', '01:10', 'Retour', 138, 'Normal', nav_ref);

  -- Navette 13 (Ligne TN001)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 13;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (53, TO_DATE('11-02-2025', 'DD-MM-YYYY'), '06:00', '01:10', 'Aller', 130, 'Normal', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (54, TO_DATE('11-02-2025', 'DD-MM-YYYY'), '07:20', '01:15', 'Retour', 125, 'Retard', nav_ref);
END;
/

-- Voyages pour les navettes de train (Ligne TN002, Navette 14)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 14 (Ligne TN002)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 14;
  
  -- Voyages aller (Alger Centre -> Birtouta)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (55, TO_DATE('15-02-2025', 'DD-MM-YYYY'), '06:30', '00:50', 'Aller', 140, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (56, TO_DATE('15-02-2025', 'DD-MM-YYYY'), '08:00', '00:55', 'Aller', 145, 'Retard', nav_ref);
  
  -- Voyages retour (Birtouta -> Alger Centre)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (57, TO_DATE('15-02-2025', 'DD-MM-YYYY'), '07:30', '00:50', 'Retour', 132, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (58, TO_DATE('15-02-2025', 'DD-MM-YYYY'), '09:05', '00:50', 'Retour', 138, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de bus (Ligne B004, Navettes 15 et 16)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 15 (Ligne B004)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 15;
  
  -- Voyages aller (Ben Aknoun -> Kouba)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (59, TO_DATE('18-02-2025', 'DD-MM-YYYY'), '07:15', '00:55', 'Aller', 43, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (60, TO_DATE('18-02-2025', 'DD-MM-YYYY'), '09:00', '00:55', 'Aller', 38, 'Normal', nav_ref);
  
  -- Voyages retour (Kouba -> Ben Aknoun)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (61, TO_DATE('18-02-2025', 'DD-MM-YYYY'), '08:15', '00:50', 'Retour', 40, 'Normal', nav_ref);
  
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (62, TO_DATE('18-02-2025', 'DD-MM-YYYY'), '10:00', '00:50', 'Retour', 35, 'Normal', nav_ref);

  -- Navette 16 (Ligne B004)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 16;
  
  -- Voyages aller
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (63, TO_DATE('19-02-2025', 'DD-MM-YYYY'), '07:15', '01:00', 'Aller', 41, 'Retard', nav_ref);
  
  -- Voyages retour
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (64, TO_DATE('19-02-2025', 'DD-MM-YYYY'), '08:20', '00:50', 'Retour', 38, 'Normal', nav_ref);
END;
/

-- Voyages pour les navettes de bus (Ligne B005, Navette 17)
DECLARE
  nav_ref REF tNavette;
BEGIN
  -- Navette 17 (Ligne B005)
  SELECT REF(n) INTO nav_ref FROM Navette n WHERE n.numeroN = 17;
  
  -- Voyages aller (Alger Centre -> Bab El Oued)
  INSERT INTO Voyage (numeroV, dateVoyage, heureDebut, duree, sens, nombreVoyageurs, observation, Navette)
  VALUES (65, TO_DATE('20-02-2025', 'DD-MM-YYYY'), '07:30', '00:25', 'Aller', 45, 'Normal', nav_ref);
  
  
  END;

/


-- ===================================================
-- 8. ASSOCIATIONS ENTRE STATIONS ET MOYENS DE TRANSPORT
-- ===================================================

-- Procédure pour associer un moyen de transport aux stations
CREATE OR REPLACE PROCEDURE AssocierMoyenTransportStations(
  p_mt_code VARCHAR2,
  p_station_codes VARCHAR2
) AS
  mt_ref REF tMoyenTransport;
  station_ref REF tStation;
  v_station_codes SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST();
  v_count INTEGER := 1;
  v_pos INTEGER;
  v_item VARCHAR2(20);
  v_input VARCHAR2(1000) := p_station_codes;
BEGIN
  -- Récupérer la référence du moyen de transport
  SELECT REF(mt) INTO mt_ref 
  FROM MoyenTransport mt 
  WHERE mt.abreviation = p_mt_code;
  
  -- Découper la liste des codes de stations
  LOOP
    v_pos := INSTR(v_input, ',');
    IF v_pos > 0 THEN
      v_item := TRIM(SUBSTR(v_input, 1, v_pos - 1));
      v_input := SUBSTR(v_input, v_pos + 1);
    ELSE
      v_item := TRIM(v_input);
    END IF;
    
    v_station_codes.EXTEND;
    v_station_codes(v_count) := v_item;
    v_count := v_count + 1;
    
    EXIT WHEN v_pos = 0;
  END LOOP;
  
  -- Pour chaque code de station, ajouter le moyen de transport
  FOR i IN 1..v_station_codes.COUNT LOOP
    -- Récupérer la référence de la station
    BEGIN
      SELECT REF(s) INTO station_ref 
      FROM Station s 
      WHERE s.codeS = v_station_codes(i);
      
      -- Mettre à jour les collections
      UPDATE MoyenTransport mt
      SET mt.StationMT = mt.StationMT MULTISET UNION tSetStation(station_ref)
      WHERE mt.abreviation = p_mt_code;
      
      UPDATE Station s
      SET s.moyens = s.moyens MULTISET UNION tSetMoyenTransport(mt_ref)
      WHERE s.codeS = v_station_codes(i);
      
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Station ' || v_station_codes(i) || ' non trouvée.');
    END;
  END LOOP;
END;
/

-- Associer les stations aux moyens de transport
BEGIN
  -- Bus dessert les stations S001, S002, S003, S004, S005, S009, S010, S011
  AssocierMoyenTransportStations('BUS', 'S001,S002,S003,S004,S005,S009,S010,S011');
  
  -- Métro dessert les stations S001, S004, S005, S006, S007, S008, S015
  AssocierMoyenTransportStations('METRO', 'S001,S004,S005,S006,S007,S008,S015');
  
  -- Tramway dessert les stations S001, S003, S004, S013
  AssocierMoyenTransportStations('TRAM', 'S001,S003,S004,S013');
  
  -- Train dessert les stations S001, S002, S011, S012, S014, S015
  AssocierMoyenTransportStations('TRAIN', 'S001,S002,S011,S012,S014,S015');
END;
/

-- ===================================================
-- 9. ASSOCIATIONS ENTRE STATIONS ET LIGNES
-- ===================================================

-- Procédure pour associer des stations à une ligne
CREATE OR REPLACE PROCEDURE AssocierStationsLigne(
  p_ligne_code VARCHAR2,
  p_station_codes VARCHAR2
) AS
  ligne_ref REF tLigne;
  station_ref REF tStation;
  v_station_codes SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST();
  v_count INTEGER := 1;
  v_pos INTEGER;
  v_item VARCHAR2(20);
  v_input VARCHAR2(1000) := p_station_codes;
BEGIN
  -- Récupérer la référence de la ligne
  SELECT REF(l) INTO ligne_ref 
  FROM Ligne l 
  WHERE l.codeL = p_ligne_code;
  
  -- Découper la liste des codes de stations
  LOOP
    v_pos := INSTR(v_input, ',');
    IF v_pos > 0 THEN
      v_item := TRIM(SUBSTR(v_input, 1, v_pos - 1));
      v_input := SUBSTR(v_input, v_pos + 1);
    ELSE
      v_item := TRIM(v_input);
    END IF;
    
    v_station_codes.EXTEND;
    v_station_codes(v_count) := v_item;
    v_count := v_count + 1;
    
    EXIT WHEN v_pos = 0;
  END LOOP;
  
  -- Pour chaque code de station, l'associer à la ligne
  FOR i IN 1..v_station_codes.COUNT LOOP
    -- Récupérer la référence de la station
    BEGIN
      SELECT REF(s) INTO station_ref 
      FROM Station s 
      WHERE s.codeS = v_station_codes(i);
      
      -- Mettre à jour les collections
      UPDATE Ligne l
      SET l.StationsL = l.StationsL MULTISET UNION tSetStation(station_ref)
      WHERE l.codeL = p_ligne_code;
      
      UPDATE Station s
      SET s.lignes = s.lignes MULTISET UNION tSetLigne(ligne_ref)
      WHERE s.codeS = v_station_codes(i);
      
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Station ' || v_station_codes(i) || ' non trouvée.');
    END;
  END LOOP;
END;
/

-- Associer les stations aux lignes
BEGIN
  -- Ligne de bus B001 : Alger Centre -> El Harrach
  AssocierStationsLigne('B001', 'S001,S004,S002');
  
  -- Ligne de bus B002 : Alger Centre -> Dar El Beida
  AssocierStationsLigne('B002', 'S001,S004,S003,S011');
  
  -- Ligne de bus B003 : Hussein Dey -> Baraki
  AssocierStationsLigne('B003', 'S004,S009,S010');
  
  -- Ligne de métro M001 : Les Fusillés -> El Harrach
  AssocierStationsLigne('M001', 'S006,S008,S004,S002');
  
  -- Ligne de métro M002 : Place des Martyrs -> Ain Naadja
  AssocierStationsLigne('M002', 'S007,S001,S015,S005');
  
  -- Ligne de tramway TR001 : Hussein Dey -> Bordj El Kiffan
  AssocierStationsLigne('TR001', 'S004,S003,S013');
  
  -- Ligne de tramway TR002 : Alger Centre -> Bab Ezzouar
  AssocierStationsLigne('TR002', 'S001,S004,S003');
  
  -- Ligne de train TN001 : Alger Centre -> Réghaia
  AssocierStationsLigne('TN001', 'S001,S002,S011,S012');
  
  -- Ligne de train TN002 : Alger Centre -> Birtouta
  AssocierStationsLigne('TN002', 'S001,S015,S014');
END;
/

-- ===================================================
-- 10. ASSOCIATIONS ENTRE TRONÇONS ET STATIONS/LIGNES
-- ===================================================

-- Procédure pour associer un tronçon à des stations et à une ligne
CREATE OR REPLACE PROCEDURE AssocierTronconStationsLigne(
  p_troncon_num INTEGER,
  p_station_codes VARCHAR2,
  p_ligne_code VARCHAR2
) AS
  troncon_ref REF tTroncon;
  station_ref REF tStation;
  ligne_ref REF tLigne;
  v_station_codes SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST();
  v_count INTEGER := 1;
  v_pos INTEGER;
  v_item VARCHAR2(20);
  v_input VARCHAR2(1000) := p_station_codes;
BEGIN
  -- Récupérer les références
  SELECT REF(t) INTO troncon_ref FROM Troncon t WHERE t.numeroT = p_troncon_num;
  SELECT REF(l) INTO ligne_ref FROM Ligne l WHERE l.codeL = p_ligne_code;
  
  -- Découper la liste des codes de stations
  LOOP
    v_pos := INSTR(v_input, ',');
    IF v_pos > 0 THEN
      v_item := TRIM(SUBSTR(v_input, 1, v_pos - 1));
      v_input := SUBSTR(v_input, v_pos + 1);
    ELSE
      v_item := TRIM(v_input);
    END IF;
    
    v_station_codes.EXTEND;
    v_station_codes(v_count) := v_item;
    v_count := v_count + 1;
    
    EXIT WHEN v_pos = 0;