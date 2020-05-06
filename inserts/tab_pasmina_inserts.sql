DELETE FROM pasmina;
INSERT INTO pasmina (fci_broj,naziv, engleski_naziv, hrvatski_naziv, srpski_naziv,pretraz_string,redni_broj_grupe, grupa_eng, sekcija_eng, 
podsekcija_eng, grupa_hrv, sekcija_hrv, podsekcija_hrv, grupa_srb, sekcija_srb, podsekcija_srb,
zemlja_podrijetla, ilustracija)
SELECT fcp.FCI_BROJ AS "FCI_BROJ", (CASE WHEN v.naziv IS NOT NULL THEN fcp.naziv || ' (' || v.naziv || ')' ELSE fcp.naziv END) AS "NAZIV",
(CASE WHEN v.naziv IS NOT NULL THEN fcp.engleski_naziv || ' (' || v.naziv || ')' ELSE fcp.engleski_naziv END) AS "ENGLESKI_NAZIV",
(CASE WHEN v.hrvatski_naziv IS NOT NULL THEN fcp.hrvatski_naziv || ' (' || v.hrvatski_naziv || ')' ELSE fcp.hrvatski_naziv END) AS "HRVATSKI_NAZIV",
(CASE WHEN v.srpski_naziv IS NOT NULL THEN fcp.srpski_naziv || ' (' || v.srpski_naziv || ')' ELSE fcp.srpski_naziv END) AS "SRPSKI_NAZIV",
(CASE WHEN v.naziv IS NOT NULL THEN fcp.naziv || ' (' || v.naziv || ') ' ELSE fcp.naziv END) ||
(CASE WHEN v.naziv IS NOT NULL THEN fcp.engleski_naziv || ' (' || v.naziv || ') ' ELSE fcp.engleski_naziv END) ||
(CASE WHEN v.hrvatski_naziv IS NOT NULL THEN fcp.hrvatski_naziv || ' (' || v.hrvatski_naziv || ') ' ELSE fcp.hrvatski_naziv END) ||
(CASE WHEN v.srpski_naziv IS NOT NULL THEN fcp.srpski_naziv || ' (' || v.srpski_naziv || ')' ELSE fcp.srpski_naziv END) AS "pretraz_string",
fcg.rb AS "REDNI_BROJ_GRUPE",
fcg.naziv AS "GRUPA_ENG",
fcs.naziv AS "SEKCIJA_ENG",
fcps.naziv AS "PODSEKCIJA_ENG",
fcg.hrvatski_naziv AS "GRUPA_HRV",
fcs.hrvatski_naziv AS "SEKCIJA_HRV",
fcps.hrvatski_naziv AS "PODSEKCIJA_HRV",
fcg.srpski_naziv AS "GRUPA_SRB",
fcs.srpski_naziv AS "SEKCIJA_SRB",
fcps.srpski_naziv AS "PODSEKCIJA_SRB",
fcp.zemlja_podrijetla AS "ZEMLJA_PODRIJETLA",
fcp.ilustracija AS "ILUSTRACIJA"
FROM fci_pas fcp LEFT JOIN varijanta v ON (fcp.fps_id = v.fci_pas_fps_id)
                 LEFT JOIN fci_gr fcg ON (fcp.fci_gr_fcg_id = fcg.fcg_id)
                 LEFT JOIN fci_sek fcs ON (fcp.fci_sek_fcs_id = fcs.fcs_id)
                 LEFT JOIN fci_psek fcps ON (fcp.fci_psek_fcp_id = fcps.fcp_id);