use clinica_medicala;
-- Dezactivăm temporar safe update pentru a putea șterge fără WHERE
SET SQL_SAFE_UPDATES = 0;

-- Ștergem datele din tabele în ordinea corectă (mai întâi tabele dependente)
DELETE FROM consultatii;
DELETE FROM programari;
DELETE FROM pacienti;
DELETE FROM medici;

-- Resetăm AUTO_INCREMENT pentru toate tabelele
ALTER TABLE medici AUTO_INCREMENT = 1;
ALTER TABLE pacienti AUTO_INCREMENT = 1;
ALTER TABLE programari AUTO_INCREMENT = 1;
ALTER TABLE consultatii AUTO_INCREMENT = 1;

-- Introducem medici
INSERT INTO medici (nume_medic, prenume_medic, specializare, telefon, email_medic) VALUES
('Popescu', 'Mihai', 'Cardiologie', '0723456789', 'mihai.popescu@clinica.ro'),
('Ionescu', 'Andreea', 'Dermatologie', '0733456789', 'andreea.ionescu@clinica.ro'),
('Georgescu', 'Radu', 'Pediatrie', '0744456789', 'radu.georgescu@clinica.ro'),
('Marin', 'Cristina', 'Neurologie', '0755456789', 'cristina.marin@clinica.ro'),
('Stan', 'Alin', 'Medicina Interna', '0766456789', 'alin.stan@clinica.ro');

-- Introducem pacienti
INSERT INTO pacienti (nume_pacient, prenume_pacient, cnp_pacient, data_nastere, sex_pacient, numar_telefon, email_pacient, adresa_pacient) VALUES
('Dumitrescu', 'Ioana', '2960101010011', '1996-01-01', 'F', '0721000001', 'ioana.dumitrescu@email.com', 'Str. Crizantemelor 10, Bucuresti'),
('Popa', 'Alexandru', '1950222020022', '1995-02-22', 'M', '0721000002', 'alex.popa@email.com', 'Str. Florilor 45, Bucuresti'),
('Iliescu', 'Maria', '2000303030033', '2000-03-03', 'F', '0721000003', 'maria.iliescu@email.com', 'Str. Rozelor 3, Cluj'),
('Stefan', 'Andrei', '1990404040044', '1999-04-04', 'M', '0721000004', 'andrei.stefan@email.com', 'Bd. Eroilor 100, Timisoara'),
('Vasile', 'Elena', '1970505050055', '1997-05-05', 'F', '0721000005', 'elena.vasile@email.com', 'Str. Independentei 22, Iasi'),
('Neagu', 'Robert', '1980606060066', '1998-06-06', 'M', '0721000006', 'robert.neagu@email.com', 'Str. Libertatii 9, Brasov');

-- Introducem programari (folosind id-uri valide)
INSERT INTO programari (id_pacient, id_medic, data_programare, ora_programare, status_programare) VALUES
(1, 1, '2025-08-15', '10:00:00', 'programata'),
(2, 2, '2025-08-16', '11:00:00', 'finalizata'),
(3, 3, '2025-08-17', '12:00:00', 'anulata'),
(4, 4, '2025-08-18', '13:00:00', 'finalizata'),
(5, 5, '2025-08-19', '09:30:00', 'programata'),
(6, 1, '2025-08-20', '14:00:00', 'neprezentat');

-- Introducem consultatii (corelat cu programarile de mai sus)
INSERT INTO consultatii (id_programare, simptome, diagnostic, recomandari, data_consultatie) VALUES
(2, 'Durere de cap, ameteli', 'Migrena', 'Odihna si hidratare', '2025-08-16'),
(4, 'Tuse si febra', 'Raceli', 'Antibiotice si repaus', '2025-08-18'),
(3, 'Erupții pe piele', 'Alergie cutanata', 'Antihistaminice', '2025-08-17');

-- Reactivăm safe update după ștergeri
SET SQL_SAFE_UPDATES = 1;
show tables;
use clinica_medicala;
SELECT * FROM pacienti LIMIT 10;
SELECT * FROM medici LIMIT 10;
SELECT * FROM programari LIMIT 10;
SELECT * FROM consultatii LIMIT 10;
