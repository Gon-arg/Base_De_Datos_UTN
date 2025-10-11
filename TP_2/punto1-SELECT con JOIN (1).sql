--1.Qué socios tienen barcos amarrados en un número de amarre mayor que 10?

SELECT s.nombre
FROM Socios s JOIN Barcos b ON s.id_socio=b.id_socio
WHERE b.numero_amarre>10;

--2.¿Cuáles son los nombres de los barcos y sus cuotas de aquellos barcos cuyo socio se llama 'Juan Pérez'?

SELECT b.nombre,b.cuota
FROM Barcos b JOIN Socios s ON s.id_socio=b.id_socio
WHERE s.nombre="Juan Pérez";

--3.¿Cuántas salidas ha realizado el barco con matrícula 'ABC123'?

SELECT COUNT(*) AS cantidad_de_salidas
FROM Barcos b JOIN Salidas s ON b.matricula=s.matricula
WHERE s.matricula="ABC123";

--4.Lista los barcos que tienen una cuota mayor a 500 y sus respectivos socios.

SELECT b.nombre AS barco,s.nombre AS socio
FROM Barcos b JOIN Socios s ON b.id_socio=s.id_socio
WHERE b.cuota>500;

--5.¿Qué barcos han salido con destino a 'Mallorca'?

SELECT b.nombre
FROM Barcos b JOIN Salidas sa ON b.matricula=sa.matricula
WHERE sa.destino="Mallorca";

--6.¿Qué patrones (nombre y dirección) han llevado un barco cuyo socio vive en 'Barcelona'?

SELECT sa.patron_nombre,sa.patron_direccion
FROM Socios s JOIN Barcos b ON S.id_socio=b.id_socio
              JOIN Salidas sa ON sa.matricula=b.matricula
WHERE s.direccion LIKE "%Barcelona%";