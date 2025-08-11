# Clinica Medicală – Proiect MySQL

Acest proiect reprezintă o bază de date pentru gestionarea pacienților, medicilor, programărilor și consultațiilor dintr-o clinică medicală.

## Conținut

### Structura bazei de date:

- pacienti: informații personale despre pacienți
- medici: specializările și contactele medicilor
- programari: istoricul programărilor între pacienți și medici
- consultatii: detalii despre consultațiile efectuate

### Tipuri de comenzi SQL utilizate:

#### DQL (Data Query Language):
- SELECT * – toate datele
- SELECT coloane – extragere selectivă
- WHERE, LIKE, AND, OR – filtrare
- Funcții agregate: COUNT, GROUP BY, HAVING
- Sortare: ORDER BY
- Limitare: LIMIT

#### JOIN-uri:
- INNER JOIN: doar înregistrările care se potrivesc în ambele tabele
- LEFT JOIN: toate înregistrările din stânga + cele corespunzătoare din dreapta
- RIGHT JOIN: toate înregistrările din dreapta + cele corespunzătoare din stânga
- CROSS JOIN: produs cartezian (toate combinațiile posibile)

### Cerințe demonstrate:

- Inserare de date în toate tabelele (DML: INSERT)
- Ștergere și actualizare (DML: DELETE, UPDATE)
- Resetarea datelor (TRUNCATE, ALTER, DELETE)
- Interogări avansate de extragere date (SELECT, JOIN, GROUP BY, etc.)

## Observații

- Cheile primare (PRIMARY KEY) sunt pe coloanele de tip id
- Cheile externe (FOREIGN KEY) sunt folosite pentru a lega relațiile între entități (ex: programări cu pacienți/medici)
- Relațiile sunt de tip:
  - 1:N între medici și programari
  - 1:N între pacienti și programari
  - 1:1 între programari și consultatii

