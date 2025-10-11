--tabla Socios
CREATE TABLE Socios (
    id_socio INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

--tabla Barcos
CREATE TABLE Barcos (
    matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    numero_amarre INT,
    cuota DECIMAL(10, 2),
    id_socio INT,
    FOREIGN KEY (id_socio) REFERENCES Socios(id_socio)
);

--tabla Salidas
CREATE TABLE Salidas (
    id_salida INTEGER PRIMARY KEY,
    matricula VARCHAR(20),
    fecha_salida DATE,
    hora_salida TIME,
    destino VARCHAR(100),
    patron_nombre VARCHAR(100),
    patron_direccion VARCHAR(255),
    FOREIGN KEY (matricula) REFERENCES Barcos(matricula)
);