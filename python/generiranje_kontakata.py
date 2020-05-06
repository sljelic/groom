# -*- coding: utf-8 -*-
"""
Created on Sun Apr 26 14:40:28 2020

@author: Korisnik
"""

vrsta = ['Facebook',
        'Fax',
        'Instagram',
        'Kućni',
        'Mobitel',
        'Na poslu',
        'Poslovna e-mail adresa',
        'Poslovni mobitel',
        'Privatna e-mail adresa',
        'Skype'];

         
br_kont = len(vrsta);
mobpoz = ['91', '92', '95', '97', '98', '99'];
domene = ['gmail.com', 'live.com', 'outlook.com']

num_insert = 400

usernames = ['animalcrummy', 'hurrywanting', 'emptynide', 'favornecked', 'pauperrevolt', 'wakefieldaground', 
             'excavategap', 'pukaoanteater', 'antennabreast', 'copperminechittle', 'pepcry', 'annoyarrest', 
             'oceanyangon', 'ferocitycrate', 'dialectundesired', 'humormongoose', 'residencesdependable', 
             'muppetgiddy', 'nostalgictairy', 'magneticfrancium', 'solvenerfhearder', 'rustproofpester', 
             'aerosolcornea', 'seventhalert', 'denturetaps', 'ponymolecular', 'scuffrod', 'rexugie', 
             'hartforddeprecate', 'scuppergantry', 'hotelwheat', 'alexandreclap', 'whispermassage', 
             'refplayer', 'lewissky', 'cosinesstraggler', 'contortdice', 'fibblesnitchey', 'miracleshovel', 
             'handemphasis', 'raesaffron', 'unratedcivic', 'pleetquantum', 'sproadedstupid', 'gynecologyprude', 
             'nosenarnish', 'exactingbrushes', 'gratifiedosdale', 'feistyflossed', 'froxpigment', 'stingrayruse', 
             'nastilysad', 'sharkslurp', 'tarbertfarrum', 'gaussianjewel', 'grepsincere', 'rawgabbitcondense',
             'pellytox', 'rewindstep', 'selectorstuff', 'lizlevel', 'custodiancolander', 'bulbsoverwrite',
             'chicagoproblems', 'winkleconcert', 'priesttrash', 'divideeuro', 'cartieracorn', 'babingleylatest', 
             'storybasis', 'startingmanila', 'rembrantragefilled', 'absentsassy', 'yoofspeaktwist', 
             'schedulestruthful', 'fearfulkepler', 'keepreceipt', 'tablessandbag', 'morainefetch', 'coursecheak', 
             'argueradde', 'extensionstribe', 'landminefencing', 'gigabytebadgworthy', 'aliencurved', 
             'landscapewhimbrel', 'neocheep', 'gaurscandale', 'stoleslace', 'obviouschurch', 'raftingdiaphragm', 
             'unusedspoon', 'writergenders', 'dependentapple', 'quaintcheck', 'hawkcrooked', 'astonishpa', 
             'sushischeme', 'tearfulsummer', 'slammonshandwrite', 'saligocatbird', 'cheekstercalifornia', 
             'dippercesspool', 'editorloughor', 'trollyaddicted', 'paltrymeaning', 'pigfinger', 'limpingdrop', 
             'hoarseearth', 'whitemotor', 'astutedowry', 'backunsubtle', 'smaresee', 'manchesterlock', 
             'minorgnarly', 'uncoatedfile', 'raviolitickets', 'slippedskulk', 'leonzone', 'wheeringharm', 
             'symphonyrugby', 'clickablewhickhope', 'anagramhuddling', 'campingovary', 'blahbroke', 
             'breechingvholes', 'frankchad', 'fanninglomo', 'pignutmega', 'currencypartridge', 
             'demandingwoodstock', 'jokinglylanyard', 'onlinefrosting', 'gentlemanyorkshire',
             'yardbradford', 'ounceburger', 'nithpucker', 'goofybromine', 'goosnarghpunctual', 
             'swearsloth', 'brentfappy', 'oscillatorcamel', 'shelburnewhoosh', 'cookiearsenic', 
             'spitegrooming', 'bullseyemotive', 'kidneysmoncton', 'frivolousharmonious', 'wongamud', 
             'niatrossdyke', 'severityspectacle', 'mobilizekirkaig', 'lickingjoining', 'wistfulgotten', 
             'jeepglaucous', 'nenderquicksand', 'friendlycroon', 'resealsqueamish', 'slidingsnarling', 
             'unificationore', 'bundevaraamuse', 'grangeexpect', 'sulkyjoystick', 'knackersaskatoon', 
             'burritoraking', 'grindreaction', 'slideelliptic', 'whuncturedtinsmith', 'crookgrooving', 
             'anxietymogul', 'quicksandfortunate', 'bubbishchitling', 'fondantbouffant', 'tuffhonoria', 
             'carbonlaunching', 'struttabby', 'frequencytemp', 'feetpushchair', 'kokoambulance', 
             'poseresteemed', 'iridescentkarma', 'broommortician', 'judgeskewer', 'relaxunlisted', 
             'rancidityxenotime', 'jacksonsmoker', 'spacerssake', 'sagapoles', 'frazzlediconic', 'steepsammy', 
             'scarcecraggs', 'borborygmmajestic', 'foolaqua', 'velcrorekindle', 'sisterhoodunpicked', 
             'satcheljack', 'aerialorbit', 'fitterdigging', 'bootstowel', 'fubblesleauty'];
br_usn = len(usernames)
import random
ff = open('../inserts/tab_kontakt_inserts.sql', 'w', encoding='utf-8');
for i in range(num_insert):
    br = random.randrange(br_kont)
    choosed = {'Facebook' : False, 'Instagram': False, 'Kućni': False, 'Fax': False, 'Na poslu': False, 'Mobitel': False, 'Poslovni mobitel': False, 'Poslovna e-mail adresa': False, 'Privatna e-mail adresa': False, 'Skype': False}
    num_crt = 0
    while num_crt < br:
        knt = vrsta[random.randrange(br_kont)];
        if choosed[knt] == True:
            continue
        num_crt += 1;
        choosed[knt] = True
        if knt == 'Facebook':
            vrd = 'www.facebook.com/'+ usernames[random.randrange(br_usn)]+str(random.randint(100000,1000000))
        elif knt == 'Instagram':
            vrd = 'www.instagram.com/'+ usernames[random.randrange(br_usn)]+str(random.randint(100000,1000000))
        elif knt in ('Kućni', 'Fax', 'Na poslu'):
            vrd = '+385 ' + str(random.randrange(10,100)) + ' ' +  str(random.randrange(100,1000)) + ' ' + str(random.randrange(100,1000))
        elif knt in ('Mobitel', 'Poslovni mobitel'):
            vrd = '+385 ' + mobpoz[random.randrange(len(mobpoz))] + ' ' +  str(random.randrange(100,1000)) + ' ' + str(random.randrange(1000,10000))
        elif knt in ('Poslovna e-mail adresa', 'Privatna e-mail adresa'):
            vrd = usernames[random.randrange(br_usn)] +str(random.randint(100,1000))+ '@' + domene[random.randrange(len(domene))]
        else:
            vrd = usernames[random.randrange(br_usn)] + str(random.randrange(10,1000))
        
        lll = 'INSERT INTO kontakt (osoba_osb_id, vrsta, vrijednost)'+ ' VALUES ('+ str(i+1) + ', \'' + knt +'\', \'' + vrd + '\');\n';
        ff.writelines(lll);
ff.close()
             