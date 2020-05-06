import datetime;
import random;
import numpy as np;


def prep(x):
    if str(x) == 'NULL':
        return str(x)
    elif type(x) == datetime.date:
        return 'TO_DATE(\'' + str(x) + '\', \'YYYY-MM-DD\')'
    else:
        return '\'' + str(x) + '\''


def random_date(start_date, end_date):
    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    return start_date + datetime.timedelta(days=random.randrange(days_between_dates))

def radnom_date_array(start_date, end_date, n):
   
    events = []
    for i in range(n):
        time_between_dates = end_date - start_date
        days_between_dates = time_between_dates.days
        start_date += datetime.timedelta(days=random.randrange(days_between_dates))
        events.append(start_date)
    return events
        


 
#start_date = datetime.date(1940, 1, 1)
#end_date = datetime.date(2002, 2, 1)

#time_between_dates = end_date - start_date
#days_between_dates = time_between_dates.days



muska_imena = ['Čarli', 'Maks', 'Koko', 'Frenki', 'Oliver', 'Leo', 'Džek', 'Roki', 'Bo', 'Jack', 'Uško', 'Roko', 'Ben',
               'Beni', 'Cezar', 'Rex', 'Lord', 'Zeus', 'Roni', 'Oskar', 'Uni', 'Čupko', 'Puffy', 'Teddy', 'Frčko', 
               'Kroki', 'Riki', 'Šarko', 'Bili', 'Laki', 'Niki', 'Mex', 'Lex', 'Ari', 'Finn', 'Loki', 'Thor', 'Simba', 
               'Ziggy', 'Mrga', 'Hugo', 'Ari', 'Bleki', 'Edi', 'Floki', 'Boa', 'Loco', 'Joda', 'Loto', 'Lino', 'Risko', 
               'Pepi', 'Lio', 'Medo', 'Miki', 'Crnko', 'Caki', 'Garo', 'Gus', 'Beethoven', 'Oleg', 'Ares', 'Nino', 'Sparky', 
               'Nero', 'Pinki', 'Reno', 'Bruno', 'Ralfi', 'Maximus', 'Ramos', 'Rambo', 'Dexter', 'Cody', 'Lucky', 'Prince', 
               'Benji', 'Cico', 'Sem', 'Mrki', 'Odin', 'Walter', 'Mickey', 'Sving', 'Maza', 'Buddy', 'Tedi', 'Toki', 'King', 
               'Vuki', 'Vinni', 'Vili', 'Zoki', 'Zak', 'Vučko', 'Tesla', 'Obi', 'Pero', 'Pixi', 'Švrćko'];

zenska_imena = ['Luna', 'Bela', 'Dona', 'Lusi', 'Daisy', 'Lola', 'Megi', 'Stela', 'Pegy', 'Moli', 'Beti', 'Lily', 'Roxy', 
                'Luli', 'Ella', 'Ora', 'Rona', 'Suzi', 'Mia', 'Lulu', 'Kimi', 'Doli', 'Athena', 'Angel', 'Missy', 'Nova', 
                'Ava', 'Fiona', 'Sydney', 'Lux', 'Xena', 'Allie', 'Bibi', 'Lara', 'Freya', 'Boa', 'Megi', 'Bondi', 'Cvita', 
                'Dina', 'Gia', 'Hera', 'Lina', 'Tara', 'Tia', 'Viki', 'Uška', 'Zara', 'Zoe', 'Pixi', 'Puffy', 'Lu', 'Lotta', 
                'Niki', 'Dora', 'Dona', 'Nora', 'Emil', 'Mo', 'Maza', 'Electra', 'Stela', 'Izra', 'Diva', 'Doli', 'Judi', 
                'Pegi', 'Lilly', 'Indi', 'Lara', 'Akira', 'Zola', 'Zelda', 'Luca', 'Bibi', 'Nessa', 'Allie', 'Bonnie', 'Roxie', 
                'Olive', 'Dixie', 'Kona', 'Gigi', 'Sasha', 'Sadie', 'Lexi', 'Sandy', 'Nala', 'Nikki', 'Rosie', 'Casey', 'Emma', 
                'Betty', 'Diva', 'Elsie', 'Ida', 'Isla', 'Tessa', 'Zara', 'Kiki'];

             
