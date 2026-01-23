CREATE DATABASE ges_bibliotheque_93;
USE ges_bibliotheque_93;

CREATE TABLE LIVRE (
code_catalogue VARCHAR (3) PRIMARY KEY,
titre VARCHAR (200),
genre VARCHAR (200));

CREATE TABLE EXEMPLAIRE (
code_rayon VARCHAR (3) PRIMARY KEY,
code_catalogue VARCHAR (3),
date_acqui DATE NOT NULL,
code_usure VARCHAR (3),
nom_edit VARCHAR (200),
FOREIGN KEY (code_catalogue) REFERENCES LIVRE(code_catalogue));

ALTER TABLE EXEMPLAIRE
MODIFY COLUMN code_usure VARCHAR(50);

CREATE TABLE AUTEUR (
id_auteur VARCHAR (3) PRIMARY KEY,
nom_auteur VARCHAR (200),
prenom_auteur VARCHAR (200));

CREATE TABLE ABONNE (
num_matricule VARCHAR (3) PRIMARY KEY,
nom VARCHAR (200),
adresse VARCHAR (200),
telephone VARCHAR (10),
date_naissance DATE NOT NULL,
date_adhesion DATE NOT NULL,
categorie_pro VARCHAR (200));

CREATE TABLE DEMANDE (
id_demande VARCHAR (3) PRIMARY KEY,
code_catalogue VARCHAR (3),
num_matricule VARCHAR (3),
date_demande DATE NOT NULL,
date_exp_priorite DATE NOT NULL,
FOREIGN KEY (code_catalogue) REFERENCES LIVRE(code_catalogue),
FOREIGN KEY (num_matricule) REFERENCES ABONNE(num_matricule));

CREATE TABLE PRET (
id_pret VARCHAR (3) PRIMARY KEY,
code_rayon VARCHAR (3),
num_matricule VARCHAR (3),
date_pret DATE NOT NULL,
date_retour_prevu DATE NOT NULL,
date_retour_effectif DATE NOT NULL,
renouvellement BOOLEAN NOT NULL,
FOREIGN KEY (code_rayon) REFERENCES EXEMPLAIRE (code_rayon),
FOREIGN KEY (num_matricule) REFERENCES ABONNE(num_matricule));

ALTER TABLE PRET
MODIFY COLUMN date_retour_effectif DATE;

CREATE TABLE MOT_CLE (
id_mot_cle VARCHAR (3) PRIMARY KEY,
mot_cle VARCHAR (255)NOT NULL);

CREATE TABLE ecrit_par
(code_catalogue VARCHAR (3),
id_auteur VARCHAR (3),
PRIMARY KEY (code_catalogue, id_auteur),
FOREIGN KEY (code_catalogue) REFERENCES LIVRE(code_catalogue),
FOREIGN KEY (id_auteur) REFERENCES AUTEUR(id_auteur));

CREATE TABLE caracterise_par
(code_catalogue VARCHAR (3),
id_mot_cle VARCHAR (3),
PRIMARY KEY (code_catalogue, id_mot_cle),
FOREIGN KEY (code_catalogue) REFERENCES LIVRE(code_catalogue),
FOREIGN KEY (id_mot_cle) REFERENCES MOT_CLE(id_mot_cle));

