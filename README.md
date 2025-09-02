# Proiect Testare Manuală SQL - Baza de Date "Clinica Medicala"

Acest proiect reprezintă o bază de date simplă pentru managementul unei clinici medicale, creată în cadrul cursului de Testare Manuală.

## Descrierea Proiectului

Baza de date gestionează informații despre pacienți, medici, programări și consultații. Structura a fost concepută pentru a permite înregistrarea și interogarea eficientă a datelor medicale.


## 1. Script de Creare a Tabelelor (creare_tabele.sql)

Acest script creează întreaga structură a bazei de date, inclusiv tabelele, cheile primare, cheile secundare și relațiile dintre ele.
CREATE DATABASE clinica_medicala;
USE clinica_medicala;

CREATE TABLE pacienti (
    id_pacient INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nume_pacient VARCHAR(50),
    prenume_pacient VARCHAR(50),
    cnp_pacient CHAR(13) UNIQUE,
    data_nastere DATE,
    sex_pacient ENUM('M', 'F'),
    numar_telefon VARCHAR(15),
    email_pacient VARCHAR(50),
    adresa_pacient TEXT
);

CREATE TABLE medici (
    id_medic INT AUTO_INCREMENT PRIMARY KEY,
    nume_medic VARCHAR(50),
    prenume_medic VARCHAR(50),
    specializare VARCHAR(50),
    telefon VARCHAR(50),
    email_medic VARCHAR(100)
);

CREATE TABLE programari (
    id_programare INT AUTO_INCREMENT PRIMARY KEY,
    id_pacient INT,
    id_medic INT,
    data_programare DATE,
    ora_programare TIME,
    status_programare ENUM('programata', 'finalizata', 'anulata', 'neprezentat') DEFAULT 'programata',
    FOREIGN KEY (id_pacient) REFERENCES pacienti(id_pacient),
    FOREIGN KEY (id_medic) REFERENCES medici(id_medic)
);

CREATE TABLE consultatii (
    id_consultatie INT AUTO_INCREMENT PRIMARY KEY,
    id_programare INT UNIQUE,
    simptome TEXT,
    diagnostic TEXT,
    recomandari TEXT,
    data_consultatie DATE,
    FOREIGN KEY (id_programare) REFERENCES programari(id_programare)
);

## 2. Script de Inserare a Datelor (inserare_date.sql)

Acest script populează tabelele create cu date de test pentru a permite interogarea.

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

## 3. Exemple de Interogări (interogari.sql)

Mai jos sunt câteva exemple de interogări DQL (Data Query Language) pentru a extrage informații relevante din baza de date.

-- Selectăm baza de date
USE clinica_medicala;

-- 1. SELECT * – toate coloanele și rândurile din tabelul "pacienti"
SELECT * FROM pacienti;

-- 2. SELECT câteva coloane – afișăm doar numele, prenumele și emailul pacienților
SELECT nume_pacient, prenume_pacient, email_pacient FROM pacienti;

-- 3. WHERE – afișăm doar medicii care au specializarea 'Cardiologie'
SELECT * FROM medici WHERE specializare = 'Cardiologie';

-- 4. LIKE – căutăm pacienții al căror nume începe cu "Po"
SELECT * FROM pacienti WHERE nume_pacient LIKE 'Po%';

-- 5. AND – selectăm pacientele (F) născute după 1 ianuarie 1990
SELECT * FROM pacienti
WHERE sex_pacient = 'F' AND data_nastere > '1990-01-01';

-- 6. OR – afișăm medicii care sunt fie dermatologi, fie neurologi
SELECT * FROM medici
WHERE specializare = 'Dermatologie' OR specializare = 'Neurologie';

-- 7. COUNT – numărăm câți pacienți există în total
SELECT COUNT(*) AS total_pacienti FROM pacienti;

-- 8. GROUP BY + HAVING – medicii cu mai mult de 5 programări
SELECT id_medic, COUNT(*) AS nr_programari
FROM programari
GROUP BY id_medic
HAVING COUNT(*) > 5;

-- 9. INNER JOIN – numele pacientului, al medicului și data programării
SELECT p.nume_pacient, m.nume_medic, pr.data_programare
FROM programari pr
INNER JOIN pacienti p ON pr.id_pacient = p.id_pacient
INNER JOIN medici m ON pr.id_medic = m.id_medic;

-- 10. LEFT JOIN – toți medicii și programările lor (dacă există)
SELECT m.nume_medic, pr.data_programare
FROM medici m
LEFT JOIN programari pr ON m.id_medic = pr.id_medic;

-- 11. RIGHT JOIN – toate programările și numele medicilor (dacă există)
SELECT m.nume_medic, pr.data_programare
FROM programari pr
RIGHT JOIN medici m ON pr.id_medic = m.id_medic;

-- 12. CROSS JOIN – combinații între pacienți și medici
SELECT p.nume_pacient, m.nume_medic
FROM pacienti p
CROSS JOIN medici m;

-- 13. ORDER BY – pacienți în ordine descrescătoare după data nașterii
SELECT * FROM pacienti
ORDER BY data_nastere DESC;

-- 14. LIMIT – cei mai tineri 5 pacienți
SELECT * FROM pacienti
ORDER BY data_nastere ASC
LIMIT 5;
-- etc...

