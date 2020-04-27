SELECT ime, prezime, naziv, broj, dodatak, naselje, teritorija, zupanija
FROM osoba o join adresa a ON (o.osb_id = a.osoba_osb_id)
join ulicenas ul ON (a.ul_mbr = ul.ul_mbr)
WHERE uloga = 'Djelatnik';