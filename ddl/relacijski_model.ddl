-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-05-10 23:42:50 CEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE adresa CASCADE CONSTRAINTS;

DROP TABLE fci_gr CASCADE CONSTRAINTS;

DROP TABLE fci_pas CASCADE CONSTRAINTS;

DROP TABLE fci_psek CASCADE CONSTRAINTS;

DROP TABLE fci_sek CASCADE CONSTRAINTS;

DROP TABLE grupapasmina CASCADE CONSTRAINTS;

DROP TABLE kontakt CASCADE CONSTRAINTS;

DROP TABLE naselje CASCADE CONSTRAINTS;

DROP TABLE osoba CASCADE CONSTRAINTS;

DROP TABLE ospas CASCADE CONSTRAINTS;

DROP TABLE pas CASCADE CONSTRAINTS;

DROP TABLE pasmina CASCADE CONSTRAINTS;

DROP TABLE postanski_ured CASCADE CONSTRAINTS;

DROP TABLE postured CASCADE CONSTRAINTS;

DROP TABLE proizvod CASCADE CONSTRAINTS;

DROP TABLE promjenaproizvoda CASCADE CONSTRAINTS;

DROP TABLE promjenausluge CASCADE CONSTRAINTS;

DROP TABLE pur_nas CASCADE CONSTRAINTS;

DROP TABLE teritorija CASCADE CONSTRAINTS;

DROP TABLE ulica CASCADE CONSTRAINTS;

DROP TABLE ulicenas CASCADE CONSTRAINTS;

DROP TABLE usluga CASCADE CONSTRAINTS;

DROP TABLE varijanta CASCADE CONSTRAINTS;

DROP TABLE zupanija CASCADE CONSTRAINTS;

CREATE TABLE adresa (
    tip            CHAR(15) NOT NULL,
    broj           VARCHAR2(6),
    dodatak        VARCHAR2(100),
    ul_mbr         INTEGER,
    adr_id         NUMBER NOT NULL,
    osoba_osb_id   NUMBER NOT NULL
);

ALTER TABLE adresa
    ADD CHECK ( tip IN (
        'Boravište',
        'Prebivalište'
    ) );

ALTER TABLE adresa ADD CONSTRAINT adr_pk PRIMARY KEY ( adr_id );

ALTER TABLE adresa ADD CONSTRAINT osb_tip UNIQUE ( tip );

CREATE TABLE fci_gr (
    rb               INTEGER,
    naziv            VARCHAR2(100),
    hrvatski_naziv   VARCHAR2(100),
    srpski_naziv     VARCHAR2(100),
    fcg_id           NUMBER NOT NULL
);

ALTER TABLE fci_gr ADD CONSTRAINT fcg_pk PRIMARY KEY ( fcg_id );

CREATE TABLE fci_pas (
    fci_broj                 INTEGER,
    naziv                    VARCHAR2(100),
    engleski_naziv           VARCHAR2(100),
    francuski_naziv          VARCHAR2(100),
    njemacki_naziv           VARCHAR2(100),
    spanjolski_naziv         VARCHAR2(100),
    hrvatski_naziv           VARCHAR2(100),
    srpski_naziv             VARCHAR2(100),
    datum_prihvata_od_fci    DATE,
    izvorni_jezik            VARCHAR2(10),
    datum_objave_standarda   DATE,
    status_pasmine           CLOB,
    zemlja_podrijetla        VARCHAR2(80),
    radno_sudjenje           CLOB,
    ilustracija              VARCHAR2(120),
    fps_id                   NUMBER NOT NULL,
    fci_gr_fcg_id            NUMBER,
    fci_psek_fcp_id          NUMBER,
    fci_sek_fcs_id           NUMBER
);

ALTER TABLE fci_pas ADD CONSTRAINT fps_pk PRIMARY KEY ( fps_id );

CREATE TABLE fci_psek (
    rb               INTEGER,
    naziv            VARCHAR2(100),
    hrvatski_naziv   VARCHAR2(100),
    srpski_naziv     VARCHAR2(100),
    fcp_id           NUMBER NOT NULL,
    fci_sek_fcs_id   NUMBER NOT NULL
);

ALTER TABLE fci_psek ADD CONSTRAINT fcp_pk PRIMARY KEY ( fcp_id );

