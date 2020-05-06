
/* DROP iskazi*/

@'C:\coderepos\groom\drops\drop_seq.sql';

/* DDL iskazi */
@'C:\coderepos\groom\ddl\relacijski_model.ddl';

/* ciscenje nepotrebnog */
@'C:\coderepos\groom\drops\drop_seq_nonnec.sql';



/* INSERTS */
DELETE FROM osoba;
@'C:\coderepos\groom\inserts\tab_osoba_inserts.sql';
COMMIT;
DELETE FROM kontakt;
@'C:\coderepos\groom\inserts\tab_kontakt_inserts.sql';
COMMIT;

/*@'C:\coderepos\groom\inserts\tabs_zupanija_teritorija_naselje_ulica_postanski_uredi.sql';
COMMIT;

@'C:\coderepos\groom\inserts\tabs_ulice_s_naseljima_postanski_uredi.sql';
COMMIT;

DELETE FROM adresa;
@'C:\coderepos\groom\inserts\tab_adresa_inserts.sql';
COMMIT;*/

DELETE FROM fci_gr;
@'C:\coderepos\groom\inserts\tab_fci_gr_inserts.sql';
COMMIT;

DELETE FROM fci_sek;
@'C:\coderepos\groom\inserts\tab_fci_sek_inserts.sql';
COMMIT;

DELETE FROM fci_psek;
@'C:\coderepos\groom\inserts\tab_fci_psek_inserts.sql';
COMMIT;

DELETE FROM fci_pas;
@'C:\coderepos\groom\inserts\tab_fci_pas_inserts.sql';
COMMIT;

DELETE FROM varijanta;
@'C:\coderepos\groom\inserts\tab_varijanta_inserts.sql';
COMMIT;

@'C:\coderepos\groom\inserts\tab_pasmina_inserts.sql';
COMMIT;