--1.¿Cuál es el nombre y la dirección de los procuradores que han trabajado en un asunto abierto?

SELECT p.nombre,p.direccion
FROM Procuradores p JOIN Asuntos_Procuradores ap ON p.id_procurador=ap.id_procurador
                    JOIN Asuntos a ON ap.numero_expediente=a.numero_expediente
WHERE a.estado="Abierto";

--2.¿Qué clientes han tenido asuntos en los que ha participado el procurador Carlos López?

SELECT c.nombre
FROM Clientes c JOIN Asuntos a ON a.dni_cliente=c.dni
                JOIN Asuntos_Procuradores ap ON ap.numero_expediente=a.numero_expediente
                JOIN Procuradores p ON p.id_procurador=ap.id_procurador
WHERE p.nombre="Carlos López";

--3.¿Cuántos asuntos ha gestionado cada procurador?

SELECT p.nombre,COUNT(a.numero_expediente) AS expedientes
FROM Procuradores p JOIN Asuntos_Procuradores ap ON p.id_procurador=ap.id_procurador
                    JOIN Asuntos a ON a.numero_expediente=ap.numero_expediente
GROUP BY p.id_procurador

--4.Lista los números de expediente y fechas de inicio de los asuntos de los clientes que viven en Buenos Aires.

SELECT a.numero_expediente,a.fecha_inicio
FROM Clientes c JOIN Asuntos a ON c.dni=a.dni_cliente
WHERE c.direccion LIKE "%Buenos Aires%";