CREATE TABLE fci_sek (
    rb               INTEGER,
    naziv            VARCHAR2(100),
    hrvatski_naziv   VARCHAR2(100),
    srpski_naziv     VARCHAR2(100),
    fcs_id           NUMBER NOT NULL,
    fci_gr_fcg_id    NUMBER NOT NULL
);

ALTER TABLE fci_sek ADD CONSTRAINT fcs_pk PRIMARY KEY ( fcs_id );

CREATE TABLE grupapasmina (
    naziv    VARCHAR2(100) NOT NULL,
    opis     CLOB,
    gus_id   NUMBER NOT NULL
);

ALTER TABLE grupapasmina ADD CONSTRAINT gus_pk PRIMARY KEY ( gus_id );

CREATE TABLE kontakt (
    vrsta          VARCHAR2(30) NOT NULL,
    vrijednost     VARCHAR2(60) NOT NULL,
    knt_id         NUMBER NOT NULL,
    osoba_osb_id   NUMBER NOT NULL
);

ALTER TABLE kontakt
    ADD CHECK ( vrsta IN (
        'Facebook',
        'Fax',
        'Instagram',
        'Kućni',
        'Mobitel',
        'Na poslu',
        'Poslovna e-mail adresa',
        'Poslovni mobitel',
        'Privatna e-mail adresa',
        'Skype'
    ) );

ALTER TABLE kontakt ADD CONSTRAINT knt_pk PRIMARY KEY ( knt_id );

ALTER TABLE kontakt ADD CONSTRAINT osb_vrs_vrij UNIQUE ( vrsta,
                                                         vrijednost );

CREATE TABLE naselje (
    mbr     INTEGER NOT NULL,
    naziv   VARCHAR2(40) NOT NULL,
    mbr1    INTEGER NOT NULL
);

ALTER TABLE naselje ADD CONSTRAINT naselje_pk PRIMARY KEY ( mbr );

CREATE TABLE osoba (
    osb_id           NUMBER NOT NULL,
    ime              VARCHAR2(30) NOT NULL,
    prezime          VARCHAR2(30) NOT NULL,
    uloga            CHAR(10) NOT NULL,
    drugo_prezime    VARCHAR2(30),
    spol             CHAR(1),
    datum_rodjenja   DATE,
    fotografija      VARCHAR2(100),
    oib              VARCHAR2(11),
    jmbg             VARCHAR2(13),
    napomena         CLOB
);

ALTER TABLE osoba
    ADD CHECK ( uloga IN (
        'Djelatnik',
        'Klijent'
    ) );

ALTER TABLE osoba
    ADD CHECK ( spol IN (
        'M',
        'Z'
    ) );

ALTER TABLE osoba ADD CONSTRAINT osb_pk PRIMARY KEY ( osb_id );

ALTER TABLE osoba
    ADD CONSTRAINT imeprdatr UNIQUE ( ime,
                                      prezime,
                                      datum_rodjenja );

ALTER TABLE osoba ADD CONSTRAINT oib UNIQUE ( oib );

ALTER TABLE osoba ADD CONSTRAINT jmbg UNIQUE ( jmbg );

CREATE TABLE ospas (
    od             DATE,
    do             DATE,
    uloga          VARCHAR2(20 CHAR),
    osp_id         NUMBER NOT NULL,
    osoba_osb_id   NUMBER NOT NULL,
    pas_pas_id     NUMBER NOT NULL
);

ALTER TABLE ospas
    ADD CHECK ( uloga IN (
        'Suvlasnik',
        'Uzgajivač',
        'Vlasnik'
    ) );

ALTER TABLE ospas ADD CONSTRAINT osp_pk PRIMARY KEY ( osp_id );

ALTER TABLE ospas
    ADD CONSTRAINT uniq_osp UNIQUE ( od,
                                     uloga,
                                     osoba_osb_id,
                                     pas_pas_id );

CREATE TABLE pas (
    ime               VARCHAR2(40) NOT NULL,
    spol              CHAR(1),
    datum_okota       DATE,
    tip_dlake         VARCHAR2(20 CHAR),
    duljina_dlake     VARCHAR2(8),
    pas_id            NUMBER NOT NULL,
    pasmina_psm_id    NUMBER,
    pasmina_psm_id1   NUMBER
);