INSERT INTO LIVRE VALUES ('L01', 'One Piece', 'Shonen');
INSERT INTO LIVRE VALUES ('L02', 'Naruto', 'Shonen');
INSERT INTO LIVRE VALUES ('L03', 'Shingeki No Kyojin', 'Seinen');
INSERT INTO LIVRE VALUES ('L04', 'Vinland Saga','Seinen');
INSERT INTO LIVRE VALUES ('L05', 'Dragon Ball Z', 'Shonen');
INSERT INTO LIVRE VALUES ('L06', 'My hero academia', 'Shonen');
INSERT INTO LIVRE VALUES ('L07', 'Fairy Tail', 'Shonen');
INSERT INTO LIVRE VALUES ('L08', 'Fullmetal Alchemist', 'Shonen');
INSERT INTO LIVRE VALUES ('L09', 'Hunter X Hunter', 'Shonen');
INSERT INTO LIVRE VALUES ('L10', 'Death Note', 'Seinen');
INSERT INTO LIVRE VALUES ('L11', 'JoJos Bizarre Adventure', 'Shonen');
INSERT INTO LIVRE VALUES ('L12', 'Tokyo Ghoul', 'Seinen');
INSERT INTO LIVRE VALUES ('L13', 'Bleach', 'Shonen');
INSERT INTO LIVRE VALUES ('L14', 'Inazuma Eleven', 'Shonen');
INSERT INTO LIVRE VALUES ('L15', 'Haykyuu!!', 'Shonen');
INSERT INTO LIVRE VALUES ('L16', 'Vagabond', 'Seinen');
INSERT INTO LIVRE VALUES ('L17', 'Slam Dunk', 'Shonen');
INSERT INTO LIVRE VALUES ('L18', 'Silent Voice', 'Shojo');
INSERT INTO LIVRE VALUES ('L19', 'One Punch Man', 'Shonen');
INSERT INTO LIVRE VALUES ('L20', 'GTO', 'Seinen');
SELECT * FROM LIVRE;

INSERT INTO AUTEUR VALUES ('A01', 'Oda' ,'Eiichiro');
INSERT INTO AUTEUR VALUES ('A02', 'Kishimoto', 'Masashi');
INSERT INTO AUTEUR VALUES ('A03', 'Isayama', 'Hajime');
INSERT INTO AUTEUR VALUES ('A04', 'Yukimura', 'Makoto');
INSERT INTO AUTEUR VALUES ('A05', 'Toriyama', 'Akira');
INSERT INTO AUTEUR VALUES ('A06', 'Horikoshi', 'Kohei');
INSERT INTO AUTEUR VALUES ('A07', 'Mashima', 'Hiro');
INSERT INTO AUTEUR VALUES ('A08', 'Arakawa', 'Hiromu');
INSERT INTO AUTEUR VALUES ('A09', 'Togashi', 'Yoshihiro');
INSERT INTO AUTEUR VALUES ('A10', 'Ohba', 'Tsugumi');
INSERT INTO AUTEUR VALUES ('A11', 'Hirohiko', 'Araki');
INSERT INTO AUTEUR VALUES ('A12', 'Sui', 'Ishida');
INSERT INTO AUTEUR VALUES ('A13', 'Tite', 'Kubo');
INSERT INTO AUTEUR VALUES ('A14', 'Tenya', 'Yabuno');
INSERT INTO AUTEUR VALUES ('A15', 'Haruichi', 'Furudate');
INSERT INTO AUTEUR VALUES ('A16', 'Takehiko', 'Inoue');
INSERT INTO AUTEUR VALUES ('A17', 'Takehiko', 'Inoue');
INSERT INTO AUTEUR VALUES ('A18', 'Yoshitoki', 'Oima');
INSERT INTO AUTEUR VALUES ('A19', 'ONE, Yusuke', 'Murata');
INSERT INTO AUTEUR VALUES ('A20', 'Tohru', 'Fujisawa');
SELECT * FROM AUTEUR;

INSERT INTO MOT_CLE VALUES ('M01', 'totalitarisme');
INSERT INTO MOT_CLE VALUES ('M02', 'violence');
INSERT INTO MOT_CLE VALUES ('M03', 'guerre');
INSERT INTO MOT_CLE VALUES ('M04', 'combat');
INSERT INTO MOT_CLE VALUES ('M05', 'romance');
INSERT INTO MOT_CLE VALUES ('M06', 'enfance');
INSERT INTO MOT_CLE VALUES ('M07', 'pirate');
INSERT INTO MOT_CLE VALUES ('M08', 'ninja');
INSERT INTO MOT_CLE VALUES ('M09', 'aventure');
INSERT INTO MOT_CLE VALUES ('M10', 'passion');
INSERT INTO MOT_CLE VALUES ('M11', 'alchimie');
INSERT INTO MOT_CLE VALUES ('M12', 'magie');
INSERT INTO MOT_CLE VALUES ('M13', 'mer');
INSERT INTO MOT_CLE VALUES ('M14', 'épopée');
INSERT INTO MOT_CLE VALUES ('M15', 'tranquillité');
INSERT INTO MOT_CLE VALUES ('M16', 'mythologie');
INSERT INTO MOT_CLE VALUES ('M17', 'vengeance');
INSERT INTO MOT_CLE VALUES ('M18', 'ambition');
INSERT INTO MOT_CLE VALUES ('M19', 'sport');
INSERT INTO MOT_CLE VALUES ('M20', 'scolaire');
SELECT * FROM MOT_CLE;

