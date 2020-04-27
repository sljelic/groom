
DELETE FROM ulicenas;
INSERT INTO ulicenas (zupanija,teritorija, vrsta_teritorije,naselje, naziv, ul_mbr)
SELECT  z.naziv AS zup_naziv,  t.naziv AS ter_naziv,
t.vrsta AS ter_vrsta, n.naziv AS nas_naziv,
u.naziv AS ul_naziv, u.mbr AS ul_mbr
FROM ulica u JOIN naselje n ON (u.mbr1 = n.mbr) 
             JOIN teritorija t ON (n.mbr1 = t.mbr) 
             JOIN zupanija z ON (t.mbr1 = z.mbr);      
COMMIT;
             
DELETE FROM postured;
INSERT INTO postured (naselje, broj, naziv, ul_mbr)
SELECT n.naziv AS nas_naziv,
pu.postanski_broj AS postanski_broj, pu.naziv as post_ured_naziv,
u.mbr AS ul_mbr
FROM ulica u JOIN naselje n ON (u.mbr1 = n.mbr) 
             JOIN pur_nas pn ON (n.mbr = pn.naselje_mbr)
             JOIN postanski_ured pu ON (pn.postanski_ured_postanski_broj = pu.postanski_broj);
COMMIT;