ALTER TABLE pas
    ADD CHECK ( spol IN (
        'M',
        'Z'
    ) );

ALTER TABLE pas
    ADD CHECK ( tip_dlake IN (
        'meka',
        'oštra'
    ) );

ALTER TABLE pas
    ADD CHECK ( duljina_dlake IN (
        'duga',
        'kratka'
    ) );

ALTER TABLE pas ADD CONSTRAINT pas_pk PRIMARY KEY ( pas_id );

CREATE TABLE pasmina (
    fci_broj              INTEGER,
    pretraz_string        VARCHAR2(550),
    redni_broj_grupe      INTEGER,
    naziv                 VARCHAR2(100),
    engleski_naziv        VARCHAR2(100),
    grupa_eng             VARCHAR2(100),
    sekcija_eng           VARCHAR2(100),
    podsekcija_eng        VARCHAR2(100),
    hrvatski_naziv        VARCHAR2(100),
    grupa_hrv             VARCHAR2(100),
    sekcija_hrv           VARCHAR2(100),
    podsekcija_hrv        VARCHAR2(100),
    srpski_naziv          VARCHAR2(100),
    grupa_srb             VARCHAR2(100),
    sekcija_srb           VARCHAR2(100),
    podsekcija_srb        VARCHAR2(100),
    zemlja_podrijetla     VARCHAR2(80),
    ilustracija           VARCHAR2(120),
    psm_id                NUMBER NOT NULL,
    grupapasmina_gus_id   NUMBER
);

ALTER TABLE pasmina ADD CONSTRAINT psm_pk PRIMARY KEY ( psm_id );

CREATE TABLE postanski_ured (
    postanski_broj   INTEGER NOT NULL,
    naziv            VARCHAR2(50) NOT NULL
);

ALTER TABLE postanski_ured ADD CONSTRAINT postanski_ured_pk PRIMARY KEY ( postanski_broj );

CREATE TABLE postured (
    naziv     VARCHAR2(50),
    broj      INTEGER,
    naselje   VARCHAR2(40),
    ul_mbr    INTEGER NOT NULL,
    pur_id    NUMBER NOT NULL
);

ALTER TABLE postured ADD CONSTRAINT pur_pk PRIMARY KEY ( pur_id );

CREATE TABLE proizvod (
    naziv            VARCHAR2(100) NOT NULL,
    opis             CLOB,
    barkod           VARCHAR2(20),
    jedinica_mjere   VARCHAR2(5),
    duzina           INTEGER,
    sirina           INTEGER,
    visina           INTEGER,
    volumen          INTEGER,
    prz_id           NUMBER NOT NULL
);

ALTER TABLE proizvod
    ADD CHECK ( jedinica_mjere IN (
        'kg',
        'kom',
        'l'
    ) );

ALTER TABLE proizvod ADD CONSTRAINT prz_pk PRIMARY KEY ( prz_id );

CREATE TABLE promjenaproizvoda (
    tip               VARCHAR2(20) NOT NULL,
    od                DATE NOT NULL,
    do                DATE,
    iznos             FLOAT,
    ppr_id            NUMBER NOT NULL,
    proizvod_prz_id   NUMBER NOT NULL
);

ALTER TABLE promjenaproizvoda
    ADD CHECK ( tip IN (
        'Cijena',
        'Ponuda'
    ) );

COMMENT ON COLUMN promjenaproizvoda.od IS
    '		';

ALTER TABLE promjenaproizvoda ADD CONSTRAINT ppr_pk PRIMARY KEY ( ppr_id );

ALTER TABLE promjenaproizvoda
    ADD CONSTRAINT uniq_od_prz UNIQUE ( tip,
                                        od,
                                        proizvod_prz_id );

ALTER TABLE promjenaproizvoda
    ADD CONSTRAINT uniq_do_prz UNIQUE ( tip,
                                        do,
                                        proizvod_prz_id );

CREATE TABLE promjenausluge (
    tip                   VARCHAR2(20) NOT NULL,
    od                    DATE NOT NULL,
    do                    DATE,
    iznos                 FLOAT,
    ppu_id                NUMBER NOT NULL,
    grupapasmina_gus_id   NUMBER,
    usluga_usl_id         NUMBER NOT NULL
);

