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