INSERT INTO ecrit_par VALUES ('L01', 'A01');
INSERT INTO ecrit_par VALUES ('L02', 'A02');
INSERT INTO ecrit_par VALUES ('L03', 'A03');
INSERT INTO ecrit_par VALUES ('L04', 'A04');
INSERT INTO ecrit_par VALUES ('L05', 'A05');
INSERT INTO ecrit_par VALUES ('L06', 'A06');
INSERT INTO ecrit_par VALUES ('L07', 'A07');
INSERT INTO ecrit_par VALUES ('L08', 'A08');
INSERT INTO ecrit_par VALUES ('L09', 'A09');
INSERT INTO ecrit_par VALUES ('L10', 'A10');
INSERT INTO ecrit_par VALUES ('L11', 'A11');
INSERT INTO ecrit_par VALUES ('L12', 'A12');
INSERT INTO ecrit_par VALUES ('L13', 'A13');
INSERT INTO ecrit_par VALUES ('L14', 'A14');
INSERT INTO ecrit_par VALUES ('L15', 'A15');
INSERT INTO ecrit_par VALUES ('L16', 'A16');
INSERT INTO ecrit_par VALUES ('L17', 'A17');
INSERT INTO ecrit_par VALUES ('L18', 'A18');
INSERT INTO ecrit_par VALUES ('L19', 'A19');
INSERT INTO ecrit_par VALUES ('L20', 'A20');
SELECT * FROM ecrit_par;

INSERT INTO caracterise_par VALUES ('L01', 'M04');
INSERT INTO caracterise_par VALUES ('L01', 'M07');
INSERT INTO caracterise_par VALUES ('L01', 'M09');
INSERT INTO caracterise_par VALUES ('L01', 'M13');
INSERT INTO caracterise_par VALUES ('L01', 'M14');
INSERT INTO caracterise_par VALUES ('L02', 'M03');
INSERT INTO caracterise_par VALUES ('L02', 'M04');
INSERT INTO caracterise_par VALUES ('L02', 'M06');
INSERT INTO caracterise_par VALUES ('L02', 'M08');
INSERT INTO caracterise_par VALUES ('L03', 'M02');
INSERT INTO caracterise_par VALUES ('L04', 'M17');
INSERT INTO caracterise_par VALUES ('L05', 'M04');
INSERT INTO caracterise_par VALUES ('L06', 'M18');
INSERT INTO caracterise_par VALUES ('L06', 'M20');
INSERT INTO caracterise_par VALUES ('L07', 'M12');
INSERT INTO caracterise_par VALUES ('L08', 'M11');
INSERT INTO caracterise_par VALUES ('L09', 'M10');
INSERT INTO caracterise_par VALUES ('L10', 'M16');
INSERT INTO caracterise_par VALUES ('L11', 'M09');
INSERT INTO caracterise_par VALUES ('L12', 'M02');
INSERT INTO caracterise_par VALUES ('L13', 'M04');
INSERT INTO caracterise_par VALUES ('L14', 'M19');
INSERT INTO caracterise_par VALUES ('L15', 'M19');
INSERT INTO caracterise_par VALUES ('L16', 'M15');
INSERT INTO caracterise_par VALUES ('L17', 'M19');
INSERT INTO caracterise_par VALUES ('L18', 'M05');
INSERT INTO caracterise_par VALUES ('L19', 'M04');
INSERT INTO caracterise_par VALUES ('L20', 'M20');
SELECT * FROM caracterise_par;