ALTER TABLE promjenausluge
    ADD CHECK ( tip IN (
        'Cijena',
        'Ponuda'
    ) );

COMMENT ON COLUMN promjenausluge.od IS
    '		';

ALTER TABLE promjenausluge ADD CONSTRAINT ppu_pk PRIMARY KEY ( ppu_id );

ALTER TABLE promjenausluge
    ADD CONSTRAINT uniq_od_usl UNIQUE ( tip,
                                        od,
                                        usluga_usl_id,
                                        grupapasmina_gus_id );

ALTER TABLE promjenausluge
    ADD CONSTRAINT uniq_do_usl UNIQUE ( tip,
                                        do,
                                        usluga_usl_id,
                                        grupapasmina_gus_id );

CREATE TABLE pur_nas (
    postanski_ured_postanski_broj   INTEGER NOT NULL,
    naselje_mbr                     INTEGER NOT NULL
);

ALTER TABLE pur_nas ADD CONSTRAINT pur_nas_pk PRIMARY KEY ( postanski_ured_postanski_broj,
                                                            naselje_mbr );

CREATE TABLE teritorija (
    mbr     INTEGER NOT NULL,
    naziv   VARCHAR2(50) NOT NULL,
    vrsta   VARCHAR2(8) NOT NULL,
    mbr1    INTEGER NOT NULL
);

ALTER TABLE teritorija ADD CONSTRAINT teritorija_pk PRIMARY KEY ( mbr );

CREATE TABLE ulica (
    mbr     INTEGER NOT NULL,
    naziv   VARCHAR2(100) NOT NULL,
    mbr1    INTEGER NOT NULL
);

ALTER TABLE ulica ADD CONSTRAINT ulica_pk PRIMARY KEY ( mbr );

CREATE TABLE ulicenas (
    ul_mbr             INTEGER NOT NULL,
    naziv              VARCHAR2(100),
    naselje            VARCHAR2(40),
    teritorija         VARCHAR2(50),
    vrsta_teritorije   VARCHAR2(8),
    zupanija           VARCHAR2(40)
);

ALTER TABLE ulicenas ADD CONSTRAINT ulice_s_naseljima_pk PRIMARY KEY ( ul_mbr );

CREATE TABLE usluga (
    naziv            VARCHAR2(100) NOT NULL,
    opis             CLOB,
    barkod           VARCHAR2(20),
    jedinica_mjere   VARCHAR2(5 CHAR),
    usl_id           NUMBER NOT NULL
);

ALTER TABLE usluga
    ADD CHECK ( jedinica_mjere IN (
        'kom',
        'sat'
    ) );

ALTER TABLE usluga ADD CONSTRAINT usl_pk PRIMARY KEY ( usl_id );

CREATE TABLE varijanta (
    naziv            VARCHAR2(100),
    hrvatski_naziv   VARCHAR2(100),
    srpski_naziv     VARCHAR2(100),
    var_id           NUMBER NOT NULL,
    fci_pas_fps_id   NUMBER NOT NULL
);

ALTER TABLE varijanta ADD CONSTRAINT var_pk PRIMARY KEY ( var_id );

CREATE TABLE zupanija (
    mbr     INTEGER NOT NULL,
    naziv   VARCHAR2(40) NOT NULL
);

ALTER TABLE zupanija ADD CONSTRAINT zupanija_pk PRIMARY KEY ( mbr );

ALTER TABLE kontakt
    ADD CONSTRAINT dostupan_na FOREIGN KEY ( osoba_osb_id )
        REFERENCES osoba ( osb_id )
            ON DELETE CASCADE;

ALTER TABLE fci_sek
    ADD CONSTRAINT fcgfcs FOREIGN KEY ( fci_gr_fcg_id )
        REFERENCES fci_gr ( fcg_id );

ALTER TABLE varijanta
    ADD CONSTRAINT fcp_var FOREIGN KEY ( fci_pas_fps_id )
        REFERENCES fci_pas ( fps_id );

ALTER TABLE fci_psek
    ADD CONSTRAINT fcsfcp FOREIGN KEY ( fci_sek_fcs_id )
        REFERENCES fci_sek ( fcs_id );

ALTER TABLE fci_pas
    ADD CONSTRAINT fpasfcg FOREIGN KEY ( fci_gr_fcg_id )
        REFERENCES fci_gr ( fcg_id );

