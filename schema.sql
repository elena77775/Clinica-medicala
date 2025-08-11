DROP DATABASE IF EXISTS clinica_medicala;
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