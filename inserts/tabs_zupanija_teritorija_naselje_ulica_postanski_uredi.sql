DELETE FROM zupanija;
INSERT INTO zupanija 
(mbr, naziv)
SELECT DISTINCT(zupanija_mbr), zupanija_naziv
FROM naselja
ORDER BY zupanija_mbr;
COMMIT;


DELETE FROM teritorija;
INSERT INTO teritorija
SELECT DISTINCT (grop_mbr), grop_naziv, REPLACE (REPLACE(grop_vrsta, 1, 'Grad'), 2, 'Općina') AS "Teritorija", ulice.zupanija_mbr
FROM ulice
ORDER BY grop_mbr;
COMMIT;

DELETE FROM naselje;
INSERT INTO naselje
SELECT DISTINCT naselje_mbr, naselje_naziv, grop_mbr
FROM ulice
ORDER BY naselje_mbr;
COMMIT;

INSERT INTO postanski_ured
SELECT DISTINCT posta_broj, posta_naziv
FROM posta
ORDER BY posta_broj;
COMMIT;

DELETE FROM pur_nas;
INSERT INTO pur_nas
SELECT posta_broj, naselje_mbr
FROM posta;
COMMIT;


DELETE FROM ulica;
INSERT INTO ulica
SELECT ulica_mbr, ulica_naziv, naselje_mbr
FROM ulice;
COMMIT;