ALTER TABLE fci_pas
    ADD CONSTRAINT fpasfcp FOREIGN KEY ( fci_psek_fcp_id )
        REFERENCES fci_psek ( fcp_id );

ALTER TABLE fci_pas
    ADD CONSTRAINT fpasfcs FOREIGN KEY ( fci_sek_fcs_id )
        REFERENCES fci_sek ( fcs_id );

ALTER TABLE promjenausluge
    ADD CONSTRAINT grusprom FOREIGN KEY ( grupapasmina_gus_id )
        REFERENCES grupapasmina ( gus_id )
            ON DELETE CASCADE;

ALTER TABLE pas
    ADD CONSTRAINT majka FOREIGN KEY ( pasmina_psm_id )
        REFERENCES pasmina ( psm_id );

ALTER TABLE naselje
    ADD CONSTRAINT na_teritoriji FOREIGN KEY ( mbr1 )
        REFERENCES teritorija ( mbr );

ALTER TABLE ospas
    ADD CONSTRAINT osul FOREIGN KEY ( osoba_osb_id )
        REFERENCES osoba ( osb_id )
            ON DELETE CASCADE;

ALTER TABLE pas
    ADD CONSTRAINT otac FOREIGN KEY ( pasmina_psm_id1 )
        REFERENCES pasmina ( psm_id );

ALTER TABLE pasmina
    ADD CONSTRAINT pasmgrup FOREIGN KEY ( grupapasmina_gus_id )
        REFERENCES grupapasmina ( gus_id );

ALTER TABLE ospas
    ADD CONSTRAINT pasul FOREIGN KEY ( pas_pas_id )
        REFERENCES pas ( pas_id )
            ON DELETE CASCADE;

ALTER TABLE promjenaproizvoda
    ADD CONSTRAINT przprom FOREIGN KEY ( proizvod_prz_id )
        REFERENCES proizvod ( prz_id )
            ON DELETE CASCADE;

ALTER TABLE pur_nas
    ADD CONSTRAINT pur_nas_naselje_fk FOREIGN KEY ( naselje_mbr )
        REFERENCES naselje ( mbr );

ALTER TABLE pur_nas
    ADD CONSTRAINT pur_nas_postanski_ured_fk FOREIGN KEY ( postanski_ured_postanski_broj )
        REFERENCES postanski_ured ( postanski_broj );

ALTER TABLE postured
    ADD CONSTRAINT pur_ulice FOREIGN KEY ( ul_mbr )
        REFERENCES ulicenas ( ul_mbr );

ALTER TABLE adresa
    ADD CONSTRAINT u_ulici FOREIGN KEY ( ul_mbr )
        REFERENCES ulicenas ( ul_mbr );

ALTER TABLE teritorija
    ADD CONSTRAINT u_zupaniji FOREIGN KEY ( mbr1 )
        REFERENCES zupanija ( mbr );

ALTER TABLE ulica
    ADD CONSTRAINT ul_u_nas FOREIGN KEY ( mbr1 )
        REFERENCES naselje ( mbr );

ALTER TABLE promjenausluge
    ADD CONSTRAINT uslprom FOREIGN KEY ( usluga_usl_id )
        REFERENCES usluga ( usl_id )
            ON DELETE CASCADE;

ALTER TABLE adresa
    ADD CONSTRAINT zivi_na FOREIGN KEY ( osoba_osb_id )
        REFERENCES osoba ( osb_id )
            ON DELETE CASCADE;

CREATE SEQUENCE adr_adr_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER adr_adr_id_trg BEFORE
    INSERT ON adresa
    FOR EACH ROW
    WHEN ( new.adr_id IS NULL )
BEGIN
    :new.adr_id := adr_adr_id_seq.nextval;
END;
/

CREATE SEQUENCE fcg_fcg_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fcg_fcg_id_trg BEFORE
    INSERT ON fci_gr
    FOR EACH ROW
    WHEN ( new.fcg_id IS NULL )
BEGIN
    :new.fcg_id := fcg_fcg_id_seq.nextval;
END;
/

CREATE SEQUENCE fps_fps_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fps_fps_id_trg BEFORE
    INSERT ON fci_pas
    FOR EACH ROW
    WHEN ( new.fps_id IS NULL )