spol = ['M', 'Z'];

uloga_osobe = ['Vlasnik', 'Suvlasnik', 'Uzgajivač'];
tipovi_dlake = ['meka', 'oštra']
duljina_dlake = ['duga', 'kratka']
br_osob = 400;
br_pasm = 418;
br_m_imena = len(muska_imena);
br_z_imena = len(zenska_imena);
global_start_date = datetime.date(2014, 1, 1)


def take_name(x):
    if x == 'M':
        return muska_imena[random.randrange(br_m_imena)]
    else:
        return zenska_imena[random.randrange(br_z_imena)]
    

ffpas = open('../inserts/tab_pas_inserts.sql','w', encoding="utf-8")
ffospas = open('../inserts/tab_ospas_inserts.sql','w', encoding="utf-8")

rb_psa = 1
for i in range(1,br_osob+1):
    p = random.uniform(0,1)
    if p <= 0.05:
         br_pasa = random.randrange(20)+1;
         # većina uloga uzgajivač-vlasnik-staratelj
         # lreirati slucajne uloge i dodijeliti uloge nekih drugih osoba s malom vjerojatnošču  
    elif p <= 0.15:
        br_pasa = random.randrange(15)+1
    elif p <= 0.25:
        br_pasa = random.randrange(10)+1
    elif p <= 0.4:
        br_pasa = random.randrange(5)+1
    elif p <= 0.6:
        br_pasa = random.randrange(3) + 1
    else:
        br_pasa = 1
    
    
    spolovi = [spol[k] for k in np.random.binomial(1,0.5,100)];
    imena = list(map(take_name, spolovi))
    
    datumi_okota = np.array([random_date(global_start_date, datetime.date.today() - datetime.timedelta(120)) for k in range(br_pasa)])
    indddd = list(np.random.binomial(br_pasa-1,0.5,random.randrange(br_pasa)))
    #print(indddd)
    datumi_okota[indddd] = 'NULL'
    datumi_okota_str = list(map(str, datumi_okota))

    
    mame = [];
    tate = [];
    td = [];
    dd = [];
    
    for k in range(br_pasa):
        p = random.uniform(0,1)
        if p <= 0.1:
            tip_dl = tipovi_dlake[random.randrange(2)]
            dulj_dl = duljina_dlake[random.randrange(2)]
            q = random.uniform(0,1)
            if q <= 0.5:
                mama = random.randrange(br_pasm) + 1
                tata = random.randrange(br_pasm) + 1
                while(mama == tata):
                    mama = random.randrange(br_pasm) + 1
            else:
                mama = 'NULL'
                tata = 'NULL'
        else:
            # cistokrvan
            tip_dl = 'NULL'
            dulj_dl = 'NULL'
            mama = random.randrange(br_pasm) + 1
            tata = mama
        mame.append(mama)
        tate.append(tata)
        td.append(tip_dl)
        dd.append(dulj_dl)
    
    # unos pasa osobe i
    
    for j in range(br_pasa):
        lll = 'INSERT INTO pas (pas_id, ime, spol, datum_okota, PASMINA_PSM_ID, PASMINA_PSM_ID1, tip_dlake, duljina_dlake)'+ ' VALUES (' + str(rb_psa + j) +', '  + prep(imena[j]) + ' , ' + prep(spolovi[j]) + ', ' +prep(datumi_okota[j])+', ' + str(tate[j]) +', ' + str(mame[j])+', '+prep(td[j])+', '+prep(dd[j])+');\n';
        ffpas.writelines(lll);
        #vlasnistvo
        
        
        if datumi_okota_str[j] == 'NULL':
            continue
        # veza: osoba - pas
        br_prom_vlas = 0
        br_prom_suvl = 0
        br_prom_uzg = 0
        p = random.uniform(0,1)
        if p <= 0.1:
            br_prom_vlas = random.randrange(2) + 1;
        p = random.uniform(0,1)
        if p <= 0.1:
            br_prom_suvl = random.randrange(2) + 1;
        p = random.uniform(0,1)
        if br_prom_suvl == 0 and br_prom_vlas == 0 and p <= 0.1:
            br_prom_uzg = random.randrange(2) + 1;
        datumi_prom_vlas = radnom_date_array(datumi_okota[j], datetime.date.today(), br_prom_vlas );
        datumi_prom_suvl = radnom_date_array(datumi_okota[j], datetime.date.today(), br_prom_suvl );
        datumi_prom_uzg = radnom_date_array(datumi_okota[j], datetime.date.today(), br_prom_uzg );
        
        
        # unos vlasnistva
        datumi_prom_vlas = [datumi_okota[j]] + datumi_prom_vlas
        vlas_ind = i;
        novi_vlas = i;
        for k in range(br_prom_vlas):
            lll = 'INSERT INTO ospas (osoba_osb_id, pas_pas_id, uloga, od, do)'+ ' VALUES (' + str(novi_vlas) +', '  + str(rb_psa + j) + ' , ' + prep('Vlasnik') + ', ' +prep(datumi_prom_vlas[k])+', ' + prep(datumi_prom_vlas[k+1]) +' );\n';
            ffospas.writelines(lll);
            vlas_ind = novi_vlas;
            while(vlas_ind == novi_vlas):
                novi_vlas = random.randrange(br_osob) + 1
        lll = 'INSERT INTO ospas (osoba_osb_id, pas_pas_id, uloga, od, do)'+ ' VALUES (' + str(novi_vlas) +', '  + str(rb_psa + j) + ' , ' + prep('Vlasnik') + ', ' +prep(datumi_prom_vlas[br_prom_vlas])+', ' + prep('NULL') +' );\n';
        ffospas.writelines(lll);
        
        if br_prom_suvl > 0:
            for k in range(br_prom_suvl-1):
                suvl_ind = random.randrange(br_osob) +1
                lll = 'INSERT INTO ospas (osoba_osb_id, pas_pas_id, uloga, od, do)'+ ' VALUES (' + str(suvl_ind) +', '  + str(rb_psa + j) + ' , ' + prep('Suvlasnik') + ', ' +prep(datumi_prom_suvl[k])+', ' + prep(datumi_prom_suvl[k+1]) +' );\n';
                ffospas.writelines(lll);
            suvl_ind = random.randrange(br_osob) +1
            lll = 'INSERT INTO ospas (osoba_osb_id, pas_pas_id, uloga, od, do)'+ ' VALUES (' + str(suvl_ind) +', '  + str(rb_psa + j) + ' , ' + prep('Suvlasnik') + ', ' +prep(datumi_prom_suvl[br_prom_suvl-1])+', ' + prep('NULL') +' );\n';
            ffospas.writelines(lll);
        if br_prom_uzg > 0:
            for k in range(br_prom_uzg-1):
                suvl_uz = random.randrange(br_osob) + 1
                lll = 'INSERT INTO ospas (osoba_osb_id, pas_pas_id, uloga, od, do)'+ ' VALUES (' + str(suvl_uz) +', '  + str(rb_psa + j) + ' , ' + prep('Uzgajivač') + ', ' +prep(datumi_prom_uzg[k])+', ' + prep(datumi_prom_uzg[k+1]) +' );\n';
                ffospas.writelines(lll);
            suvl_uz = random.randrange(br_osob) + 1
            lll = 'INSERT INTO ospas (osoba_osb_id, pas_pas_id, uloga, od, do)'+ ' VALUES (' + str(suvl_uz) +', '  + str(rb_psa + j) + ' , ' + prep('Uzgajivač') + ', ' +prep(datumi_prom_uzg[br_prom_uzg-1])+', ' + prep('NULL') +' );\n';
            ffospas.writelines(lll);
    rb_psa += br_pasa


ffpas.writelines('DROP SEQUENCE pas_pas_id_seq;\n');
ffpas.writelines('CREATE SEQUENCE pas_pas_id_seq START WITH '+ str(rb_psa + 1 )+' NOCACHE ORDER;\n')
ffpas.close()
ffospas.close()
    
    
    