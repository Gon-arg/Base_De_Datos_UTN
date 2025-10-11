--1.¿Qué socios tienen barcos amarrados en un número de amarre mayor que 10?

SELECT nombre
FROM Socios
WHERE id_socio IN (SELECT id_socio
                FROM Barcos
                WHERE numero_amarre > 10);

--2.¿Cuáles son los nombres de los barcos y sus cuotas de aquellos barcos cuyo socio se llama 'Juan Pérez'?

SELECT nombre,cuota
FROM Barcos
WHERE id_socio = (SELECT id_socio
                  FROM Socios
                  WHERE nombre="Juan Pérez");

--3.¿Cuántas salidas ha realizado el barco con matrícula 'ABC123'?

SELECT COUNT(nombre) AS cantidad_de_salidas
FROM Barcos
WHERE matricula=(SELECT matricula
                 FROM Salidas
                 WHERE matricula="ABC123");

--4.Lista los barcos que tienen una cuota mayor a 500 y sus respectivos socios.

SELECT b.nombre AS barco, (SELECT s.nombre
                           FROM Socios s
                           WHERE s.id_socio=b.id_socio) AS socio
FROM Barcos b
WHERE cuota>500;

--5.¿Qué barcos han salido con destino a 'Mallorca'?

SELECT nombre
FROM Barcos
WHERE matricula IN (SELECT matricula
                 FROM Salidas
                 WHERE destino="Mallorca");

--6.¿Qué patrones (nombre y dirección) han llevado un barco cuyo socio vive en 'Barcelona'?

SELECT patron_nombre,patron_direccion
FROM Salidas
WHERE matricula IN (SELECT matricula
                    FROM Barcos
                    WHERE id_socio IN (SELECT id_socio
                                       FROM Socios
                                       WHERE direccion LIKE "%Barcelona%"));