BEGIN
    :new.fps_id := fps_fps_id_seq.nextval;
END;
/

CREATE SEQUENCE fcp_fcp_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fcp_fcp_id_trg BEFORE
    INSERT ON fci_psek
    FOR EACH ROW
    WHEN ( new.fcp_id IS NULL )
BEGIN
    :new.fcp_id := fcp_fcp_id_seq.nextval;
END;
/

CREATE SEQUENCE fcs_fcs_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fcs_fcs_id_trg BEFORE
    INSERT ON fci_sek
    FOR EACH ROW
    WHEN ( new.fcs_id IS NULL )
BEGIN
    :new.fcs_id := fcs_fcs_id_seq.nextval;
END;
/

CREATE SEQUENCE gus_gus_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER gus_gus_id_trg BEFORE
    INSERT ON grupapasmina
    FOR EACH ROW
    WHEN ( new.gus_id IS NULL )
BEGIN
    :new.gus_id := gus_gus_id_seq.nextval;
END;
/

CREATE SEQUENCE knt_knt_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER knt_knt_id_trg BEFORE
    INSERT ON kontakt
    FOR EACH ROW
    WHEN ( new.knt_id IS NULL )
BEGIN
    :new.knt_id := knt_knt_id_seq.nextval;
END;
/

CREATE SEQUENCE osb_osb_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER osb_osb_id_trg BEFORE
    INSERT ON osoba
    FOR EACH ROW
    WHEN ( new.osb_id IS NULL )
BEGIN
    :new.osb_id := osb_osb_id_seq.nextval;
END;
/

CREATE SEQUENCE osp_osp_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER osp_osp_id_trg BEFORE
    INSERT ON ospas
    FOR EACH ROW
    WHEN ( new.osp_id IS NULL )
BEGIN
    :new.osp_id := osp_osp_id_seq.nextval;
END;
/

CREATE SEQUENCE pas_pas_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pas_pas_id_trg BEFORE
    INSERT ON pas
    FOR EACH ROW
    WHEN ( new.pas_id IS NULL )
BEGIN
    :new.pas_id := pas_pas_id_seq.nextval;
END;
/

CREATE SEQUENCE psm_psm_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER psm_psm_id_trg BEFORE
    INSERT ON pasmina
    FOR EACH ROW
    WHEN ( new.psm_id IS NULL )
BEGIN
    :new.psm_id := psm_psm_id_seq.nextval;
END;
/

CREATE SEQUENCE pur_pur_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pur_pur_id_trg BEFORE
    INSERT ON postured
    FOR EACH ROW
    WHEN ( new.pur_id IS NULL )
BEGIN
    :new.pur_id := pur_pur_id_seq.nextval;
END;
/

CREATE SEQUENCE prz_prz_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER prz_prz_id_trg BEFORE
    INSERT ON proizvod
    FOR EACH ROW
    WHEN ( new.prz_id IS NULL )
BEGIN
    :new.prz_id := prz_prz_id_seq.nextval;
END;
/

CREATE SEQUENCE ppr_ppr_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ppr_ppr_id_trg BEFORE
    INSERT ON promjenaproizvoda
    FOR EACH ROW
    WHEN ( new.ppr_id IS NULL )
BEGIN
    :new.ppr_id := ppr_ppr_id_seq.nextval;
END;
/

CREATE SEQUENCE ppu_ppu_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ppu_ppu_id_trg BEFORE
    INSERT ON promjenausluge
    FOR EACH ROW
    WHEN ( new.ppu_id IS NULL )
BEGIN
    :new.ppu_id := ppu_ppu_id_seq.nextval;
END;
/

CREATE SEQUENCE usl_usl_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER usl_usl_id_trg BEFORE
    INSERT ON usluga
    FOR EACH ROW
    WHEN ( new.usl_id IS NULL )
BEGIN
    :new.usl_id := usl_usl_id_seq.nextval;
END;
/

CREATE SEQUENCE var_var_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER var_var_id_trg BEFORE
    INSERT ON varijanta
    FOR EACH ROW
    WHEN ( new.var_id IS NULL )
BEGIN
    :new.var_id := var_var_id_seq.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            24
-- CREATE INDEX                             0
-- ALTER TABLE                             69
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          17
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         17
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