INSERT INTO EXEMPLAIRE VALUES('R01','L01', '2020-01-15', 'BON', 'Gallimard');
INSERT INTO EXEMPLAIRE VALUES('R02', 'L02', '2022-03-20', 'NEUF', 'Folio');
INSERT INTO EXEMPLAIRE VALUES('R03', 'L03', '2019-05-10', 'MOYEN' , 'Le Livre de Poche'); 
INSERT INTO EXEMPLAIRE VALUES('R04', 'L04', '2021-09-01', 'BON', 'Gallimard Jeunesse');
INSERT INTO EXEMPLAIRE VALUES('R05', 'L05', '2023-01-15', 'NEUF', 'Gallimard Jeunesse');
INSERT INTO EXEMPLAIRE VALUES('R06', 'L06','2018-06-12', 'MOYEN', 'Pocket');
INSERT INTO EXEMPLAIRE VALUES('R07', 'L07', '2020-11-03', 'BON', 'Gallimard');
INSERT INTO EXEMPLAIRE VALUES('R08', 'L08', '2021-02-28', 'NEUF', 'Gallimard');
INSERT INTO EXEMPLAIRE VALUES('R09', 'L09', '2019-07-19', 'BON', 'Denoël');
INSERT INTO EXEMPLAIRE VALUES('R10', 'L10', '2020-04-22', 'MOYEN', 'Christian Bourgois');
INSERT INTO EXEMPLAIRE VALUES('R11', 'L11', '2018-10-05', 'MAUVAIS', 'Actes Sud');
INSERT INTO EXEMPLAIRE VALUES('R12', 'L12', '2021-08-14', 'BON', 'Robert Laffont');
INSERT INTO EXEMPLAIRE VALUES('R13', 'L13', '2023-05-10', 'NEUF', 'Pocket');
INSERT INTO EXEMPLAIRE VALUES('R14', 'L14', '2019-12-01', 'BON', '10/18');
INSERT INTO EXEMPLAIRE VALUES('R15', 'L15', '2020-03-17', 'MOYEN', 'Le Livre de Poche');
INSERT INTO EXEMPLAIRE VALUES('R16', 'L16', '2018-09-23', 'MAUVAIS', 'Folio');
INSERT INTO EXEMPLAIRE VALUES('R17', 'L17', '2021-06-30', 'BON', 'Grasset');
INSERT INTO EXEMPLAIRE VALUES('R18', 'L18', '2022-01-11', 'NEUF', 'Denoël');
INSERT INTO EXEMPLAIRE VALUES('R19', 'L19', '2019-04-08', 'MOYEN', 'Pocket');
INSERT INTO EXEMPLAIRE VALUES('R20', 'L20', '2020-07-25', 'BON', 'Folio');
SELECT * FROM EXEMPLAIRE;

