--tabla Clientes
CREATE TABLE Clientes (
    dni INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

--tabla Asuntos
CREATE TABLE Asuntos (
    numero_expediente INTEGER PRIMARY KEY,
    dni_cliente VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(100) CHECK (
    (estado = 'Abierto' AND fecha_fin IS NULL) OR
    (estado = 'Cerrado' AND fecha_fin IS NOT NULL)),
    FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

--tabla Procuradores
CREATE TABLE Procuradores (
    id_procurador INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

--tabla Asuntos_Procuradores
CREATE TABLE Asuntos_Procuradores (
    numero_expediente INT,
    id_procurador INT,
    FOREIGN KEY (numero_expediente) REFERENCES Asuntos(numero_expediente),
    FOREIGN KEY (id_procurador) REFERENCES Procuradores(id_procurador)
);