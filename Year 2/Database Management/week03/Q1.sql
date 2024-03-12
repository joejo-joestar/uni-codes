
USE       20220019db;

CREATE    TABLE part (pno INT AUTO_INCREMENT PRIMARY KEY, pname VARCHAR(32), price INT);

CREATE    TABLE supplier (sno INT PRIMARY KEY, sname VARCHAR(32), city VARCHAR(32));

CREATE    TABLE sells (sno INT, pno INT, FOREIGN KEY (pno) REFERENCES part (pno) ON DELETE CASCADE, FOREIGN KEY (sno) REFERENCES supplier (sno) ON DELETE CASCADE);

INSERT    INTO part
VALUES    (1, "Screw", 10),
          (2, "Nut", 8),
          (3, "Bolt", 15),
          (4, "Cam", 25);

INSERT    INTO supplier
VALUES    (1, "Smith", "London"),
          (2, "Jones", "Paris"),
          (3, "Adams", "Vienna"),
          (4, "Blake", "Rome");

INSERT    INTO sells
VALUES    (1, 1),
          (1, 2),
          (2, 4),
          (3, 3),
          (3, 1),
          (4, 2),
          (4, 3),
          (4, 4);

--Q1
SELECT    pname
FROM      sells AS se,
          part AS pa,
          supplier AS su
WHERE     se.sno = su.sno
AND       se.pno = pa.pno
AND       su.sname = "Smith";

-- Q2
SELECT    *
FROM      part
ORDER BY  price DESC
LIMIT     1;

-- Q3
SELECT    su.sno,
          sname,
          COUNT(*) AS pcount
FROM      supplier AS su,
          sells AS se
WHERE     su.sno = se.sno
GROUP BY  su.sno
ORDER BY  pcount DESC
LIMIT     1;

-- Q4
SELECT    su.sno,
          sname
FROM      part AS pa,
          supplier AS su,
          sells AS se
WHERE     su.sno = se.sno
AND       se.pno = pa.pno
AND       pa.pname = "Nut";

-- Q5
SELECT    DISTINCT (pa.pname)
FROM      Supplier AS su,
          Sells AS se,
          Part AS pa
WHERE     (su.sno = se.sno)
AND       (pa.pno = se.pno)
AND       (su.city != 'Vienna');
