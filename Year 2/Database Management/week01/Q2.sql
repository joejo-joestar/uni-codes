USE       20220019db;

CREATE    TABLE pet (P_Name VARCHAR(32) PRIMARY KEY, P_Owner VARCHAR(32), Species VARCHAR(32), Sex CHAR(1), Birth DATE, Death DATE DEFAULT NULL);

INSERT    INTO pet
VALUES    ('Fluffy', 'Harold', 'Cat', 'f', '1993-02-04', NULL),
          ('Claws', 'Gwen', 'Cat', 'm', '1994-03-17', NULL),
          ('Buffy', 'Harold', 'Dog', 'f', '1989-05-13', NULL),
          ('Fang', 'Benny', 'Dog', 'm', '1990-08-27', NULL),
          ('Bowser', 'Diane', 'Dog', 'm', '1979-08-28', '1995/07/29'),
          ('Chirpy', 'Gwen', 'Bird', 'f', '1998-09-11', NULL),
          ('Whistler', 'Gwen', 'Bird', NULL, '1997-12-09', NULL),
          ('Slim', 'Benny', 'Snake', 'm', '1996-04-29', NULL),
          ('Puffball', 'Diane', 'Hamster', 'f', '1999-03-30', NULL);

-- Q1
SELECT    *
FROM      pet
WHERE     P_Name = 'Fang';

-- Q2
SELECT    *
FROM      pet
WHERE     P_Owner = 'Gwen';

-- Q3
SELECT    P_Owner
FROM      pet
WHERE     Species = 'Dog';

-- Q4
SELECT    *
FROM      pet
WHERE     Sex = 'f';

-- Q5
SELECT    Birth
FROM      pet
WHERE     Species = 'Hamster';

SELECT    *
FROM      pet;