INSERT INTO ABONNE VALUES ('A01', 'Luffy', '12 rue de la Paix, 93000 Bobigny', '0601020304', '1985-03-15', '2020-01-10', 'Pirate');
INSERT INTO ABONNE VALUES ('A02', 'Nami', '45 avenue Jean Jaurès, 93100 Montreuil', '0612131415', '1992-07-22', '2020-02-15', 'Pirate');
INSERT INTO ABONNE VALUES ('A03', 'Zoro', '8 boulevard Victor Hugo, 93200 Saint-Denis', '0623242526', '2005-11-30', '2020-03-20', 'Pirate');
INSERT INTO ABONNE VALUES('A04', 'Sanji', '23 rue Gambetta, 93300 Aubervilliers', '0634353637', '1978-05-10', '2021-01-05', 'Pirate');
INSERT INTO ABONNE VALUES('A05', 'Robin', '67 avenue de la République, 93400 Saint-Ouen', '0645464748', '2010-12-25', '2021-02-18', 'Pirate');
INSERT INTO ABONNE VALUES('A06', 'Usopp', '89 rue Lénine, 93500 Pantin', '0656575859', '1995-08-14', '2021-04-22', 'Pirate');
INSERT INTO ABONNE VALUES('A07', 'Chopper', '34 place de la Mairie, 93600 Aulnay-sous-Bois', '0667686970', '1988-02-28', '2022-01-12', 'Pirate');
INSERT INTO ABONNE VALUES('A08', 'Brook', '56 rue du Commerce, 93700 Drancy', '0678798081', '2008-06-17', '2022-03-30', 'Pirate');
INSERT INTO ABONNE VALUE ('A09', 'Jinbei', '12 avenue Pasteur, 93800 Épinay-sur-Seine', '0689909192', '1982-10-03', '2022-05-14', 'Pirate');
INSERT INTO ABONNE VALUES('A10', 'Shanks', '78 boulevard Voltaire, 93150 Le Blanc-Mesnil', '0690919293', '1999-01-20', '2022-07-08', 'Pirate');
INSERT INTO ABONNE VALUES('A11', 'Ace', '90 rue Robespierre, 93170 Bagnolet', '0601020305', '1975-09-12', '2023-01-15', 'Pirate');
INSERT INTO ABONNE VALUES('A12', 'Gol D. Roger', '11 avenue des Lilas, 93190 Livry-Gargan', '0612131416', '2012-04-08', '2023-02-20', 'Pirate');
INSERT INTO ABONNE VALUES('A13', 'Hange', '43 rue de Paris, 93210 Saint-Denis', '0623242527', '1991-12-19', '2023-03-10', 'Scientifique');
INSERT INTO ABONNE VALUES('A14', 'Mikasa', '65 boulevard Saint-Michel, 93220 Gagny', '0634353638', '2006-07-30', '2023-05-22', 'Combattante');
INSERT INTO ABONNE VALUES('A15', 'Ymir', '87 avenue du Général de Gaulle, 93230 Romainville', '0645464749', '1980-11-05', '2023-06-18', 'Combattante');
INSERT INTO ABONNE VALUES('A16', 'Erza', '22 rue Jean Moulin, 93240 Stains', '0656575860', '1997-03-27', '2023-08-02', 'Mage');
INSERT INTO ABONNE VALUES('A17', 'Lucy', '44 place de la Libération, 93250 Villemomble', '0667686971', '2009-09-14', '2024-01-10', 'Mage');
INSERT INTO ABONNE VALUES('A18', 'Mirajane', '66 rue Henri Barbusse, 93260 Les Lilas', '0678798082', '1987-06-21', '2024-02-14', 'Mage');
INSERT INTO ABONNE VALUES('A19', 'Happy', '88 avenue Karl Marx, 93270 Sevran', '0689909193', '1994-02-11', '2024-04-20', 'Compagnon');
INSERT INTO ABONNE VALUES('A20', 'Carla', '10 boulevard de Verdun, 93290 Tremblay-en-France', '0690919294', '2011-10-26', '2024-06-05', 'Compagnon');
SELECT * FROM ABONNE;

INSERT INTO PRET VALUES ('P01','R01', 'A01', '2024-01-10', '2024-01-25', '2024-01-24', FALSE);
INSERT INTO PRET VALUES('P02','R02', 'A02', '2024-01-15', '2024-01-30', '2024-02-02', FALSE);
INSERT INTO PRET VALUES('P03','R03', 'A03', '2024-02-01', '2024-02-16', '2024-02-15', FALSE);
INSERT INTO PRET VALUES('P04','R04', 'A04', '2024-02-10', '2024-02-25', '2024-02-28', FALSE);
INSERT INTO PRET VALUES('P05','R05', 'A05', '2024-03-05', '2024-03-20', '2024-03-18', FALSE);
INSERT INTO PRET VALUES('P06','R06', 'A06', '2024-03-12', '2024-03-27', '2024-03-30', FALSE);
INSERT INTO PRET VALUES('P07','R07', 'A07', '2024-04-01', '2024-04-16', '2024-04-14', FALSE);
INSERT INTO PRET VALUES('P08','R08', 'A08', '2024-04-08', '2024-04-23', '2024-04-22', FALSE);
INSERT INTO PRET VALUES('P09','R09', 'A09', '2024-05-03', '2024-05-18', '2024-05-20', FALSE);
INSERT INTO PRET VALUES('P10','R10', 'A10', '2024-05-15', '2024-05-30', '2024-05-29', FALSE);
INSERT INTO PRET VALUES('P11','R11', 'A11', '2024-12-01', '2024-12-16', NULL, FALSE);
INSERT INTO PRET VALUES('P12','R12', 'A12', '2024-12-05', '2024-12-20', NULL, FALSE);
INSERT INTO PRET VALUES('P13','R13', 'A13', '2024-12-08', '2024-12-23', NULL, FALSE);
INSERT INTO PRET VALUES('P14','R14', 'A14', '2024-12-10', '2024-12-25', NULL, FALSE);
INSERT INTO PRET VALUES('P15','R15', 'A15', '2024-12-12', '2024-12-27', NULL, FALSE);
INSERT INTO PRET VALUES('P16','R16', 'A16', '2024-11-01', '2024-11-16', '2024-11-15', TRUE);
INSERT INTO PRET VALUES('P17','R17', 'A17', '2024-11-16', '2024-12-01', '2024-11-30', FALSE);
INSERT INTO PRET VALUES('P18','R18', 'A18', '2024-11-10', '2024-11-25', '2024-11-24', TRUE);
INSERT INTO PRET VALUES('P19','R19', 'A19', '2024-11-25', '2024-12-10', '2024-12-09', FALSE);
INSERT INTO PRET VALUES('P20','R20', 'A20', '2024-12-01', '2024-12-16', NULL, TRUE);
SELECT * FROM PRET;

