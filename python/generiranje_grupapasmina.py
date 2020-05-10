# -*- coding: utf-8 -*-
"""
Created on Sun May 10 23:56:32 2020

@author: Korisnik
"""

# -*- coding: utf-8 -*-
"""
Created on Sat May  9 14:11:38 2020

@author: Korisnik
"""


br_grp = 10;
br_pasm = 418
text_opisa = 'Nunc ac faucibus odio. Vestibulum neque massa, scelerisque sit amet ligula eu, congue molestie mi. Praesent ut varius sem. Nullam at porttitor arcu, nec lacinia nisi. Ut ac dolor vitae odio interdum condimentum. Vivamus dapibus sodales ex, vitae malesuada ipsum cursus convallis. Maecenas sed egestas nulla, ac condimentum orci. Mauris diam felis, vulputate ac suscipit et, iaculis non est. Curabitur semper arcu ac ligula semper, nec luctus nisl blandit. Integer lacinia ante ac libero lobortis imperdiet. Nullam mollis convallis ipsum, ac accumsan nunc vehicula vitae. Nulla eget justo in felis tristique fringilla. Morbi sit amet tortor quis risus auctor condimentum. Morbi in ullamcorper elit. Nulla iaculis tellus sit amet mauris tempus fringilla. Maecenas mauris lectus, lobortis et purus mattis, blandit dictum tellus. Maecenas non lorem quis tellus placerat varius. Nulla facilisi. Aenean congue fringilla justo ut aliquam. Mauris id ex erat. Nunc vulputate neque vitae justo facilisis, non condimentum ante sagittis. Morbi viverra semper lorem nec molestie. Maecenas tincidunt est efficitur ligula euismod, sit amet ornare est vulputate. In non mauris justo. Duis vehicula mi vel mi pretium, a viverra erat efficitur. Cras aliquam est ac eros varius, id iaculis dui auctor. Duis pretium neque ligula, et pulvinar mi placerat et. Nulla nec nunc sit amet nunc posuere vestibulum. Ut id neque eget tortor mattis tristique. Donec ante est, blandit sit amet tristique vel, lacinia pulvinar arcu. Pellentesque scelerisque fermentum erat, id posuere justo pulvinar ut. Cras id eros sed enim aliquam lobortis. Sed lobortis nisl ut eros efficitur tincidunt. Cras justo mi, porttitor quis mattis vel, ultricies ut purus. Ut facilisis et lacus eu cursus. In eleifend velit vitae libero sollicitudin euismod. Fusce vitae vestibulum velit. Pellentesque vulputate lectus quis pellentesque commodo. Aliquam erat volutpat. Vestibulum in egestas velit. Pellentesque fermentum nisl vitae fringilla venenatis. Etiam id mauris vitae orci maximus ultricies. Cras fringilla ipsum magna, in fringilla dui commodo a. Etiam vehicula luctus fermentum. In vel metus congue, pulvinar lectus vel, fermentum dui. Maecenas ante orci, egestas ut aliquet sit amet, sagittis a magna. Aliquam ante quam, pellentesque ut dignissim quis, laoreet eget est. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut ullamcorper justo sapien, in cursus libero viverra eget. Vivamus auctor imperdiet urna, at pulvinar leo posuere laoreet. Suspendisse neque nisl, fringilla at iaculis scelerisque, ornare vel dolor. Ut et pulvinar nunc. Pellentesque fringilla mollis efficitur. Nullam venenatis commodo imperdiet. Morbi velit neque, semper quis lorem quis, efficitur dignissim ipsum. Ut ac lorem sed turpis imperdiet eleifend sit amet id sapien.'

#ind_imena = list(range(len(br_pasm)))
#random.shuffle(ind_imena)
#ind_imena = ind_imena[0:100]

def prep(x):
    if str(x) == 'NULL':
        return str(x)
    elif type(x) == datetime.date:
        return 'TO_DATE(\'' + str(x) + '\', \'YYYY-MM-DD\')'
    elif type(x) == int or type(x) == float or type(x) == np.float64:
        return str(x)
    else:
        return '\'' + str(x) + '\''
    


# =============================================================================
# CREATE TABLE proizvod (
#     naziv            VARCHAR2(100) NOT NULL,
#     opis             CLOB,
#     barkod           VARCHAR2(20),
#     jedinica_mjere   VARCHAR2(5 CHAR),
#     "duzina_(mm)"    INTEGER,
#     "sirina_(mm)"    INTEGER,
#     "visina_(mm)"    INTEGER,
#     "volumen_(l)"    INTEGER,
#     prz_id           NUMBER NOT NULL
# );

# =============================================================================


# =============================================================================
# CREATE TABLE promjena (
#     tip                   VARCHAR2(20) NOT NULL,
#     od                    DATE NOT NULL,
#     do                    DATE,
#     iznos                 FLOAT,
#     prm_id                NUMBER NOT NULL,
#     grupapasmina_gus_id   NUMBER NOT NULL,
#     proizvod_prz_id       NUMBER,
#     usluga_usl_id         NUMBER
# );
# =============================================================================




ffgrupapasmina = open('../inserts/tab_grupapasmina_inserts.sql','w', encoding="utf-8")

for i in range(br_grp):
    
    naziv = 'Groupa ' + str(i+1) + '.'
    
    
    lll = 'INSERT INTO grupapasmina (naziv, opis)'+ ' VALUES (' + prep(naziv) +', '  + prep(text_opisa) +' );\n';
    ffgrupapasmina.writelines(lll);

ffgrupapasmina.close()
    
    
    
    
        
    


