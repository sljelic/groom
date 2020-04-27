# -*- coding: utf-8 -*-
"""
Created on Sat Apr 25 23:54:51 2020

@author: Korisnik
"""
import datetime;
import random;

start_date = datetime.date(1940, 1, 1)
end_date = datetime.date(2002, 2, 1)

time_between_dates = end_date - start_date
days_between_dates = time_between_dates.days



muska_imena = [ 'Luka', 'David', 'Ivan', 'Jakov', 'Petar', 'Filip', 'Marko', 'Matej', 'Mihael', 'Mateo', 
                'Leon', 'Josip', 'Karlo', 'Ivano', 'Fran', 'Noa', 'Roko', 'Borna', 'Jan', 'Niko', 'Gabriel', 
                'Ante', 'Lovro', 'Toma', 'Lukas', 'Vito', 'Nikola', 'Teo', 'Leo', 'Dominik', 'Marin', 'Patrik', 
                'Šimun', 'Tin', 'Toni', 'Matija', 'Antonio', 'Emanuel', 'Bruno', 'Andrej', 'Viktor', 'Erik', 
                'Adrian', 'Noel', 'Rafael', 'Duje', 'Gabrijel', 'Lovre', 'Martin', 'Dino'];

zenska_imena = ['Mia', 'Sara', 'Lucija', 'Ema', 'Ana', 'Nika', 'Petra', 'Marta', 'Lana', 'Rita', 'Elena', 
                'Iva', 'Lea', 'Eva', 'Lara', 'Marija', 'Dora', 'Laura', 'Klara', 'Mila', 'Leona', 'Tena', 
                'Ena', 'Hana', 'Franka', 'Lena', 'Karla', 'Katja', 'Maša', 'Lorena', 'Magdalena', 'Katarina', 
                'Tia', 'Tara', 'Helena', 'Vita', 'Sofia', 'Nora', 'Tea', 'Nikol', 'Nina', 'Una', 'Ella', 'Ela', 
                'Bruna', 'Matea', 'Paula', 'Doris', 'Gabriela', 'Jana'];

prezimena = ['Knežević', 'Horvat', 'Kovačević', 'Pavlović', 'Blažević', 'Božić', 'Lovrić', 'Babić', 
             'Marković', 'Bošnjak', 'Grgić', 'Brkić', 'Filipović', 'Vidović', 'Kovačić', 'Tomić', 
             'Jukić', 'Novak', 'Martinović', 'Petrović', 'Mandić', 'Šimunović', 'Nikolić', 'Jurković', 
             'Lončar', 'Barišić', 'Živković', 'Šimić', 'Jurić', 'Rukavina', 'Perković', 'Vučković', 
             'Lukić', 'Matijević', 'Novosel', 'Klarić', 'Pavić', 'Matković', 'Bašić', 'Antunović', 
             'Marušić', 'Ćosić', 'Kovač', 'Matić', 'Miletić', 'Posavec', 'Kralj', 'Vuković', 'Varga', 
             'Marjanović', 'Popović', 'Cindrić', 'Grubišić', 'Jakovljević', 'Dujmović', 'Novaković', 
             'Jurišić', 'Brajković', 'Ivančić', 'Perić', 'Galić', 'Ivanković', 'Bilić', 'Šimunić', 'Jozić', 
             'Crnković', 'Marić', 'Janković', 'Burić', 'Vrdoljak', 'Kolarić', 'Mitrović', 'Mikulić', 'Radić', 
             'Dragičević', 'Lučić', 'Vukelić', 'Đurđević', 'Jovanović', 'Grgurić', 'Jurčević', 'Vidaković', 
             'Petković', 'Ružić', 'Herceg', 'Abramović', 'Šarić', 'Đurić', 'Pavlić', 'Lončarić', 'Stanić', 
             'Cvitković', 'Butković', 'Katić', 'Josipović', 'Krznarić', 'Ivanović', 'Golubić', 'Jelić', 'Sever', 
             'Krizmanić', 'Štimac', 'Mihaljević', 'Jerković', 'Tadić', 'Radošević', 'Valentić', 'Bogdanović', 
             'Jakšić', 'Kolar', 'Ivanišević', 'Barić', 'Ljubić', 'Ljubičić', 'Pintarić', 'Milošević', 'Ivković', 
             'Mlinarić', 'Bačić', 'Erceg', 'Poljak', 'Andrić', 'Pejić', 'Vlahović', 'Špoljarić', 'Petrić', 
             'Turkalj', 'Pavelić', 'Tomašić', 'Jurjević', 'Dukić', 'Gregurić', 'Starčević', 'Mijatović', 
             'Glavaš', 'Stipić', 'Cvetković', 'Pavičić', 'Sekulić', 'Đukić', 'Ilić', 'Samardžić', 'Duvnjak', 
             'Budimir', 'Damjanović', 'Vlašić', 'Bartulović', 'Stojanović', 'Puškarić', 'Horvatić', 'Sertić', 
             'Bošković', 'Delić', 'Kordić', 'Majstorović', 'Bogdan', 'Tomašević', 'Kraljević', 'Rendulić', 
             'Vojnović', 'Zorić', 'Matanović', 'Ostojić', 'Rajković', 'Sabljak', 'Brčić', 'Jurčić', 
             'Meštrović', 'Kujundžić', 'Antolović', 'Knezović', 'Pavković', 'Petričević', 'Mišković', 
             'Pranjić', 'Devčić', 'Medved', 'Kos', 'Barbarić', 'Marinović', 'Vinković', 'Stanković', 
             'Kozina', 'Matijašević', 'Benković', 'Matošević', 'Mustapić', 'Turković', 'Golub', 'Bogović', 
             'Gudelj', 'Karlović', 'Franjić', 'Martić', 'Benčić', 'Hrženjak', 'Kurtović', 'Balić', 'Savić', 
             'Radočaj'];
             
spol = ['M', 'Z'];

uloga = ['Klijent', 'Djelatnik'];

num_insert = 60

ff = open('../inserts/tab_kontakt_inserts.sql','w', encoding="utf-8")

for i in range(num_insert):
    sp = '\'' +spol[random.randrange(2)]+'\''
    if random.uniform(0,1) <= 0.1:
        ul_ind = 1
    else:
        ul_ind = 0
    ul = '\'' +uloga[ul_ind]+'\''
    
    if sp == '\'' + 'M' + '\'':
        im = '\'' + muska_imena[random.randrange(len(muska_imena))] + '\''
    else:
        im = '\'' +zenska_imena[random.randrange(len(zenska_imena))] +'\''
    
    prz1 = '\'' + prezimena[random.randrange(len(prezimena))] + '\''
    if sp == '\'' + 'Z' + '\'':
        if random.randrange(2) == 1:
            prz2 = '\'' + prezimena[random.randrange(len(prezimena))] + '\''
        else:
            prz2 = 'NULL'
    else:
        prz2 = 'NULL'
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    if random.randrange(2) == 1:
        dat = 'TO_DATE(\'' +  str(random_date)+  '\',\'YYYY-MM-DD\')'
    else:
        dat =  'NULL' 
    lll = 'INSERT INTO osoba (ime, prezime, drugo_prezime, uloga, spol, datum_rodjenja)'+ ' VALUES (' + im +', ' + prz1 + ', ' + prz2 + ', ' +ul+', ' + sp +', ' + dat +');\n';
                
    ff.writelines(lll)

ff.close()
    
    
    
    