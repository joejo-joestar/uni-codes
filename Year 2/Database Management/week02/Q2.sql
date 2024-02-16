USE 20220019db;

CREATE TABLE
    pet (P_Name VARCHAR(32) PRIMARY KEY, P_Owner VARCHAR(32), Species VARCHAR(32), Sex CHAR(1), Birth DATE, Death DATE DEFAULT NULL);

INSERT INTO
    pet (P_Name, P_Owner, Species, Sex, Birth)
VALUES
    ('Fluffy', 'Harold', 'Cat', 'f', '1993-02-04'),
    ('Claws', 'Gwen', 'Cat', 'm', '1994-03-17'),
    ('Buffy', 'Harold', 'Dog', 'f', '1989-05-13'),
    ('Fang', 'Benny', 'Dog', 'm', '1990-08-27'),
    ('Bowser', 'Diane', 'Dog', 'm', '1979-08-28'),
    ('Chirpy', 'Gwen', 'Bird', 'f', '1998-09-11'),
    ('Whistler', 'Gwen', 'Bird', NULL, '1997-12-09'),
    ('Slim', 'Benny', 'Snake', 'm', '1996-04-29'),
    ('Puffball', 'Diane', 'Hamster', 'f', '1999-03-30');

UPDATE pet
SET
    death = '1995/07/29'
WHERE
    P_Name = 'Bowser';

SELECT
    *
FROM
    pet
WHERE
    P_Name = 'Fang';

SELECT
    *
FROM
    pet
WHERE
    P_Owner = 'Gwen';

SELECT
    P_Owner
FROM
    pet
WHERE
    Species = 'Dog';

SELECT
    *
FROM
    pet
WHERE
    Sex = 'f';

SELECT
    Birth
FROM
    pet
WHERE
    Species = 'Hamster';

SELECT
    *
FROM
    pet;