INSERT INTO DEMANDE VALUES ('D01','L01', 'A01', '2024-11-01', '2024-11-08');
INSERT INTO DEMANDE VALUES ('D02','L02', 'A02', '2024-11-05', '2024-11-12');
INSERT INTO DEMANDE VALUES ('D03','L03', 'A03', '2024-11-10', '2024-11-17');
INSERT INTO DEMANDE VALUES ('D04','L04', 'A04', '2024-11-15', '2024-11-22');
INSERT INTO DEMANDE VALUES ('D05','L05', 'A05', '2024-11-20', '2024-11-27');
INSERT INTO DEMANDE VALUES('D06','L06', 'A06', '2024-12-15', '2024-12-22');
INSERT INTO DEMANDE VALUES('D07','L07', 'A07', '2024-12-16', '2024-12-23');
INSERT INTO DEMANDE VALUES('D08','L08', 'A08', '2024-12-18', '2024-12-25');
INSERT INTO DEMANDE VALUES('D09','L09', 'A09', '2024-12-20', '2024-12-27');
INSERT INTO DEMANDE VALUES('D10','L10', 'A10', '2024-12-21', '2024-12-28');
INSERT INTO DEMANDE VALUES('D11','L11', 'A11', '2024-12-22', '2024-12-29');
INSERT INTO DEMANDE VALUES('D12','L12', 'A12', '2024-12-23', '2024-12-30');
INSERT INTO DEMANDE VALUES('D13','L13', 'A13', '2024-12-24', '2024-12-31');
INSERT INTO DEMANDE VALUES('D14','L14', 'A14', '2024-12-25', '2025-01-01');
INSERT INTO DEMANDE VALUES('D15','L15', 'A15', '2024-12-26', '2025-01-02');
INSERT INTO DEMANDE VALUES('D16','L16', 'A16', '2024-12-28', '2025-01-04');
INSERT INTO DEMANDE VALUES('D17','L17', 'A17', '2024-12-28', '2025-01-04');
INSERT INTO DEMANDE VALUES('D18','L18', 'A18', '2024-12-29', '2025-01-05');
INSERT INTO DEMANDE VALUES('D19','L19', 'A19', '2024-12-29', '2025-01-05');
INSERT INTO DEMANDE VALUES('D20','L20', 'A20', '2024-12-29', '2025-01-05');
SELECT * FROM DEMANDE;

-- 1. Cinq requêtes de jointure impliquant deux tables:
# Afficher le tire et le rayon de son exemplaire:
SELECT l.titre, e.code_rayon FROM EXEMPLAIRE as e, LIVRE as l
WHERE l.code_catalogue=e.code_catalogue;

# Afficher les codes-rayon des exemplaires du livre 'Haykyuu!!':
SELECT e.code_rayon, l.titre FROM EXEMPLAIRE as e, Livre as l
WHERE e.code_catalogue=l.code_catalogue
AND l.titre='Haykyuu!!';

