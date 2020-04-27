
/* DROP iskazi*/

@'C:\coderepos\groom_baza_sql\drops\drop_seq.sql';

/* DDL iskazi */
@'C:\coderepos\groom_baza_sql\ddl\relacijski_model.ddl';

/* INSERTS */
DELETE FROM osoba;
@'C:\coderepos\groom_baza_sql\inserts\tab_osoba_inserts.sql';
COMMIT;
DELETE FROM kontakt;
@'C:\coderepos\groom_baza_sql\inserts\tab_kontakt_inserts.sql';
COMMIT

@'C:\coderepos\groom_baza_sql\inserts\tabs_zupanija_teritorija_naselje_ulica_postanski_uredi.sql';
COMMIT;

@'C:\coderepos\groom_baza_sql\inserts\tabs_ulice_s_naseljima_postanski_uredi.sql';
COMMIT;

DELETE FROM adresa;
@'C:\coderepos\groom_baza_sql\inserts\tab_adresa_inserts.sql';
COMMIT;