# Afficher la date de la demande de l'abonné 'Erza':
SELECT d.date_demande, ab.nom FROM DEMANDE as d, ABONNE as ab
WHERE d.num_matricule=ab.num_matricule
AND ab.nom='Erza';

# Afficher les noms des abonnés ayant un prêt en cours:
SELECT ab.nom FROM PRET as p, ABONNE as ab
WHERE p.num_matricule=ab.num_matricule
AND date_retour_effectif IS NULL;

# Afficher les abonnés ayant comme profession 'scientifique' et qui ont fait une demande:
SELECT ab.nom FROM ABONNE as ab, DEMANDE as d
WHERE ab.num_matricule=d.num_matricule
AND ab.categorie_pro='scientifique';

-- 2. Cinq requêtes de jointure impliquant trois tables:
# Afficher la liste des titres écrits par Horikoshi:
SELECT l.titre FROM LIVRE as l, AUTEUR as a, ecrit_par as ep
WHERE ep.code_catalogue=l.code_catalogue
AND ep.id_auteur=a.id_auteur
AND a.nom_auteur='Horikoshi';

# Afficher les livres caractérisés par le mot-clé 'combat':
SELECT l.titre FROM LIVRE as l, caracterise_par as c, MOT_CLE as m
WHERE l.code_catalogue = c.code_catalogue
AND m.id_mot_cle = c.id_mot_cle
AND mot_cle = 'combat';

# Afficher l'abonné qui a demandé le livre 'GTO':
SELECT ab.nom FROM ABONNE as ab, LIVRE as l, DEMANDE as d
WHERE l.code_catalogue=d.code_catalogue
AND ab.num_matricule=d.num_matricule
AND l.titre='GTO';

# Afficher les informations (rayon et date_pret) des exemplaires empruntés par l'abonné 'Usopp':
SELECT e.code_rayon,p.date_pret, ab.nom FROM EXEMPLAIRE as e, ABONNE as ab, PRET as p
WHERE ab.num_matricule=p.num_matricule
AND e.code_rayon=p.code_rayon
AND ab.nom='Usopp';

# Afficher l'auteur de 'One Piece':
SELECT a.nom_auteur, a.prenom_auteur FROM AUTEUR as a, LIVRE as l, ecrit_par as ep
WHERE l.code_catalogue=ep.code_catalogue
AND a.id_auteur=ep.id_auteur
AND l.titre='One Piece';

-- 3. Trois requêtes comportant une négation:
# Afficher les abonnés qui ne sont pas des pirates:
SELECT ab.nom FROM ABONNE as ab
WHERE ab.categorie_pro !='pirate';

# Afficher les livres qui ne sont pas des shonens:
SELECT code_catalogue,titre,genre FROM LIVRE
WHERE genre NOT IN ('Shonen');

# Afficher les oeuvres qui ne sont pas en mauvais état:
SELECT e.code_rayon,l.titre,e.code_usure,e.nom_edit,e.date_acqui
FROM EXEMPLAIRE e, LIVRE l
WHERE e.code_catalogue = l.code_catalogue
AND e.code_usure NOT IN ('MAUVAIS');

-- 4. Quatre requêtes SQL dont chacune comportera : MAX, AVG, SUM et BETWEEN 
# Afficher la date de pret la plus récente (MAX):
SELECT MAX(date_pret) AS date_dernier_pret, COUNT(*) AS nombre_total_prets FROM PRET;

# Age moyen des abonnés (AVG):
SELECT AVG(TIMESTAMPDIFF(YEAR, date_naissance, CURDATE())) AS age_moyen FROM ABONNE;

# Afficher le nombre total d'exemplaires par genre de livre (SUM):
SELECT l.genre,
SUM(1) AS nombre_total_exemplaires,
COUNT(DISTINCT l.code_catalogue) AS nombre_titres_differents
FROM EXEMPLAIRE as e, LIVRE as l
WHERE e.code_catalogue = l.code_catalogue
GROUP BY l.genre;

# Afficher les abonnés ayant adhéré entre deux dates (BETWEEN):
SELECT num_matricule,nom,adresse,date_adhesion,categorie_pro FROM ABONNE
WHERE date_adhesion BETWEEN '2024-01-01' AND '2024-12-31';




























